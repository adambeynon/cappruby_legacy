# 
# ruby_builder.rb
# cappruby
# 
# Created by Adam Beynon.
# Copyright 2010 Adam Beynon.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

module CappRuby
  
  class RubyBuilder < ::Vienna::RubyParser
    
    def initialize(source, project, build_name)
      super
    end
    
    class CappIseq
      
      def initialize(type)
        # iseq type
        @type = type
        # names => minimixed names (i.e. letters)
        @local_names = { }
        # current to use for minimized. 'a' is always self, so we start there
        # and increment one time for every new local in context.
        @local_current = 'a'
        # Also, if type is a method, then we need room for a selector aswell:
        if type == RubyBuilder::ISEQ_TYPE_METHOD
          @local_current = @local_current.next
        end
        
        
        # to store code strings
        @code = []
      end
      
      def write(str)
        @code << str
      end
      
      def parent_iseq=(other)
        @parent_iseq = other
      end
      
      # looks u; the local name "str". This checks method arguments as well as
      # local variables defined. If we have the local, then the string version
      # of the minimized name is returned (e.g. _a, _b..... etc), or if we do
      # not have it, then nil is returned.
      def lookup_local(str)
        
      end
      
      def to_s
        r = ""
        # function should accept self. if a method type, then accept "sel" for
        # selector, if block, dont add self, just args. top and class also 
        # accept just "self" - self is always _a
        # puts @code
        case @type
        when RubyBuilder::ISEQ_TYPE_TOP
          # _a is self (top self)
          r << "function(_a"
        when RubyBuilder::ISEQ_TYPE_METHOD
          # _a is self, _b is the selector
          r << "function(_a,_b"
        when RubyBuilder::ISEQ_TYPE_CLASS
          # _a is self (the class just created/modified)
          r << "function(_a"
        when RubyBuilder::ISEQ_TYPE_BLOCK
          # no self, just args etc..
          r << "function("
        else
          abort "erm, unknwon iseq type"
        end
        
        r << "){#{@code.join("")}}"
        
        r
      end
      
    end
    
    def iseq_stack_push type
      @iseq_current = CappIseq.new type
      @iseq_stack << @iseq_current
      @iseq_current
    end
    
    def iseq_stack_pop
      iseq = @iseq_stack.last
      @iseq_stack.pop
      @iseq_current = @iseq_stack.last
      iseq.to_s
    end
    
    def generate_tree(tree)
      top_iseq = iseq_stack_push ISEQ_TYPE_TOP
      tree.each do |stmt|
        generate_stmt stmt, :full_stmt => true, :last_stmt => tree.last == stmt
      end
      iseq_stack_pop
    end
    
    def generate_class(cls, context)
      write "return " if context[:last_stmt] and context[:full_stmt]
      
      current_iseq = @iseq_current
      class_iseq = iseq_stack_push ISEQ_TYPE_CLASS
      class_iseq.parent_iseq = current_iseq
      
      # do each body stmt, but for now, assume nonoe
      cls.bodystmt.each do |b|
        generate_stmt b, :full_stmt => true, :last_stmt => b == cls.bodystmt.last
      end
      
      if cls.bodystmt.length == 0
        write "return nil;"
      end
      
      iseq_stack_pop
      
      write %{cr_defineclass(nil,nil,"#{cls.klass_name}",#{class_iseq},0)}
      
      write ";" if context[:full_stmt]
    end
    
    def generate_def stmt, context
      #    work out if its an objj style method call..
      
      write "return " if context[:last_stmt] and context[:full_stmt]
      
      is_singleton = stmt[:singleton] ? 1 : 0
      
      current_iseq = @iseq_current
      def_iseq = iseq_stack_push(ISEQ_TYPE_METHOD)
      def_iseq.parent_iseq = current_iseq
      
      # arg names
      
      # body stmts
      stmt[:bodystmt].each do |b|
        generate_stmt b, :full_stmt => true, :last_stmt => b == stmt[:bodystmt].last
      end
      
      iseq_stack_pop
      
      # definemethod
      write "cr_definemethod("
      
      # base (singleton?)
      if stmt[:singleton]
        generate_stmt stmt[:singleton], :full_stmt => false, :last_stmt => false
      else
        # self
        write "_a"
      end
      
      # method returns true if our normal method should add a colon onto the
      # selector name (i.e. it takes either exactly 1 param, or it takes a 
      # single default param.. this might be the case, we just add a defailt
      # value to the selector:)
      sel_colon = gen_def_should_use_colon?(stmt[:arglist]) ? ":" : ""
      
      write %{,"#{stmt[:fname]}#{sel_colon}",#{def_iseq},#{is_singleton})}
      
      write ";" if context[:full_stmt]
    end
    
    # method returns true if our normal method should add a colon onto the
    # selector name (i.e. it takes either exactly 1 param, or it takes a 
    # single default param.. this might be the case, we just add a defailt
    # value to the selector:)
    def gen_def_should_use_colon?(a)
      # one normal arg, nothing else (block is irrelevant)
      if a.arg_size==1 && a.opt_size== 0 && a.rest_size == 0 && a.post_size == 0
        true
      elsif a.arg_size==0 && a.opt_size==1 && a.rest_size==0 && a.post_size == 0
        true
      else
        false
      end
    end
    
    def generate_call call, context
      write "return " if context[:last_stmt] and context[:full_stmt]
      
      write %{cr_send(}
      # receiver
      if call[:recv]
        call_bit = 0
        generate_stmt call[:recv], :full_stmt => false, :last_stmt => false
      else
        call_bit = 8
        # self as recv
        write "_a"
      end
      
      write ","
      # method id - we should look for adding a selector here..
      sel_colon = gen_call_should_use_colon?(call) ? ":" : ""
      write %{"#{call[:meth]}#{sel_colon}"}
      
      write ","
      
      # arguments
      write "["
      unless call[:call_args].nil? or call[:call_args][:args].nil?
        call[:call_args][:args].each do |arg|
          write "," unless call[:call_args][:args].last == arg
          generate_stmt arg, :full_stmt => false
        end
      end
      write "]"
      write ","
      
      # block
      if call[:brace_block]
        current_iseq = @iseq_current
        block_iseq = iseq_stack_push(ISEQ_TYPE_BLOCK)
        block_iseq.parent_iseq = current_iseq
        iseq_stack_pop
        
        write block_iseq.to_s
      else
        write "nil"
      end
      write ","
      
      # op flag
      write "#{call_bit})"
      
      write ";" if context[:full_stmt]
    end
    
    # similar to def, but for calls (not objj style calls..)
    def gen_call_should_use_colon?(c)
      args_len = 0
      if c[:call_args] and c[:call_args][:args]
        args_len = args_len + c[:call_args][:args].length
      end
      
      if c[:call_args] and c[:call_args][:assocs]
        args_len = args_len + 1
      end
      
      # essentially, true if only one arg..
      (args_len == 1) ? true : false
    end
    
    def generate_self stmt, context
      write "_a"
    end
    
    # Generate a yield stmt. This makes sure the current iseq is a method, as
    # only methods can "yield".. also, sets the current iseq to "get block". We
    # know the method uses a block, so we need to make sure we can get it, and
    # put it into a local var.
    def generate_yield stmt, context
      write "\"block\""
    end
    
    def generate_string str, context
      write %{"#{str[:value][0][:value]}"}
    end
    
    def generate_numeric num, context
      write num[:value]
    end
    
    def generate_array ary, context
      write "["
      if ary[:args]
        ary[:args].each do |a|
          write "," unless ary[:args].first == a
          generate_stmt a, :full_stmt => false, :last_stmt => false
        end
      end
      
      write "]"
    end
    
    def generate_xstring stmt, context
      write "return " if context[:last_stmt] and context[:full_stmt]
      write stmt[:value][0][:value]
      write ";" if context[:full_stmt]
    end
  end
end
