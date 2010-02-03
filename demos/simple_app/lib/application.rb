class AppController
  
  def initialize
    super
  end
  
  def maths_testing_stuff
    
    puts "before"
    
    [1,2,3,4,5,6].each do |a|
      puts a
      if a > 3
        break
      end
    end
    
    puts "after block"
    
  end
  
  def applicationWillFinishLaunching(notification)
    main_window
    CPApp.mainMenu = application_menu
    CPMenu.menuBarVisible = true    
    
    maths_testing_stuff
    panel =CRHUDPanel.alloc.initWithContentRect CPRectMake(300,200,400,200), styleMask:1
    panel.movableByWindowBackground = true
    panel.orderFront self
  end
  
  def applicationDidFinishLaunching(notification)
    # a = AppController.new(10, 20, 30)
    # puts a
  end
  
  def on_show_about_window
    window :title => "About Application", :style => [:hud, :closable]
  end
  
  def on_new
    puts "wow"
  end
  
  # return or build the main window
  def main_window
    @main_window ||= window :title => "Main Window", :style => :bridge do |win|
      # A button example - using origin will trigger sizeToFit:
      button :title => "First Button", do |btn|
        btn.on_action { puts "Wow, button was clicked" }
        win << btn
      end
      # A simple slider (doesnt send actions..)
      slider :min => 0, :max => 1000, :value => 900 do |slider|
        win << slider
      end
      
      a_view = Gauge.alloc.initWithFrame CPRectMake(300,0,100,100)
      # a_view.backgroundColor = CPColor[:blue]
      win << a_view
      
      win << check_box(:origin => [300, 200])
    end
  end
  
  def application_menu
    @application_menu ||= menu do |main|
      main.submenu :file do |file|
        file.item :new, :key => "n"
        file.item :open, :key => "o"
        file.item :save, :key => "s"
        file.separator
        file.item :show_about_window
      end
      main.submenu :edit do |edit|
        edit.item :copy, :key => "c"
        edit.item :cut, :key => "x"
        edit.item :paste, :key => "v"
      end
      main.separator
      item = CPMenuItem.new
      item.view = Gauge.alloc.initWithFrame CPRectMake(0,0,100,100)
      item.view.backgroundColor = CPColor[:blue]
      main.addItem item
    end
  end
  
end

# Require all other files.
Dir.glob(File.join(File.dirname(__FILE__), '**', '*.rb')).each { |f| require f }
