# 
#  regexp.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-13.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

class Regexp
  
  def self.new str  
    `return new RegExp(#{str});`
  end
  
  def === str
    `return #{self}.exec(#{str}) ? true : false;`
  end
  
  def match str
    if m = `#{self}.exec(#{str})`
      MatchData.new m
    else
      nil
    end
  end
  
  def inspect
    `return #{self}.toString();`
  end
end
