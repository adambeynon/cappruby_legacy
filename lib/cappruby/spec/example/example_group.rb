module Spec
  
  module Example
    
    class ExampleGroup
      
      def self.describe name, &implementation
        puts "need to describe as a subclass: #{name}"
        subclass name, implementation
      end
      
      # alias_method :context, :describe
      
      # 
      # Creates a subclass for the new describe context
      # 
      def self.subclass name, &group_block
        @class_count ||= 0
        @class_count += 1
        klass = const_set("Subclass#{@class_count}", Class.new(self))
        # puts "the class is:"
        # puts klass
        klass.description = name
      end
      
      # 
      # Set class (subclass) description
      # 
      def description= name
        @description = name
        self
      end
    end
  end
end