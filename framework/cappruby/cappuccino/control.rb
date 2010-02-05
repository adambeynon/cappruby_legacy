# 
# control.rb
# cappruby
# 
# Created by Adam Beynon.
# Copyright 2010 Adam Beynon.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

class CPControl < CPView
  
  # CPControl#on_action(&block)
  # 
  # Makes a proxy object for the target, and a fake action. The given block is
  # run whenever the control sends its action.
  # 
  # Usage:
  # 
  #   btn = CPButton.new
  #   btn.on_action { puts "I was clicked!" }
  # 
  # <User clicks on button>
  # => "I was clicked!"
  # 
  def on_action(&block)
    target = Object.new
    
    def target.control_action(sender)
      @on_action.call sender
    end
    
    target.instance_variable_set('@on_action', block)    
    self.target = target
    self.action = 'control_action:'
    
    self
  end
  
  def text=(text)
    self.stringValue = text
  end
  
  def to_i
    intValue
  end
  
  def to_f
    doubleValue
  end
  
  def to_s
    stringValue
  end
end
