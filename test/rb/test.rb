# 
#  test.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-09.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

class AppController
  
  # attr_accessor :the_window
  
  def applicationDidFinishLaunching aNotification
    # This is called when the application is done loading
    `console.log('ohhhhh yeah!');`
    # main_window
  end
  
  puts "adam"
  
  def awakeFromCib
    # This is called when the cib is done loading
  end

  def normal adam, ben, john

  end

  def splat *args

  end

  def none

  end
  
end

[1, 2, 3, 4].each do |arg|
  if arg > 2
    break
  end
  puts arg
end
