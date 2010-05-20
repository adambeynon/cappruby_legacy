require './expectations/fail_with'
require './expectations/handler'
require './expectations/errors'

# module Kernel..
class Object
  
  # hack (no semi colon)
  def should &block
    Spec::Expectations::PositiveExpectationHandler.handle_matcher self, nil, nil
  end
  
  def should matcher, message, &block
    Spec::Expectations::PositiveExpectationHandler.handle_matcher self, matcher, message
  end
  
  def should_not matcher, message, &block
    Spec::Expectations::NegativeExpectationHandler.handle_matcher self, matcher, message
  end
end
