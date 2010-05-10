# 
#  kernel.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-10.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

# Currently modules dont exist, so cheat and add Kernel's methods directly into
# CPObject.
class Object
  
  def puts *args
    args.each do |arg|
      `console.log(#{arg});`
    end
  end
  
  def nil?
    false
  end
  
  def === other
    self == other
  end
  
  def tap
    yield self
    self
  end
  
  def =~ matcher
    nil
  end
  
  def !~ matcher
    self =~ obj ? false : true
  end
  
  def eql? other
    `#{self} === #{other}` ? true : false
  end
  
  def raise exception, string
    msg = ""
    if exception.is_a? String
      msg = exception
      exc = RuntimeError.new msg
    elsif exception.is_a? Exception
      exc = exception
    else
      msg = string # if string
      exc = exception.new msg
    end
    
    `throw #{exc};`
    self
  end
  
  # alias_method :fail, :raise
  
  def object_id
    
  end
  
  def respond_to?
    
  end
  
  def to_s
    description
  end
  
  def inspect
    to_s
  end
  
  def instance_of? cls
    
  end
  
  def kind_of? cls
    
  end
  
  # alias_method :is_a?, :kind_of?
  
  def instance_eval string, &block
    if string
      raise "Kernel.instance_eval with string not yet implemented"
    end
    
    # raise "no block given for instance_eval" unless block
    `return #{block}(#{self}, null);`
  end
  
  def instance_exec *args, &block
    
  end
end
