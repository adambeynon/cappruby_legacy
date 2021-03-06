# Currently modules dont exist, so cheat and add Kernel's methods directly into
# CPObject.
class Object
  
  def puts(*args)
    args.each do |arg|
      `(typeof CPLogPrint !== 'undefined') 
        ? print(#{arg}) 
        : CPLogConsole(#{arg}, 'log', "")`
    end
    nil
  end
  
  def nil?
    false
  end
  
  def ==(other)
    `#{self} === #{other}` ? true : false
  end
  
  def ===(other)
    self == other
  end
  
  def tap
    yield self
    self
  end
  
  def =~(matcher)
    nil
  end
  
  def !~(matcher)
    self =~ obj ? false : true
  end
  
  def eql?(other)
    `#{self} === #{other}` ? true : false
  end
  
  def raise(exception, string)
    # puts "going to raise error.."
    # puts exception
    # puts exception.is_a?(Exception)
    # puts "exception class: #{exception.class}"
    msg = ""
    if exception.is_a? String
      # puts "string"
      msg = exception
      exc = RuntimeError.new msg
    elsif exception.is_a? Exception
      # puts "exception"
      exc = exception
    else
      # puts "its a class"
      msg = string # if string
      exc = exception.new msg
    end
    
    `rb_raise(#{exc})`
    self
  end
  
  # alias_method :fail, :raise
  
  def object_id
    `objj_msgSend(#{self}, 'UID')`
  end
  
  def respond_to?(method_id)
    respondsToSelector method_id.to_s
  end
  
  def to_s
    description
  end
  
  def inspect
    to_s
  end
  
  def __send__ method, arg
    puts "in send for #{method} from #{self.inspect}"
    puts self
    # meth
    result = `rb_call(#{self}, #{method} + ':', #{arg})`
    # result = `cappruby_msgSend(#{self}, 'inspect', #{arg})`
    puts "result is: #{result.inspect}"
    result
  end
  
  def instance_of? cls
    isMemberOfClass cls
  end
  
  def kind_of? cls
    isKindOfClass cls
  end
  
  # alias_method :is_a?, :kind_of?
  
  # FIXME: implement alias
  def is_a? cls
    isKindOfClass cls
  end
  
  def instance_eval &block
    # if string
    #   raise "Kernel.instance_eval with string not yet implemented"
    # end
    
    # raise "no block given for instance_eval" unless block
    `#{block}(#{self}, null)`
  end
  
  def instance_exec arg, &block
    `#{block}(#{self}, null, #{arg})`
  end
  
  def instance_variable_set ivarname, value
    `#{self}[#{ivarname}] = #{value}`
  end
  
  def instance_variable_get ivarname
    `#{self}[#{ivarname}]`
  end
end
