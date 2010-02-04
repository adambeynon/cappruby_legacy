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
rb_mKernel = nil;

function rb_basic_obj_alloc(cls, sel) {
  return class_createInstance(cls);
};

function rb_module_s_alloc(mod, sel) {
  return rb_module_new();
};

function rb_class_s_alloc(cls, sel) {
  return rb_class_boot();
};

function rb_f_puts(cls, sel, val) {
  console.log(val);
  // CPLog(val);
  return nil;
};

function rb_obj_class(cls, sel) {
  return cls.isa;
};

function rb_mod_attr_accessor(cls, sel) {
  var i, a = Array.prototype.slice.call(arguments, 2);
  for (i = 0; i < a.length; i++) {
    rb_objj_define_kvo_getter(cls, a[i]);
    rb_objj_define_kvo_setter(cls, a[i]);
  }
  return cls;
};

function rb_mod_attr_reader(cls, sel) {
  var i, a = Array.prototype.slice.call(arguments, 2);
  for (i = 0; i < a.length; i++) {
    rb_objj_define_kvo_getter(cls, a[i]);
  }
  return cls;  
};

function rb_mod_attr_writer(cls, sel) {
  var i, a = Array.prototype.slice.call(arguments, 2);
  for (i = 0; i < a.length; i++) {
    rb_objj_define_kvo_setter(cls, a[i]);
  }
  return cls;  
};

function rb_objj_define_kvo_setter(cls, id) {
  id = objj_msgSend(id, "to_s");
  var k = ["set", id.charAt(0).toUpperCase(), id.substr(1), ":"].join("");
  rb_define_method(cls, k, function(self, sel, val) {
    var key = id;
    return rb_ivar_set(self, key, val);
  }, 1);
};

function rb_objj_define_kvo_getter(cls, id) {
  id = objj_msgSend(id, "to_s");
  rb_define_method(cls, id, function(self, sel, val) {
    var key = id;
    return rb_ivar_get(self, id);
  }, 0);
};

function rb_mod_const_get(cls, sel, id) {
  return rb_const_get(cls, id);
};

function rb_obj_ivar_set(cls, sel, name, val) {
  return rb_ivar_set(cls, name, val);
};

function rb_obj_send(obj, sel, mid) {
  // FIXME: check if symbol or not
  if (mid.isa == rb_cSymbol) mid = mid.ptr;
  return objj_msgSend(obj, mid);
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
  
  rb_define_method(rb_cModule, "const_get:", rb_mod_const_get, -1);
  // rb_define_method(rb_cModule, "const_set", rb_mod_const_set, 2);
  
  
  rb_mKernel = rb_define_module("Kernel");
  rb_include_module(rb_cObject, rb_mKernel);
  
  rb_define_method(rb_mKernel, "class", rb_obj_class, 0);
  rb_define_method(rb_mKernel, "send:", rb_obj_send, 1);
  rb_define_method(rb_cModule, "send:", rb_obj_send, 1);
  
  /**
    puts is generally called with a single param, so we use a colon-iszed name
    for quicker lookups (to save having to reaearch without a colon)
  */
  rb_define_method(rb_mKernel, "puts:", rb_f_puts, 1);
  rb_define_method(rb_cModule, "puts:", rb_f_puts, 1);
  
  // rb_define_method(rb_cModule, "attr:", rb_mod_attr, -1);
  rb_define_method(rb_cModule, "attr_reader:", rb_mod_attr_reader, -1);
  rb_define_method(rb_cModule, "attr_writer:", rb_mod_attr_writer, -1);
  rb_define_method(rb_cModule, "attr_accessor:", rb_mod_attr_accessor, -1);
  
  rb_define_method(rb_mKernel, "instance_variable_set:", rb_obj_ivar_set, 2);
};
