# Currently modules dont exist, so cheat and add Kernel's methods directly into
# CPObject.
class CPObject
  
  def send
    
  end
  
  def instance_of? cls
    
  end
  
  def kind_of? cls
    
  end
  
  def is_a? cls
    
  end
  
  def tap
    
  end
  
  def puts *args
    `console.log("in puts!");`
  end
  
end
