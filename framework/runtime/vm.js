// 
//  vm.js
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-08.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 


var global;

if (typeof global === 'undefined') {
  global = window;
};

// main context object
rb_top_self = nil;

var top_self_to_s = function() {
  
};

// Initialize top self
function Init_top_self() {
  rb_top_self = class_createInstance(rb_object);
  // set top self as a singleton to make sure we can define top level methods
  // on top self, rather than CPObject.
  cappruby_singleton_class(rb_top_self);
};

cappruby_defineclass = function(base, super_class, name, body, flag) {
  // print("defininf class: " + name);
  var klass;
  
  // cheap hack. if its an object, then we need to get its real class
  if (!base.info) base = cappruby_class_real(base.isa);
  
  switch (flag) {
    case 0: // normal class
      if (super_class === nil) super_class = CPObject;
      klass = cappruby_define_class_under(base, name, super_class);
      body(klass);
      break;
    case 1: // class shift
    case 2: // module
      klass = cappruby_define_module_under(base, name);
      body(klass);
      break;
    default:
      throw "unknown cappruby_defineclass type: " + flag
  }
  return klass;
};

cappruby_define_class = function(id, super_class) {
  return cappruby_define_class_under(CPObject, id, super_class);
};

cappruby_define_class_under = function(outer, id, super_class) {
  var klass;
  if (cappruby_const_defined(outer, id)) {
    // FIXME: check correct superclass etc
    return klass = cappruby_const_get(outer, id);
  }
  
  if (!super_class) super_class = CPObject;
  
  klass = objj_allocateClassPair(super_class, id);
  
  // force initialize
  klass.info |= CLS_INITIALIZED;
  klass.isa.info |= CLS_INITIALIZED;
  
  // only if outer is CPObject, otherwise all inner klasses/modules get added to
  // global scope
  if (outer === CPObject)
    objj_registerClassPair(klass);
  else
    klass.cappruby_parent = outer;
  
  cappruby_const_set(outer, id, klass);
  return klass;
};

cappruby_singleton_class = function(klass) {
  if (klass.isa.info & CLS_CLASS) {
    if (klass.isa.info & CLS_SINGLETON) {
      // alreay a singleton
      return klass.isa;
    } else {
      var s = objj_allocateClassPair(klass.isa, klass.isa.name);
      // _class_initialize(s);
      // force initialize
      s.info |= CLS_INITIALIZED;
      s.isa.info |= CLS_INITIALIZED;
      klass.isa = s;
      return klass.isa;
    }
  } else {
    // meta class, so already singleton
    return klass.isa;
  }
};

cappruby_class_real = function(klass) {
  while (klass.info & CLS_SINGLETON) klass = klass.super_class;
  return klass;
};

cappruby_define_method = function(receiver, selector, body) {
  if (receiver.isa.info & CLS_CLASS) receiver = receiver.isa;
  // console.log("defininf on:");
  // console.log(receiver);
  return class_addMethod(receiver, selector, body, []);
};

// check body arity. if we take any args, then we need to add colon selector
// as well. If a method must take args, then it always has a colon, if all of its
// arguments are optional, then a method is added for both cases.
rb_def_method = function(recv, sel, body, arity) {
  if (arity == 0) {
    // no args, so no colon
    return cappruby_define_method(recv, sel, body);
  }
  else if (arity > 0) {
    // all required args, so only use colon (no args when calling means an error)
    return cappruby_define_method(recv, sel + ':', body);
  }
  else {
    // must be minus which means we have some optional args etc, so use both colon
    // and non colon version
    cappruby_define_method(recv, sel + ':', body);
    return cappruby_define_method(recv, sel, body);
  }
};

cappruby_define_singleton_method = function(recv, sel, body) {
  cappruby_define_method(cappruby_singleton_class(recv), sel, body);
};

cappruby_const_set = function(klass, id, val) {
  return klass[id] = val;
};

cappruby_const_defined = function(klass, id) {
  while(klass) {
    if (klass[id] !== undefined) return true;
    klass = klass.super_class;
  }
  // try window/global scope..
  // FIXME: commonjs needs global..
  if (global[id] !== undefined) return true;
  return false;
};

cappruby_const_get = function(klass, id) {
  // we might send const_set to nil, so special case.. (it wont have a .isa etc)
  if (klass === null || klass === undefined) klass = CPNull;
  
  if (klass.isa.info & CLS_CLASS) klass = klass.isa;
  var o = klass;
  
  while (klass) {
    if (klass[id] !== undefined) return klass[id];
    klass = klass.super_class;
  }

  klass = o.cappruby_parent;
  while (klass) {
    if (klass[id] !== undefined) return klass[id];
    klass = klass.cappruby_parent;
  }
  
  if (global[id] !== undefined) {
    rb_object[id] = window[id];
    return global[id];
  }

  throw "Name Error: Uninitialized constant: " + id
  return false;
};

cappruby_const_at = function(klass, id) {
  // print("looking for at: " + id);
  if (klass[id] !== undefined) return klass[id];
  throw "NameError: Uninitialized constant " + id
};

cappruby_function = function(name) {
  var args = Array.prototype.slice.call(arguments, 1);
  if (!window[name] || typeof window[name] !== 'function') {
    throw "cappruby_function: " + name + " is not a valid function."
  }
  return window[name].apply(window, args);
};

Init_CappRuby();
Init_top_self();

rb_raise = function(exc) {
  throw exc;
};

rb_call = function(recv, sel) {
  var imp;
  
  if (recv === null || recv === undefined) {
    console.log("using CPNull for: " + sel);
    imp = CPNull.method_dtable[sel];
  }
  // insert check here for recv.isa .. if it doesnt exist then we are sending a
  // message to a non capp object, so we try and work out what it is. if it is
  // a point, rect or size etc, then set the .isa to a custom object (instance
  // of CPRect, CPPoint, CPRect etc and then send message).
  else {
    imp = recv.isa.method_dtable[sel];
  }
  
  if (!imp) {
    throw "no imp for rb_call: need method_missing : " + sel;
  }
  else {
    imp = imp.method_imp;
  }
  
  switch (arguments.length) {
    case 2: return imp(recv, sel);
    case 3: return imp(recv, sel, arguments[2]);
    case 4: return imp(recv, sel, arguments[2], arguments[3]);
    case 5: return imp(recv, sel, arguments[2], arguments[3], arguments[4]);
    case 6: return imp(recv, sel, arguments[2], arguments[3], arguments[4], arguments[5]);
  }
  
  throw "cappruby_msgSend: unsuported arg send length:" + (arguments.length - 2)
};


// call with a block..do our work then slice arguments from 1 and apply to rb_call
rb_block_call = function(block, recv, sel) {
  throw "rb_block_call not yet implemented"
};
