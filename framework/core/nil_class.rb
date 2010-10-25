class NilClass
  
  def nil?
    true
  end
  
  def inspect
    "nil"
  end
  
  def == other
    `print("in nil.==")`
    `print(#{self})`
    `print(#{other})`
    `#{self} === #{other}`
  end
  
end