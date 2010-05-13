class CPWindow < CPResponder
  
  mapping :window
  
  def << view
    contentView.addSubview view
  end
  
end