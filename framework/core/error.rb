# 
#  error.rb
#  cappruby
#  
#  Created by Adam Beynon on 2010-05-11.
#  Copyright 2010 Adam Beynon. All rights reserved.
# 

class Exception
  
end

class SystemExit < Exception; end

class Fatal < Exception; end

class SignalException < Exception; end

class Interrupt < SignalException; end

class StandardError < Exception; end

class TypeError < StandardError; end

class ArgumentError < StandardError; end

class IndexError < StandardError; end

class KeyError < IndexError; end

class RangeError < StandardError; end

class ScriptError < Exception; end

class SyntaxError < ScriptError; end

class LoadError < SyntaxError; end

class NotImplementedError < StandardError; end

class NameError < StandardError; end

class NoMethodError < NameError; end

class RuntimeError < StandardError; end
