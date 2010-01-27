class AppController
  
  def applicationWillFinishLaunching(notification)
    puts "Woohoo!"
  end
  
  def applicationDidFinishLaunching(notification)
    puts "Erm, better actually do some stuff now."
  end
  
end
