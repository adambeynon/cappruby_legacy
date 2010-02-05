class CRHUDPanel < CPPanel
  
  def self._windowViewClassForStyleMask(style)
    CRHUDWindowView
  end
  
end

class CRHUDWindowView < Object.const_get('_CPWindowView')
  
  bundle = CPBundle.bundleForClass self
  
  BACKGROUND_COLOR = CPColor.colorWithPatternImage(
    CPNinePartImage.alloc.initWithImageSlices([
      CPImage[bundle["hud_panel/background_0.png"], CPSizeMake(19, 19)],
      CPImage[bundle["hud_panel/background_1.png"], CPSizeMake(1, 19)],
      CPImage[bundle["hud_panel/background_2.png"], CPSizeMake(19, 19)],
      CPImage[bundle["hud_panel/background_3.png"], CPSizeMake(19, 1)],
      CPImage[bundle["hud_panel/background_4.png"], CPSizeMake(5, 5)],
      CPImage[bundle["hud_panel/background_5.png"], CPSizeMake(19, 1)],
      CPImage[bundle["hud_panel/background_6.png"], CPSizeMake(19, 19)],
      CPImage[bundle["hud_panel/background_7.png"], CPSizeMake(1, 19)],
      CPImage[bundle["hud_panel/background_8.png"], CPSizeMake(19, 19)]
    ]))
  
  CLOSE_BUTTON = [
    # normal
    CPImage[bundle["hud_panel/close_button.png"], CPSizeMake(13, 13)],
    # active/highlighted
    CPImage[bundle["hud_panel/close_button_active.png"], CPSizeMake(13, 13)]
  ]
  
  TITLEBAR_HEIGHT = 20
  
  def self.contentRectForFrameRect frame
    CGRectMake(frame.x, frame.y + TITLEBAR_HEIGHT, frame.width, frame.height - TITLEBAR_HEIGHT)
  end
  
  def self.frameRectForContentRect rect
    CGRectMake(rect.x, rect.y - TITLEBAR_HEIGHT, rect.width, rect.height + TITLEBAR_HEIGHT)
  end
  
  def initWithFrame(frame, styleMask:style)
    super frame, style
    
    case 34
    when Fixnum
      puts "It is a fixnum"
    when Array, String
      puts "It was an array"
    else
      puts "It was neither"
    end
        
    self.backgroundColor = BACKGROUND_COLOR
    
    # close button
    @close_button = button :frame => [3, 3, 13, 13] do |b|
      b.bordered = false
      b.image = CLOSE_BUTTON[0]
      b.alternateImage = CLOSE_BUTTON[1]
      b.on_action { self.window.close }
      self << b
    end
    
    bounds = self.bounds
    width = CGRectGetWidth(self.bounds)
    
    # title label
    @title_label = label :text => "Untitled", :frame => [20, 3, width-40, 20] do |label|
      label.hitTests = false
      label.font = CPFont.systemFontOfSize(11)
      label.textColor = CPColor[:white]
      label.textShadowColor = CPColor[:black]
      label.textShadowOffset = CGSizeMake(0.0, 1.0)
      label.autoresizingMask = CPViewWidthSizable
      label.alignment = CPCenterTextAlignment
      
      self << label
    end
    
    self
  end
  
end
