# 
# window.rb
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

class CPWindow < CPResponder
  
  defaults :window, {
    :title => "Window",
    :frame => [100, 100, 400, 300],
    :style => [:titled, :closable, :miniaturizable, :resizable]
  }
  
  constant :style, {
    :borderless => CPBorderlessWindowMask,
    :titled => CPTitledWindowMask,
    :closable => CPClosableWindowMask,
    :miniaturizable => CPMiniaturizableWindowMask,
    :resizable => CPResizableWindowMask,
    :textured => CPTexturedBackgroundWindowMask,
    :bridge => CPBorderlessBridgeWindowMask,
    :hud => CPHUDBackgroundWindowMask
  }
  
  def init_with_options(options, &block)
    style_options = options.delete(:style)
    style_constants = self.class.constant_name(:style)
    # puts style_options.name
    if style_options.is_a? Array
      style = 0
      style_options.each { |s| style = style | style_constants[s] }
    else
      style = style_constants[style_options]
    end
    
    frame = options.delete(:frame).to_rect
    
    initWithContentRect frame, styleMask:style
    
    yield self if block_given?
    
    # for now, just assume title: we shuld really go through all remaining
    # options
    self.title = options.delete(:title)
    orderFront self
    self
  end
  
  def <<(view)
    contentView.addSubview view
  end
  
end
