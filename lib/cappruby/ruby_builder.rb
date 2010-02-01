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
        # same, for args
        @arg_names = { }
        # has a value, other than nil, of the str used to set the block param
        # e.g. def method(&adam)' end ... this will be "adam", incase we 
        # reference it. The block always points to _$, whether we name it or not
        @block_name = nil
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
      
      def type
        @type
      end
      
      def local_current
        @local_current
      end
      
      def local_current=(s)
        @local_current = s
      end
      
      def write(str)
        @code << str
      end
      
      # When we set this, if we are a blcok, then we need to set our 
      # @local current to that of the parent, and then, when we finish, set the
      # parents to be what ours finishes at. This avoids clashing local var 
      # names.
      # 
      # Doing it this way avoids us including these vars, declared in the block
      # as vars in the method. they are vas just for the block.
      def parent_iseq=(other)
        @parent_iseq = other
        
        if @type == RubyBuilder::ISEQ_TYPE_BLOCK
          @local_current = other.local_current
        end
      end
      
      # finalizes, as described above
      def finalize
        if @type == RubyBuilder::ISEQ_TYPE_BLOCK
          @parent_iseq.local_current =  @local_current
        end
      end
      
      # looks u; the local name "str". This checks method arguments as well as
      # local variables defined. If we have the local, then the string version
      # of the minimized name is returned (e.g. _a, _b..... etc), or if we do
      # not have it, then nil is returned.
      # 
      # Also of note, this also checks if the str is the name of the block that
      # was declared (if a method). A block &block is not an arg or a local, but
      # can be referecenced if declared as a method "argument". These are stored
      # as the local var _$, if present.
      def lookup_local(str)
        if @local_names.has_key? str
          @local_names[str]
        elsif @arg_names.has_key? str
          @arg_names[str]
        elsif @block_name
          "_$"
        else
          if @type == RubyBuilder::ISEQ_TYPE_BLOCK
            return @parent_iseq.lookup_local(str)
          end
          # if we are a block, check parent...
          nil
        end
      end
      
      # push arg name, and returns the "minimized version"
      def push_arg_name(str)
        @local_current = @local_current.next
        @arg_names[str] = "_#{@local_current}"
        "_#{@local_current}"
      end
      
      # push local name, and returns the "minimized version"
      def push_local_name(str)
        @local_current = @local_current.next
        @local_names[str] = "_#{@local_current}"
        "_#{@local_current}"
      end
      
      # set the block name, if present
      def push_block_name(str)
        @block_name = str
        "_$"
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
          @arg_names.each_value { |v| r << ",#{v}" }
        when RubyBuilder::ISEQ_TYPE_CLASS
          # _a is self (the class just created/modified)
          r << "function(_a"
        when RubyBuilder::ISEQ_TYPE_BLOCK
          # no self, just args etc..
          r << "function("
          r << @arg_names.each_value.to_a.join(",")
        else
          abort "erm, unknwon iseq type"
        end
        
        r << "){"
        # locals
        if @local_names.length > 0
          r << "var #{@local_names.each_value.to_a.join(", ")};"
        end
        
        r << "#{@code.join("")}}"
        
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
      # finalize (var locals etc)
      iseq.finalize
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
      if stmt[:arglist].arg
        stmt[:arglist].arg.each { |a| @iseq_current.push_arg_name a[:value] }
      end
      
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
      # capture "function calls"
      if call[:meth].match(/^[A-Z](.*)$/)
        return generate_function_call call, context
      end
      # capture objj
      
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
      
      # assocs
      if call[:call_args] and call[:call_args][:assocs]
        write "," unless call[:call_args].nil? or call[:call_args][:args].nil?
        write "cr_newhash("
        call[:call_args][:assocs].each do |assoc|
          write "," unless call[:call_args][:assocs].first == assoc
          generate_stmt assoc[:key], :full_stmt => false, :last_stmt => false
          write ","
          generate_stmt assoc[:value], :full_stmt => false, :last_stmt => false
        end
        write ")"
      end
      
      write "]"
      write ","
      
      # block
      if call[:brace_block]
        current_iseq = @iseq_current
        block_iseq = iseq_stack_push(ISEQ_TYPE_BLOCK)
        block_iseq.parent_iseq = current_iseq
        
        # block arg names
        if call[:brace_block][:params]
          call[:brace_block][:params].each do |p|
            block_iseq.push_arg_name p[:value]
          end
        end
        
        # block stmts
        if call[:brace_block][:stmt]
          call[:brace_block][:stmt].each do |a|
            generate_stmt a, :full_stmt => true, :last_stmt => call[:brace_block][:stmt].last == a
          end
        end
        
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
    
    def generate_function_call call, context
      write "return " if context[:last_stmt] and context[:full_stmt]
      
      write "cr_functioncall(\""
      write call[:meth]
      write "\",["
      
      unless call[:call_args].nil? or call[:call_args][:args].nil?
        call[:call_args][:args].each do |arg|
          write "," unless call[:call_args][:args].first == arg
          generate_stmt arg, :full_stmt => false
        end
      end
      
      write "])"
      
      write ";" if context[:full_stmt]
    end
    
    def generate_identifier id, context
      write "return " if context[:last_stmt] and context[:full_stmt]
      
      local = @iseq_current.lookup_local id[:name]
      if local
        write local
      else
        # cannot find local, so we assume it is a function call...
        write %{cr_send(_a,"#{id[:name]}",[],nil,8)}
      end
      
      write ";" if context[:full_stmt]
    end
    
    # similar to def, but for calls (not objj style calls..)
    def gen_call_should_use_colon?(c)
      # basically, if a "special" method using ruby only things, then dont use
      # a colon
      return false if c[:meth].match(/(\<|\!|\?\>\=\!)/)
      
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
    
    def generate_symbol sym, context
      write %{ID2SYM("#{sym[:name]}")}
    end
    
    def generate_constant cnst, context
      write %{cr_getconstant(_a,"#{cnst[:name]}")}
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
    
    def generate_assign stmt, context
      write "return " if context[:last_stmt] and context[:full_stmt]
      
      # LHS is an identifier (local)
      if stmt[:lhs].node == :identifier
        # check to see if it already exists, i.e. reusing old name
        local = @iseq_current.lookup_local stmt[:lhs][:name]
        unless local
          # cannot find local, so we must make it
          local = @iseq_current.push_local_name stmt[:lhs][:name]
        end
        
        write "#{local} = "
        # RHS
        generate_stmt stmt[:rhs], :full_stmt => false, :last_stmt => false
      else
        abort "unknown assign type: #{stmt[:lhs].node}"
      end
      
      write ";" if context[:full_stmt]
    end
    
    def generate_op_asgn(stmt, context)
      write "return " if context[:full_stmt] and context[:last_stmt]
      
      if stmt[:lhs].node == :ivar
        write %{(function(asgn)\{if(asgn!==nil && asgn!==undefined)\{}
        write %{return asgn;\}else\{}
        write "rb_ivar_set(_a, '#{stmt[:lhs][:name]}',"
        generate_stmt stmt[:rhs], :full_stmt => false, :last_stmt => false
        write ")"
        write %{\}\})(rb_ivar_get(_a,"#{stmt[:lhs][:name]}"))}
      else
        abort "bad op_asgn lhs: #{stmt[:lhs].node}"
      end
      
      write ";" if context[:full_stmt]
    end
  end
end
