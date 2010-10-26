class CPControl < CPResponder
  
  def on_action(&block)
    obj = Object.new
    
    # def obj.perform_action(sender)
      # @action_block.call sender
    # end
    
    self.target = obj
    self.action = 'perform_action:'
    obj.instance_variable_set '@action_block', block
  end
end
