# 
#  control.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-13.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

# Reopen CPControl
class CPControl < CPResponder
  
  # mapping :control
  
  constant :size, {
    
  }
  
  def on_action &block
    obj = Object.new
    
    def obj.perform_action sender
      @action_block.call sender
    end
    
    self.target = obj
    self.action = 'perform_action:'
    object.instance_variable_set '@action_block', block
  end
  
end
