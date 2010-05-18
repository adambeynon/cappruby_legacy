# 
#  test.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-09.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

module ModuleA
  
  module ModuleB
    Spec::Example::ExampleGroupFactory.create_example_group str, block
  end
  
end


class AppController
  
  # attr_accessor :the_window
  
  def applicationDidFinishLaunching aNotification
    # This is called when the application is done loading
    `console.log('ohhhhh yeah! applicationDidFinishLaunching');`

    btn2 = button :title => "Click me!", :frame => [100, 100, 100, 24]
    
    btn2.title = "CappRuby rokz!"
    
    CPApp.mainWindow << btn2
  end
    
  def awakeFromCib
    # This is called when the cib is done loading
  end
  
  def tester &adam
    yield self if block_given?
  end

end


/^\n\.omg/

"adam #{10} #{20}"