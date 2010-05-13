class CPView < CPResponder
  
  def << other
    addSubview other
  end
  
  def init_with_options options
    frame = options.delete(:frame)
    `console.log("out frame is probably rubbish");`
    `console.log(#{options.inspect});`
    frame = CGRectMake frame[0], frame[1], frame[2], frame[3]
    # need to turn frame into a rect
    initWithFrame frame
  end
  
end