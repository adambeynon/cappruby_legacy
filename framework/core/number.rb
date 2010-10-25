# 
#  number.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-10.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

class Number
  
  def + other
    `return #{self} + #{other};`
  end
  
  def - other
    `return #{self} - #{other};`
  end
  
  def * other
    `return #{self} * #{other};`
  end
  
  def / other
    `return #{self} / #{other};`
  end
  
  def % other
    `return #{self} % #{other};`
  end
  
  def ** other
    `return Math.pow(#{self}, #{other});`
  end
  
  def +@
    self
  end
  
  def -@
    `return -#{self};`
  end
  
  def > other
    `return #{self} > #{other};`
  end
  
  def >= other
    `return #{self} >= #{other};`
  end
  
  def < other
    `return #{self} < #{other};`
  end
  
  def <= other
    `return #{self} <= #{other};`
  end
  
  def << other
    `return #{self} << #{self};`
  end
  
  def >> other
    `return #{self} >> #{other};`
  end
  
  def | other
    `return #{self} | #{other};`
  end
  
  def & other
    `return #{self} & #{other};`
  end
  
  def to_s
    `return #{self}.toString();`
  end
  
  def inspect
    `return #{self}.toString();`
  end
  
  def <=> other
    `
    if (#{self} === #{other})
      return 0;
    else if (#{self} < #{other})
      return -1;
    return 1;
    `
  end
  
  def real?
    `return #{self} != Math.round(#{self});`
  end
  
  def integer?
    `return #{self} == Math.round(#{self});`
  end
  
  def nonzero?
    `return #{self} !== 0;`
  end
  
  def zero?
    `return #{self} === 0;`
  end
  
  def == other
    `return #{self} === #{other};`
  end
  
  def eql? other
    `return #{self} === #{other};`
  end
  
  def even?
    `return (#{self} %2 ==0) ? true : false;`
  end
  
  def odd?
    `return (#{self} %2 == 0) ? false : true;`
  end
  
  def pred
    `return --#{self};`
  end
  
  def next
    `return ++#{self};`
  end
  
  # alias_method :succ, :next
  
  def ^ other
    `return #{self} ^ #{other};`
  end
  
  def ~
    `return ~#{self};`
  end
  
  def to_f
    `return parseFloat(#{self});`
  end
  
  def to_i
    `return parseInt(#{self});`
  end
  
  # alias_method :to_int, :to_i
  
  def floor
    `return Math.floor(#{self});`
  end
  
  def ceil
    `return Math.ceil(#{self});`
  end
  
  def round
    `return Math.round(#{self});`
  end
  
  def truncate
    `return Math.round(#{self});`
  end
  
  def times(number)
    `for (var i = 0; i < #{number}; i++) {
      #{yield `i`};
    }
    return #{self};`
  end
  
  def upto(stop)
    `for (var i = #{self}; i<= #{stop}; i++) {
      #{yield `i`};
    }
    return #{self};`
  end
  
  def downto(stop)
    # return self if `#{stop}>#{self}`
    `for (var i = #{self}; i >= #{stop}; i--) {
      #{yield `i`};
    }
    return #{self};`
  end
end
