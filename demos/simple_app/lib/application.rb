class AppController
  
  attr_accessor :adam
  
  def applicationWillFinishLaunching(notification)
    puts "Woohoo!"
    window :title => "Main Window" do |win|
      
    end
  end
  
  def applicationDidFinishLaunching(notification)
    puts "Erm, better actually do some stuff now."
    win = CPWindow.alloc
    # inline javascript/objective-j
    # `console.log(10)`
    [1,2,3].each do |a|
      puts a
    end
    
    bob = 20
    
  end
  
end




