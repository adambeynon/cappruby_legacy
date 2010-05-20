# 
#  example_group_proxy.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-18.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

module Spec
  
  module Example
    
    class ExampleGroupProxy
      
      def initialize example_group
        @description = example_group.description
        @examples = example_group.example_proxies
      end
      
      def description
        @description
      end
      
      def examples
        @examples
      end
      
    end # ExampleGroupProxy
  end
end
