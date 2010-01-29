class AppController
  
  attr_accessor :adam
  
  def applicationWillFinishLaunching(notification)
    puts "Woohoo!"
    # puts CPWindow.alloc.initWithContentRect(CPRect(100,100,100,100), 
                        # styleMask:CPBorderlessBridgedWindowMask)
  end
  
  def applicationDidFinishLaunching(notification)
    puts "Erm, better actually do some stuff now."
    # inline javascript/objective-j
    `console.log(10)`
  end
  
end



[1,2,3].each do |a|
  puts "wow"
end
