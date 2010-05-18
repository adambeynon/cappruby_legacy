// 
//  boot.js
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-08.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 

// Core classes
cappruby_cObject      = nil;
cappruby_cBasicObject = nil;
cappruby_cModule      = nil;
cappruby_cClass       = nil;
cappruby_cKernel      = nil;

cappruby_cSymbol      = nil;

var symbol_hash = { };

var CappRubySymbol = function(id) {
  this._sym = id;
  this.isa = cappruby_cSymbol;
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
  cappruby_cObject = objj_getClass('CPObject');
  cappruby_const_set(cappruby_cObject, 'Object', cappruby_cObject);
  
  cappruby_cBasicObject = objj_allocateClassPair(null, 'BasicObject');
  cappruby_const_set(cappruby_cObject, 'BasicObject', cappruby_cBasicObject);
  
  cappruby_cModule = boot_defclass('Module', CPObject);
  cappruby_cClass = boot_defclass('Class', cappruby_cModule);
  // cappruby_mKernel = define module...
  
  var reg = cappruby_define_class('Regexp', CPObject);
  cappruby_const_set(cappruby_cObject, 'Regexp', reg);
  RegExp.prototype.isa = reg;
  
  cappruby_const_set(cappruby_cObject, 'NilClass', CPNull);
  cappruby_const_set(cappruby_cObject, 'Boolean', CPBoolean);
  cappruby_const_set(cappruby_cObject, 'Number', CPNumber);
  
  cappruby_cSymbol = cappruby_define_class('Symbol', CPObject);
  
  cappruby_const_set(cappruby_cObject, 'Array', CPArray);
  cappruby_const_set(cappruby_cObject, 'String', CPString);
  cappruby_const_set(cappruby_cObject, 'Proc', CPBlock);
  cappruby_const_set(cappruby_cObject, 'Hash', CPDictionary);
  
  // commonjs specific classes... just instantiate here
  var cappruby_cFile = objj_allocateClassPair(CPObject, 'File');
  cappruby_const_set(cappruby_cObject, 'File', cappruby_cFile);
  cappruby_const_set(cappruby_cObject, 'Dir', objj_allocateClassPair(CPObject, 'Dir'));
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
