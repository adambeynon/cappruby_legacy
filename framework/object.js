/* 
 * object.js
 * opal
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

rb_cObject = nil;
rb_cBasicObject = nil;
rb_cModule = nil;
rb_cClass = nil;

function rb_basic_obj_alloc(cls, sel) {
  return class_createInstance(cls);
};

function rb_module_s_alloc(mod, sel) {
  return rb_module_new();
};

function rb_class_s_alloc(cls, sel) {
  return rb_class_boot();
};

function Init_Object() {
  
  rb_cObject = objj_getClass("CPObject");
  rb_const_set(rb_cObject, "Object", rb_cObject);
  
  rb_cBasicObject = objj_allocateClassPair(null, 'BasicObject');
  rb_const_set(rb_cObject, "BasicObject", rb_cBasicObject);
  rb_define_singleton_method(rb_cBasicObject, "alloc", rb_basic_obj_alloc, 0);
  
  rb_cModule = boot_defclass("Module", rb_cObject);
  rb_cClass = boot_defclass("Class", rb_cModule);
  
  rb_define_singleton_method(rb_cModule, "alloc", rb_module_s_alloc, 0);
  rb_define_singleton_method(rb_cClass, "alloc", rb_class_s_alloc, 0);
  
  rb_include_module(rb_cObject.isa, rb_cClass);
  rb_include_module(rb_cObject.isa, rb_cModule);
};
