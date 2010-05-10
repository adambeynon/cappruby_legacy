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
  
  def to_a
    self
  end
  
  def push val
    `#{self}.push(#{val});`
    val
  end
  
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
end
