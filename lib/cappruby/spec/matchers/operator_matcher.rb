module Spec
  
  module Example
    
    class OperatorMatcher
      
      def initialize actual
        @actual = actual
      end
      
      # define methods for each of the following operators
      ['==', '===', '=~', '>', '>=', '<', '<='].each do |op|
        puts "need to define method: #{op}"
        define_method("#{op}:") do |exp|
          puts "in op method"
          eval_match @actual, op, exp
        end
      end
      
      def eval_match actual, operator, expected
        @operator = operator
        @expected = expected
        __delegate_operator actual, operator, expected
      end
      
      def fail_with_message message
        puts "failed with message #{message}"
        Spec::Expectations.fail_with message, @expected, @actual
      end
    end # OperatorMatcher
    
    
    
    class PositiveOperatorMatcher < OperatorMatcher
      
      def __delegate_operator actual, operator, expected
        puts "testing #{actual} against #{expected} with #{operator}"
        if actual.__send__ operator, expected
          puts "got to trye"
          true
        else
          puts "got to false"
          fail_with_message "expected: #{expected.inspect}, but got: #{actual.inspect} (using #{operator})"
        end
      end
    end # PositiveOperatorMatcher
    
    
    class NegativeOperatorMatcher < OperatorMatcher
      
      def __delegate_operator actual, operator, expected
        if actual.__send__ operator, expected
          fail_with_message "expected not: #{expected.inspect}, but got: #{actual.inspect} (using #{operator})"
        else
          false
        end
      end
    end # NegativeOperatorMatcher
    
  end
end