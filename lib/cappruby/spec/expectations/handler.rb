module Spec
  
  module Expectations
    
    class PositiveExpectationHandler
      
      def self.handle_matcher actual, matcher, message, &block
        Spec::Matchers.last_should = :should
        Spec::Matchers.last_matcher = matcher
        
        puts "actual: #{actual}, matcher: #{matcher}, message:#{message}"
        
        if matcher.nil?
          puts "returnng positive operator matcher"
          return Spec::Example::PositiveOperatorMatcher.new actual
        end
        
        match = matcher.matches? actual
        
        puts "match is #{match}"
        return match if match
        
        puts "got here... must not have matched!"
        # Spec::Expectations.fail_with matcher.failure_message_for_should
        Spec::Expectations.fail_with matcher
      end
    end # PositiveExpectationHandler
  end
end