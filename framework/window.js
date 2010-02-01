/* 
 * window.js
 * cappruby
 * 
 * Created by Adam Beynon.
 * Copyright 2010 Adam Beynon.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
 
/**
 window :title => "Adam", :frame => [100, 300] do |win|
   ...
 end

 Block is optional, and if given, the created window is passed. A set of 
 default options are used to "setup" the window in a default state.
*/
function cr_mappings_window(self, sel, options) {
  var _$ = cappruby_block; cappruby_block = nil;
  var h = cr_mappings_collate_options('window', options);

  var win = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(100,100,400,300), CPTitledWindowMask);

  objj_msgSend(win, "setTitle:", rb_hash_delete(h, 'delete:', ID2SYM("title")));

  if(_$) { // if block given
    cr_yield(_$, [win]);
  }

  objj_msgSend(win, "orderFront:", self);
  
  return win;
};

/**
  CPWindow#<<(subview)
  CPWindow#addSubview(subview)
  
  Add a subview to the windows' contentView.
*/
function cr_window_add_subview(win, sel, view) {
  var content_view = objj_msgSend(win, "contentView");
  objj_msgSend(content_view, "addSubview:", view);
  return view;
};

function Init_Mappings_Window() {
  rb_define_method(rb_mKernel, "window:", cr_mappings_window, 1);
  rb_define_method(CPWindow, "<<", cr_window_add_subview, 1);
  rb_define_method(CPWindow, "addSubview:", cr_window_add_subview, 1);
};
