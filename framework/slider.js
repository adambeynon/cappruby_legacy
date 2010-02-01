/* 
 * slider.js
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

function cr_mappings_slider(self, sel, options) {
  var _$ = cappruby_block; cappruby_block = nil;
  var h = cr_mappings_collate_options('slider', options);

  var slider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake(100,200,84,24));

  if(_$) { // if block given
   cr_yield(_$, [slider]);
  }
  
  objj_msgSend(slider, "setMinValue:", rb_hash_delete(h, 'delete:', ID2SYM("min")));
  
  objj_msgSend(slider, "setMaxValue:", rb_hash_delete(h, 'delete:', ID2SYM("max")));
  
  objj_msgSend(slider, "setValue:", rb_hash_delete(h, 'delete:', ID2SYM("value")));

  // objj_msgSend(btn, "setTitle:", "My Button");

  return slider;
};

function Init_Mappings_Slider() {
  rb_define_method(rb_mKernel, "slider:", cr_mappings_slider, 1);
};
