
class CPWindow < CPResponder
  
  def initialize(frame, mask)
    initWithContentRect frame, styleMask:mask
  end
  
  def <<(view)
    contentView.addSubview view
  end
end
