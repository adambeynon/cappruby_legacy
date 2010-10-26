
class CPView < CPResponder
  
  def initialize(frame)
    puts "in initialize from view"
    initWithFrame frame
  end
  
  # FIXME: This should really just alias the method?
  def <<(view)
    addSubview view
  end
end
