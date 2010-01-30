/* 
 * geometry.js
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

cr_cRect = nil;
cr_cPoint = nil;
cr_cSize = nil;

function cr_rect_new(x, y, w, h) {
  var r = CPRectMake(x, y, w, h);
  r.isa = cr_cRect;
  return r;
};

function cr_point_new(x, y) {
  var r = CPPointMake(x, y);
  r.isa = cr_cPoint;
  return r;
};

function cr_size_new(w, h) {
  var r = CPSizeMake(w, h);
  r.isa = cr_cSize;
  return r;
};

/**
  Array#to_rect
  
  Takes an array, of length 4, and returns a CPRect.
  
  [a, b, c, d].to_rect
  => { origin: { x: a, y: b }, size: { width: c, height: d } }
*/
function cr_array_to_rect(ary, sel) {
  return cr_rect_new(ary[0], ary[1], ary[2], ary[3]);
};

/**
  Array#to_point
  
  Takes an array, of length 2, and returns a CPPoint.
  
  [a, b].to_point
  => { x: a, y: b }
*/
function cr_array_to_point(ary, sel) {
  return cr_point_new(ary[0], ary[1]);
};

/**
  Array#to_point
  
  Takes an array, of length 2, and returns a CPSize.
  
  [a, b].to_size
  => { width: a, height: b }
*/
function cr_array_to_size(ary, sel) {
  return cr_size_new(ary[0], ary[1]);
};

function Init_Mappings_Geometry() {
  
  cr_cRect = rb_define_class("CPRect", rb_cBasicObject);
  cr_cPoint = rb_define_class("CPPoint", rb_cBasicObject);
  cr_cSize = rb_define_class("CPSize", rb_cBasicObject);
  
  rb_define_singleton_method(cr_cRect, "new", function(cls, sel, x, y, w, h) {
    return cr_rect_new(x, y, w, h);
  }, 4);
  
  rb_define_singleton_method(cr_cPoint, "new", function(cls, sel, x, y) {
    return cr_point_new(x, y);
  }, 2);
  
  rb_define_singleton_method(cr_cSize, "new", function(cls, sel, w, h) {
    return cr_size_new(w, h);
  }, 2);
  
  rb_define_method(rb_cArray, "to_rect", cr_array_to_rect, 0);
  rb_define_method(rb_cArray, "to_point", cr_array_to_point, 0);
  rb_define_method(rb_cArray, "to_size", cr_array_to_size, 0);
};
