class AppController
  
  def applicationWillFinishLaunching(notification)
    main_window
  end
  
  def applicationDidFinishLaunching(notification)

  end
  
  # return or build the main window
  def main_window
    @main_window ||= window :title => "Main Window" do |win|
      # A button example
      button :title => "First Button" do |btn|
        btn.on_action { puts "Wow, button was clicked" }
        win << btn
      end
      # A simple slider (doesnt send actions..)
      slider :min => 0, :max => 1000, :value => 900 do |slider|
        win << slider
      end
    end
  end
  
end
