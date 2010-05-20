# 
#  errors.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-19.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

module Spec
  
  module Example
    
    class ExamplePendingError < StandardError
      
    end
    
    class NotYetImplementedError < ExamplePendingError
      MESSAGE = "Not Yet Implemented"
      
      def initialize
        # super MESSAGE
      end
    end
  end
end