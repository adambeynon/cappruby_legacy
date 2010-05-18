module Spec
  
  module Example
    
    class ExampleGroupFactory
      
      def self.register_example_group klass
        
      end
      
      def self.create_example_group name, &block
        puts "in this bit!"
        ExampleGroup.describe name, block
      end
    end
  end
end
