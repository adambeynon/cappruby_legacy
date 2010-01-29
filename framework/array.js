/* 
 * array.js
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

rb_cArray = nil;

function rb_ary_each(ary, sel) {
  var _b = cappruby_block; cappruby_block = nil;
  if (!_b) throw "no block passed to ary#each. need to return enumerator"

  for (var i = 0; i < ary.length; i++) {
    cr_yield(_b, [ary[i]]);
  }
};

function Init_Array() {
  rb_cArray = objj_getClass("CPArray");
  // rb_include_module(rb_cArray, rb_mEnumerable);
  
  // rb_define_singleton_method(rb_cArray, "[]", rb_ary_s_create, -1);
  // rb_define_singleton_method(rb_cArray, "try_convert", rb_ary_s_create, 1);
  
  rb_define_method(rb_cArray, "each", rb_ary_each, 0);
};
