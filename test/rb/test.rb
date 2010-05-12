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
    `console.log('ohhhhh yeah! applicationDidFinishLaunching');`
    # main_window
  end
    
  def awakeFromCib
    # This is called when the cib is done loading
  end

end

begin
  do_way()
rescue e
  # puts "rescued!"
  `console.log("rescued!");`
end

raise "OMG!"

@adam += 4
@adam -= 4
@adam *= 4
@adam /= 4
@adam %= 100
@adam **= 400

@adam &= 200
@adam |= 400
@adam ^= 600
@adam <<= 800
@adam >>= 392

@adam &&= 400
@ben ||= 700
