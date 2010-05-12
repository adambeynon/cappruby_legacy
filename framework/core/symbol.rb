# 
#  symbol.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-10.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

class Symbol
  
  def == other
    `#{self} === #{other}` ? true : false
  end
  
  def inspect
    `return ":" + #{self}._sym;`
  end
  
  def to_s
    `return #{self}._sym;`
  end
  
  # alias_method :id2name, :to_s
  # FIXME: alias_method
  def id2name
    to_s
  end
  
  def to_sym
    self
  end
  
  # alias_method :intern, :to_sym
  # FIXME: alias_method
  def intern
    self
  end
  
  def to_proc
    `var id = #{self}._sym;
    var f = function(self, _cmd, o) {
      return objj_msgSend(o, id); 
    };
    return f;`
  end
  
  def succ
    self
  end
  
  # alias_method :next, :succ
  
  def length
    `return #{self}._sym.length;`
  end
  
  # alias_method :size, :length
  
  def upcase
    `return ID2SYM(#{self}._sym.toUpperCase());`
  end
  
  def downcase
    `return ID2SYM(#{self}._sym.toLowerCase());`
  end
  
  def capitalize
    `return ID2SYM(#{self}._sym[0].toUpperCase() +`
    `#{self}._sym.substr(1).toLowerCase());`
  end
  
end
