# require ..

module Spec
  
  module Matchers
    
    class Matcher
      
      # include Spec::Matchers
      # attr_reader :expected, :actual
      def expected; @expected; end
      def actual; @actual; end
      
      def initialize name, expected, &declarations
        @name = name
        @expected = expected
        # instance_exec expected, &declarations
      end
      
      def matches? actual
        @actual = actual
        begin
          result = @match_block.call actual
          return result
        rescue Exception => e
          return false
        end
      end
      
      def match &block
        @match_block = block
      end
      
      def failure_message_for_should &block
        if block
          @failure_message_for_should_block = block
        else
          @failure_message_for_should_block.call @actual
        end
      end
      
      def failure_message_for_should_not &block
        if block
          @failure_message_for_should_not_block = block
        else
          @failure_message_for_should_not_block.call @actual
        end
      end
      
    end
  end
end
