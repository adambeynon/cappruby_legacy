# 
#  match_data.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-13.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

class MatchData
  
  def initialize data
    @data = data
  end
  
  def inspect
    "#<MatchData '#{@data[0]}'>"
  end
  
  def to_s
    @data[0]
  end
  
  def [] index
    @data[index]
  end
  
  def length
    `return #{@data}.length;`
  end
  
  # alias_method :size, :length
  
end
