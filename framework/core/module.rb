
# Currently modules do not exist, so cheat and add module methods directly into
# CPObject's meta chain.
class << CPObject
  
  # def === other
  #   
  # end
  # 
  # def == other
  #   
  # end
  # 
  # def <=> other
  #   
  # end
  # 
  # def < other
  #   
  # end
  # 
  # def <= other
  #   
  # end
  # 
  # def > other
  #   
  # end
  # 
  # def >= other
  #   
  # end
  
  def attr attributes
    
  end
  
  def attr_reader *attrbutes
    # attributes.each do |attribute|
    #   define_method attribute do
    #     `return #{self}['#{attribute}'];`
    #   end
    # end
  end
  
  def attr_writer *attributes
    
  end
  
  def attr_accessor *attributes
    # attr_reader *attributes
    # attr_writer *attributes
  end
  
  def new args
    
  end
  
end
