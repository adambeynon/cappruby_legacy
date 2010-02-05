/* 
 * view.js
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
  CPView#initWithOptions(options)
  
  Main initializer. Initializes with a frame, then passes options onto:
    - _dealWithAllRemainingOptions
  Custom behavior can take place, and it is recomended to override any custom
  behaviour on _dealWithAllRemainingOptions. Calling the super implementation is
  then recomended once any custom behaiour is done.
  
  If we have an origin, then we need to sizeToFit after. Otherwise, just use the
  default frame (if it exists)
*/
function cr_view_init_with_options(view, sel, options) {
  if (dictionary_containsKey(options, ID2SYM('origin'))) {
     var origin = objj_msgSend(rb_hash_delete(options, 'delete:', ID2SYM("origin")), 'to_point');
     rb_hash_delete(options, 'delete:', ID2SYM("frame"));
     var frame = CPMakeRect(origin.x, origin.y, 0, 0);
   }
   else {
     var frame = objj_msgSend(rb_hash_delete(options, 'delete:', ID2SYM("frame")), 'to_rect');
   }
   
  view = objj_msgSend(view, 'initWithFrame:', frame);
  
  objj_msgSend(view, "_dealWithAllRemainingOptions:", options);
  
  return view;
};

function cr_view_deal_with_all_remaining_options(view, sel, options) {
  var key, val;
  for (var i = 0; i < options._keys.length; i++) {
    key = options._keys[i].ptr;
    val = options._buckets[options._keys[i]];
    key = ['set', key.charAt(0).toUpperCase(), key.substr(1), ':'].join('');
    // console.log(val);
    objj_msgSend(view, key, val);
  }
};

function Init_Mappings_View() {
  rb_define_method(CPView, "init_with_options:", cr_view_init_with_options, 1);
  rb_define_method(CPView, "_dealWithSpecialOptions:", function() {}, 1);
  rb_define_method(CPView, "_dealWithAllRemainingOptions:", cr_view_deal_with_all_remaining_options, 1);
  
};
