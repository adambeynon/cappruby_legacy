# 
#  proc.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-18.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

class Proc
  
  def self.new &block
    block
  end
  
  def to_proc
    self
  end
  
  def call arg1, arg2, arg3, arg4
    `return #{self}(null, null, #{arg1}, #{arg2}, #{arg3}, #{arg4});`
  end
end