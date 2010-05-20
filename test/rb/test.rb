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
    success = true
    success = false
    instance_eval &@_implementation
    instane_eval &example_implementations[example]
    return 100
  end
  
  def be_nil
    Matcher.new(:be_nil, nil) do |exp|
      self.match do |actual|
        actual.nil?
      end
    end
  end
  
  def instance_exec arg, &block
    `return #{block}(#{self}, null, #{arg});`
  end
end


/^\n\.omg/

"adam #{10} #{20}"


class Animal
  
end

class Hamster < Animal
  
end