require './expectations/fail_with'

# module Kernel..
class Object
  
  def should matcher, message, &block
    Spec::Expectations::PositiveExpectationHandler.handle_matcher self, matcher, message
  end
  
  def should_not matcher, message, &block
    Spec::Expectations::NegativeExpectationHandler.handle_matcher self, matcher, message
  end
end
