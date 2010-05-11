# 
#  array.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-08.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

class Array
  
  def inspect
    description
  end
  
  def length
    `return #{self}.length;`
  end
  
  # alias_method :size, :length
  
  def to_a
    self
  end
  
  def push val
    `#{self}.push(#{val});`
    self
  end
  
  # alias_method :<<, :push
  
  def each &block
    `
    for (var i = 0; i < #{self}.length; i++) {
      try {
        #{yield `#{self}[i]`};
      }
      catch (err) {
        if (err._keyword == 'break')
          return err._arg;
        else if (err._keyword == 'next')
          break;
        else if (err._keyword == 'redo')
          throw "need to redo.. (Array#each)"
        else
          throw(err);
      }
    }
    `
    self
  end
  
  def include? obj
    `return #{self}.indexOf(#{obj}) !== -1;`
  end
  
  def empty?
    `return #{self}.length === 0;`
  end
  
  def at index
    `if (#{index} >= 0) {
      if (#{index} > #{self}.length) return nil;
      return #{self}[#{index}];
    } else {
      if (#{index} < -#{self}.length) return nil;
      return #{self}[#{self}.length + #{index}]; 
    }`
  end
  
  def join str
    `return #{self}.join(#{str});`
  end
  
  def last
    `return #{self}[#{self}.length - 1];`
  end
  
  def first
    `return #{self}[0];`
  end
  
  def collect &block
    `var i, res = [];
    for (i = 0; i < #{self}.length; i++) {
      res.push(#{yield `#{self}[i]`});
    }
    return res;`
  end
  
  # alias_method :map, :collect
  
  def [] index
    `return #{self}[#{index}];`
  end
  
  def []= index, value
    `return #{self}[#{index}] = #{value};`
  end
  
  def unshift value
    `return #{self}.unshift(#{value});`
  end
  
  def == other
    `if (#{self} === #{other}) {
      return true;
    }
    if (#{other}.isa !== CPArray) {
      return false;
    }
    if (#{self}.length !== #{other}.length) {
      return false;
    }
    for (var i = 0; i < #{self}.length; i++) {
      if (!objj_msgSend(#{self}[i], '==:', #{other}[i])) {
        return false;
      }
    }
    return true;`
  end
  
  def to_s
    description
  end
  
  def inspect
    description
  end
  
  def pop
    `return #{self}.pop();`
  end
  
  def select &block
    `var res = [], v;
    for (var i = 0; i < #{self}.lenth; i++) {
      v = #{yield `#{self}[i]`};
      if (v) {
        res.push(#{self}[i]);
      }
    }
    return res;`
  end
  
  def reject &block
    `var res = [], v;
    for (var i = 0; i < #{self}.lenth; i++) {
      v = #{yield `#{self}[i]`};
      if (!v) {
        res.push(#{self}[i]);
      }
    }
    return res;`
  end
  
  def * num
    
  end
  
  def + other
    
  end
end
