class CRHUDPanel < CPPanel
  
  def self._windowViewClassForStyleMask(style)
    CRHUDWindowView
  end
  
end

class CRHUDWindowView < Object.const_get('_CPWindowView')
  
  bundle = CPBundle.bundleForClass self
  
  # puts bundle
  
  CPColor.colorWithPatternImage(
    CPNinePartImage.alloc.initWithImageSlices([
      CPImage[bundle["hud_panel/background_0.png"], CPSizeMake(6, 78)],
      CPImage[bundle["hud_panel/background_1.png"], CPSizeMake(6, 78)],
      CPImage[bundle["hud_panel/background_2.png"], CPSizeMake(6, 78)],
      CPImage[bundle["hud_panel/background_3.png"], CPSizeMake(6, 78)],
      CPImage[bundle["hud_panel/background_4.png"], CPSizeMake(6, 78)],
      CPImage[bundle["hud_panel/background_5.png"], CPSizeMake(6, 78)],
      CPImage[bundle["hud_panel/background_6.png"], CPSizeMake(6, 78)],
      CPImage[bundle["hud_panel/background_7.png"], CPSizeMake(6, 78)],
      CPImage[bundle["hud_panel/background_8.png"], CPSizeMake(6, 78)]
    ]))
  
  def initWithFrame(frame, styleMask:style)
    super frame, style
    bundle = CPBundle.bundleForClass(self.class)
        
    self.backgroundColor = CPColor.colorWithPatternImage(
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
    
    bounds = self.bounds
    width = CGRectGetWidth(self.bounds)
    
    label :stringValue => "Untitled", :frame => [20, 3, width-40, 20] do |label|
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
