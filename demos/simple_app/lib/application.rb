class AppController
  
  def applicationWillFinishLaunching(notification)
    puts "Woohoo!"
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
