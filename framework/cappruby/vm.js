// 
//  vm.js
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-08.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 

// main context object
cappruby_top_self = nil;

var top_self_to_s = function() {
  
};

// Initialize top self
function Init_top_self() {
  cappruby_top_self = class_createInstance(cappruby_cObject);
  cappruby_define_singleton_method(cappruby_top_self, 'to_s', function() {
    return 'main';
  });
};

cappruby_defineclass = function(base, super_class, name, body, flag) {
  var klass;
  
  // cheap hack. if its an object, then we need to get its real class
  if (!base.info) base = cappruby_class_real(base.isa);
  
  switch (flag) {
    case 0:  // normal class
      if (super_class === nil) super_class = CPObject;
      klass = cappruby_define_class_under(base, name, super_class);
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
      console.log(klass);
      throw "not a singleton.. need to make it one."
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
  // console.log("defininf on:");
  // console.log(receiver);
  return class_addMethod(receiver, selector, body, []);
};

cappruby_define_singleton_method = function() {
  
};

cappruby_const_set = function(klass, id, val) {
  klass[id] = val;
};

cappruby_const_defined = function(klass, id) {
  while(klass) {
    if (klass[id] !== undefined) return true;
    klass = klass.super_class;
  }
  // try window/global scope..
  // FIXME: commonjs needs global..
  if (window[id] !== undefined) return true;
  return false;
};

cappruby_const_get = function(klass, id) {
  while (klass) {
    if (klass[id] !== undefined) return klass[id];
    klass = klass.super_class;
  }
  
  if (window[id] !== undefined) return window[id];
  return false;
};

Init_CappRuby();
Init_top_self();


// cappruby_msgSend(receiver, selector, block, arg1, arg2.....argN)
// cappruby_msgSend = function(recv, sel, block) {
//   
//   var isa = (recv === nil) ? cappruby_cNilClass : recv.isa;
//   var imp = isa.method_dtable[sel].method_imp;
//   
//   cappruby_block = block;
//   
//   switch (arguments.length) {
//     case 3: return imp(recv, sel);
//     case 4: return imp(recv, sel, arguments[3]);
//     case 5: return imp(recv, sel, arguments[3], arguments[4]);
//     case 6: return imp(recv, sel, arguments[3], arguments[4], arguments[5]);
//     case 7: return imp(recv, sel, arguments[3], arguments[4], arguments[5], arguments[6]);
//   }
//   
//   throw "cappruby_msgSend: unsupported arg send length: " + (arguments.length - 3)
// };
