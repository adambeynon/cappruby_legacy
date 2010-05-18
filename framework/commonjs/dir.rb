# 
#  dir.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-17.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

`var FILE = require('file');`

class Dir
  
  def self.[] glob_string
    `return FILE.glob(#{glob_string});`
  end
  
  # alias_method :glob, :[]
  
end
