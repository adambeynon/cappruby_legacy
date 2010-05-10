# 
#  basic_object.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-10.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

class BasicObject
  
  def initialize
    
  end
  
  def == other
    `#{self} === #{other}` ? true : false
  end
  
  def equal? other
    `#{self} === #{other}` ? true : false
  end
  
  def !()
    self ? false : true
  end
  
  def != other
    self == other ? false : true
  end
end
