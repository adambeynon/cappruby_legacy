class AppController
  
  def initialize
    super
  end
  
  def applicationWillFinishLaunching(notification)
    main_window
    # `[CPApp setMainMenu:nil]`
    CPApp.mainMenu = application_menu
    CPMenu.menuBarVisible = true    
  end
  
  def applicationDidFinishLaunching(notification)

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
    end
  end
  
end

# Require all other files.
Dir.glob(File.join(File.dirname(__FILE__), '**', '*.rb')).each { |f| require f }
