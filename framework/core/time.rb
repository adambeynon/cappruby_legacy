class Time
  
  def self.now
    new
  end
  
  def - another
    `return #{self}.getTime() - #{another}.getTime();`
  end
end