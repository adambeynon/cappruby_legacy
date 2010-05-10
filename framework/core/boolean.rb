# 
#  boolean.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-10.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

# TrueClass and FalseClass are merged into single Boolean class for Javascript.
# All methods work as expected, as this class handles the correct responses for
# the right class (be it true or false).
class Boolean
  
  # Returns a string representation of the receiver: 'true' for true, and 
  # 'false' for false.
  # 
  # Usage
  # =====
  # 
  #     true.to_s   # "true"
  #     false.to_s  # "false"
  # 
  # @return [String] string representation
  # 
  def to_s
    self ? 'true' : 'false'
  end
  
  # Returns string representation of receiver. Same principle as {#to_s}.
  # 
  # Usage
  # =====
  # 
  #     true.inspect   # "true"
  #     false.inspect  # "false"
  # 
  # @return [String] string representation
  #
  def inspect
    self ? 'true' : 'false'
  end
  
  # Performs a boolean AND using the receiver and the given argument. For
  # <tt>true</tt>, returns <tt>false</tt> if other is <tt>nil</tt> or 
  # <tt>false</tt>, <tt>true</tt> otherwise. For <tt>false</tt>, this method
  # always evaluates to <tt>false</tt>.
  # 
  # Usage
  # =====
  # 
  #     true & nil      # false
  #     true & "a"      # true
  #     true & 0        # true
  #     false & true    # false
  #     false & false   # false
  # 
  # @param [Object] object to compare
  # @return [Boolean] result
  # 
  def & other
    if self
      other ? true : false
    else
      false
    end
  end
  
  def | other
    if self
      true
    else
      other ? true : false
    end
  end
  
  def ^ other
    if self
      other ? false : true
    else
      other ? true : false
    end
  end
end
