class CPButton < CPControl
  
  mapping :button, {
    :frame            => [0, 0, 100, 24],
    :title            => "Button"
  }
  
  constant :state, {
    :on               => CPOnState,
    :off              => CPOffState,
    :mixed            => CPMixedState
  }
  
  def on?
    state == CPOnState
  end
  
  def off?
    state == CPOffState
  end
  
  def mixed?
    state == CPMixedState
  end
  
  def bezel= bezel_style
    self.bezelStyle = style
  end
  
  def type= button_type
    self.buttonType = button_type
  end
  
end