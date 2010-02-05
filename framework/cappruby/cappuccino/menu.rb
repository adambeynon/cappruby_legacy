# 
# menu.rb
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

class CPMenu
  
  defaults :menu, {
    :title => ""
  }
  
  def init_with_options(options, &block)
    initWithTitle options.delete(:title)
    yield self if block_given?
    self
  end
  
  def submenu(sym, options, &block)
    item = addItemWithTitle sym.to_s.titleize, action:nil, keyEquivalent:""
    submenu = CPMenu.alloc.initWithTitle ""
    yield submenu if block_given?
    setSubmenu submenu, forItem:item
    submenu
  end
  
  def item(sym, options)
    options = {} unless options
    key = options.delete :key
    action = options.delete(:action) || sym
    # puts action
    # action = on_ + action.to_s
    item = addItemWithTitle sym.to_s.titleize, action:action, keyEquivalent:key
    # addItem item
    item
  end
  
  def separator
    addItem CPMenuItem.separatorItem
  end
  
end