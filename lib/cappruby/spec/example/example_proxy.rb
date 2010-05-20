# 
#  example_proxy.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-18.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

module Spec
  
  module Example
    
    class ExampleProxy
      
      # attr_reader :description
      def description; @description; end
      
      def initialize description
        @description = description
      end
      
      def update description
        @description = description
        self
      end
      
    end # ExampleProxy
  end
end
