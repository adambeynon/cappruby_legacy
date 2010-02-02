/* 
 * check_box.js
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
 
function cr_mappings_check_box(chk, sel, options) {
  var _$ = cappruby_block; cappruby_block = nil;
  var h = cr_mappings_collate_options('check_box', options);
  var needs_sizing = dictionary_containsKey(options, ID2SYM('origin'));
  var frame = cr_mappings_do_control_sizing(chk, options);
   
  var btn = objj_msgSend(objj_msgSend(CPCheckBox, "alloc"), "initWithFrame:", frame);

  if(_$) { // if block given
   cr_yield(_$, [btn]);
  }

  objj_msgSend(btn, "setTitle:", rb_hash_delete(h, 'delete:', ID2SYM("title")));
  
  if (needs_sizing) objj_msgSend(btn, 'sizeToFit');

  return btn;
};

function Init_Mappings_CheckBox() {
  rb_define_method(rb_mKernel, "check_box:", cr_mappings_check_box, 1);
};
