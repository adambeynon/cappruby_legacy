/* 
 * class.js
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

function rb_define_class(id, super_class) {
  var klass;
  
  if (rb_const_defined(rb_cObject, id)) {
    klass = rb_const_get(rb_cObject, id);
    if ((super_class !== CPObject) && (klass.super_class !== super_class)) {
      throw id + " already exists: different super value given"
    }
    return klass;
  }
  
  if (!super_class) {
    // warning?
    super_class = CPObject;
  }
  klass = objj_allocateClassPair(super_class, id);
  // ivars? hmmm, probably dont need to.
  objj_registerClassPair(klass);
  // heh?
  objj_addClassForBundle(klass, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
  // do we need a class table? maybe not..
  rb_const_set(rb_cObject, id, klass);
  return klass;
};
