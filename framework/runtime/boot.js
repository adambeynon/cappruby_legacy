// 
//  boot.js
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-08.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 

// Core classes
rb_object       = nil;
rb_basic_object = nil;
rb_module       = nil;
rb_class        = nil;
rb_kernel       = nil;
rb_symbol       = nil;


// rb_object      = nil;
// rb_basic_object = nil;
// rb_module      = nil;
// rb_class       = nil;
// cappruby_cKernel      = nil;
// 
// rb_symbol      = nil;

var symbol_hash = { };

var CappRubySymbol = function(id) {
  this._sym = id;
  this.isa = rb_symbol;
  this.toString = function() {
    return ':' + this._sym;
  };
  return this;
};

ID2SYM = function(id) {
  var s = symbol_hash[id];
  if (!s) {
    s = new CappRubySymbol(id);
    symbol_hash[id] = s;
  }
  return s;
};

// These are hidden from us... :(
var CLS_CLASS           = 0x1,
    CLS_META            = 0x2,
    CLS_INITIALIZED     = 0x4,
    CLS_INITIALIZING    = 0x8;

// Identify a class as being a singleton instance (cappruby addition)
var CLS_SINGLETON       = 0x16;

// Proc/Block/Function - possibly remove later to avoid class clash with capp
objj_registerClassPair(objj_allocateClassPair(CPObject, 'CPBlock'));
Function.prototype.isa = CPBlock;

// Boolean/Bool/BOOL
objj_registerClassPair(objj_allocateClassPair(CPObject, 'CPBoolean'));
Boolean.prototype.isa = CPBoolean;


// Initialize objects and hierarchy for cappruby
function Init_CappRuby() {
  rb_object = objj_getClass('CPObject');
  cappruby_const_set(rb_object, 'Object', rb_object);
  
  rb_basic_object = objj_allocateClassPair(null, 'BasicObject');
  cappruby_const_set(rb_object, 'BasicObject', rb_basic_object);
  cappruby_define_singleton_method(rb_basic_object, 'new:', rb_new_with_args);
  cappruby_define_singleton_method(rb_object, 'new:', rb_new_with_args);
  cappruby_define_method(rb_object, 'init:', rb_init_with_args);
  
  rb_module = boot_defclass('Module', CPObject);
  rb_class = boot_defclass('Class', rb_module);
  // cappruby_mKernel = define module...
  
  var reg = cappruby_define_class('Regexp', CPObject);
  cappruby_const_set(rb_object, 'Regexp', reg);
  RegExp.prototype.isa = reg;
  
  cappruby_const_set(rb_object, 'Proc', CPBlock);
  cappruby_const_set(rb_object, 'Exception', CPException);
  
  cappruby_const_set(rb_object, 'NilClass', CPNull);
  cappruby_const_set(rb_object, 'Boolean', CPBoolean);
  cappruby_const_set(rb_object, 'Number', CPNumber);
  
  rb_symbol = cappruby_define_class('Symbol', CPObject);
  
  cappruby_const_set(rb_object, 'Array', CPArray);
  cappruby_const_set(rb_object, 'String', CPString);
  cappruby_const_set(rb_object, 'Proc', CPBlock);
  cappruby_const_set(rb_object, 'Hash', CPDictionary);
  
  cappruby_const_set(rb_object, 'Time', CPDate);
  
  // commonjs specific classes... just instantiate here
  var cappruby_cFile = objj_allocateClassPair(CPObject, 'File');
  cappruby_const_set(rb_object, 'File', cappruby_cFile);
  cappruby_const_set(rb_object, 'Dir', objj_allocateClassPair(CPObject, 'Dir'));
};


// Class booting etc
function boot_defclass(id, super_class) {
  var o = boot_class(super_class, id);
  cappruby_const_set((CPObject ? CPObject : o), id, o);
  return o;
};

function boot_class(super_class, name) {
  return objj_create_class(name, super_class);
};

function objj_create_class(name, super_class) {
  return objj_alloc_class(name, super_class, 0, nil);
};

var anonymous_count = 0;

function objj_alloc_class(name, super_class, type, klass) {
  name = name || ("RubyAnonymous" + anonymous_count++);
  super_class = super_class || CPObject;
  var o = objj_allocateClassPair(super_class, name);
  o.info |= CLS_INITIALIZED;
  o.isa.info |= CLS_INITIALIZED;
  cappruby_const_set(CPObject, name, o);
  return o;
};

// we add .new() to existing capp classes, so that when initialzed with args we
// can run a custom creator method. forexample, views will forward the arg to
// initWithFrame. By default, we just call init (for compatibility)
var rb_new_with_args = function(self, _cmd) {
  var obj = rb_call(self, 'alloc');
  var args = Array.prototype.slice.call(arguments);
  args[0] = obj;
  // correct our selector
  args[1] = 'init:';
  // make sure rb_block is now set as if it was sent to init:
  if (rb_block_id) rb_block_id = 'init:';
  return rb_call.apply(obj, args);
};

// Object#init: - by default will just call regular init method (args are just
// ignored).
var rb_init_with_args = function(self, _cmd) {
  return rb_call(self, 'init');
};


// main entry point..
rb_main = function(args, named_args, main_file) {
  console.log("need to load " + main_file);
}
