require './matchers/be'
require './matchers/generated_descriptions'
require './matchers/operator_matcher'

module Spec
  
  module Example
    
    class Matcher
      
      # include Spec::Matchers
      # attr_reader :expected, :actual
      def expected; @expected; end
      def actual; @actual; end
      
      def initialize name, expected, &declarations
        @name = name
        @expected = expected
        # puts "need to instance_exec"
        instance_exec expected, &declarations
        # puts "done instance_execing"
      end
      
      def matches? actual
        puts "testing in matches?"
        # @actual = actual
        begin
          # puts "match block: #{@match_block}"
          result = @match_block.call actual
          # puts "got rsult: #{result}"
          return result
        rescue Exception => e
          return false
        end
      end
      
      def match &block
        # puts "setting block"
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
