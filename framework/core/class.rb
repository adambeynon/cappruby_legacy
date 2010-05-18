# 
#  class.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-18.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

class Class
  
  `var anonymous_class_count = 0;`
  
  def self.new super_class
    puts "creating subclass #{super_class}"
    `var klass = objj_allocateClassPair(#{super_class}, "AnonymousClass" + ++anonymous_class_count);
    // force initialize
    klass.info |= CLS_INITIALIZED;
    klass.isa.info |= CLS_INITIALIZED;
    return klass;
    `
  end
  
  def self.new 
    self.new Object
  end
  
end
