// 
//  module.js
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-09.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 

// create an anonymous module
cappruby_module_new = function() {
  return cappruby_defiine_module_id("");
};

cappruby_define_module_id = function(id) {
  return objj_alloc_class(id, CPObject, 1, cappruby_cModule);
};

function cappruby_define_module_under(outer, id) {
  var m;
  if (cappruby_const_defined(outer, id)) {
    m = cappruby_const_get(outer, id);
    // check tyoe
    return m;
  }
  m = cappruby_define_module_id(id);
  cappruby_const_set(outer, id, m);
  m.cappruby_parent = outer;
  return m;
};cappruby_break = function(breakValue) {
  var err = new Error();
  err._keyword = 'break';
  err._arg = breakValue;
  err.toString = function() {
    return "break uncaught! (must be outside loop context)";
  };
  throw err;
};

cappruby_next = function() {
  var err = new Error();
  err._keyword = 'next';
  err.toString = function() {
    return "next uncaught! (must be ouside loop context)";
  };
  throw err;
}

cappruby_yield = function(block) {
  // console.log("yielding: " + Array.prototype.slice.call(arguments, 1).join(''));
  if (!block) throw "cappruby_yield: no block given"
  
  switch (arguments.length) {
    case 1: return block(null, null);
    case 2: return block(null, null, arguments[1]);
    case 3: return block(null, null, arguments[1], arguments[2]);
    case 4: return block(null, null, arguments[1], arguments[2], arguments[3]);
    case 5: return block(null, null, arguments[1], arguments[2], arguments[3], arguments[4]);
    default: throw "cappruby_yield: too many args: " + arguments.length
  }
};
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
  
  cappruby_const_set(cappruby_cObject, 'Proc', CPBlock);
  cappruby_const_set(cappruby_cObject, 'Exception', CPException);
  
  cappruby_const_set(cappruby_cObject, 'NilClass', CPNull);
  cappruby_const_set(cappruby_cObject, 'Boolean', CPBoolean);
  cappruby_const_set(cappruby_cObject, 'Number', CPNumber);
  
  cappruby_cSymbol = cappruby_define_class('Symbol', CPObject);
  
  cappruby_const_set(cappruby_cObject, 'Array', CPArray);
  cappruby_const_set(cappruby_cObject, 'String', CPString);
  cappruby_const_set(cappruby_cObject, 'Proc', CPBlock);
  cappruby_const_set(cappruby_cObject, 'Hash', CPDictionary);
  
  cappruby_const_set(cappruby_cObject, 'Time', CPDate);
  
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
cappruby_top_self = nil;

var top_self_to_s = function() {
  
};

// Initialize top self
function Init_top_self() {
  cappruby_top_self = class_createInstance(cappruby_cObject);
  // set top self as a singleton to make sure we can define top level methods
  // on top self, rather than CPObject.
  cappruby_singleton_class(cappruby_top_self);
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
    cappruby_cObject[id] = window[id];
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


cappruby_msgSend = function(recv, sel) {
  var imp;
  
  if (recv === null || recv === undefined) {
    print("using CPNull for " + sel);
    imp = CPNull.method_dtable[sel];
  }
  else
    imp = recv.isa.method_dtable[sel];
    
  if (!imp) {
    // return cappruby_msgSend(recv, 'forward::', sel, Array.prototype.slice.call(arguments));
    var forward = new objj_method("forward", function(self, _cmd)
    {
        return objj_msgSend(self, "forward::", _cmd, arguments);
    });
    imp = forward.method_imp;
    // throw "method_missing: " + sel;
  } else {
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

//array.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
// 
//  array.rb
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-08.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 
cappruby_defineclass(self, nil, "Array", function(self) {
cappruby_define_method(self, "inspect", function(self, _cmd) {
return cappruby_msgSend(self, "description");
});
cappruby_define_method(self, "length", function(self, _cmd) {
return self.length;});
// alias_method :size, :length
cappruby_define_method(self, "to_a", function(self, _cmd) {
return self;
});
cappruby_define_method(self, "push:", function(self, _cmd, val) {
self.push(val);return self;
});
// alias_method :<<, :push
cappruby_define_method(self, "<<:", function(self, _cmd, val) {
return cappruby_msgSend(self, "push:", val);
});
cappruby_define_method(self, "each", function(self, _cmd) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}

    for (var i = 0; i < self.length; i++) {
      try {
        cappruby_yield(block, self[i]);
      }
      catch (err) {
        if (err._keyword == 'break')
          return err._arg;
        else if (err._keyword == 'next')
          break;
        else if (err._keyword == 'redo')
          throw "need to redo.. (Array#each)"
        else
          throw(err);
      }
    }
    return self;
});
cappruby_define_method(self, "include?:", function(self, _cmd, obj) {
return self.indexOf(obj) !== -1;});
cappruby_define_method(self, "empty?", function(self, _cmd) {
return self.length === 0;});
cappruby_define_method(self, "at:", function(self, _cmd, index) {
if (index >= 0) {
      if (index > self.length) return nil;
      return self[index];
    } else {
      if (index < -self.length) return nil;
      return self[self.length + index]; 
    }});
cappruby_define_method(self, "join:", function(self, _cmd, str) {
return self.join(str);});
cappruby_define_method(self, "last", function(self, _cmd) {
return self[self.length - 1];});
cappruby_define_method(self, "first", function(self, _cmd) {
return self[0];});
cappruby_define_method(self, "collect", function(self, _cmd) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}
var i, res = [];
    for (i = 0; i < self.length; i++) {
      res.push(cappruby_yield(block, self[i]));
    }
    return res;});
// alias_method :map, :collect
cappruby_define_method(self, "[]:", function(self, _cmd, index) {
return self[index];});
cappruby_define_method(self, "[]=:", function(self, _cmd, index, value) {
return self[index] = value;});
cappruby_define_method(self, "unshift:", function(self, _cmd, value) {
return self.unshift(value);});
cappruby_define_method(self, "==:", function(self, _cmd, other) {
if (self === other) {
      return true;
    }
    if (other.isa !== CPArray) {
      return false;
    }
    if (self.length !== other.length) {
      return false;
    }
    for (var i = 0; i < self.length; i++) {
      if (!objj_msgSend(self[i], '==:', other[i])) {
        return false;
      }
    }
    return true;});
cappruby_define_method(self, "to_s", function(self, _cmd) {
return cappruby_msgSend(self, "description");
});
cappruby_define_method(self, "inspect", function(self, _cmd) {
return cappruby_msgSend(self, "description");
});
cappruby_define_method(self, "pop", function(self, _cmd) {
return self.pop();});
cappruby_define_method(self, "select", function(self, _cmd) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}
var res = [], v;
    for (var i = 0; i < self.lenth; i++) {
      v = cappruby_yield(block, self[i]);
      if (v) {
        res.push(self[i]);
      }
    }
    return res;});
cappruby_define_method(self, "reject", function(self, _cmd) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}
var res = [], v;
    for (var i = 0; i < self.lenth; i++) {
      v = cappruby_yield(block, self[i]);
      if (!v) {
        res.push(self[i]);
      }
    }
    return res;});
cappruby_define_method(self, "*:", function(self, _cmd, num) {
});
return cappruby_define_method(self, "+:", function(self, _cmd, other) {
});
}, 0);
})();

//basic_object.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
// 
//  basic_object.rb
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-10.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 
cappruby_defineclass(self, nil, "BasicObject", function(self) {
cappruby_define_method(self, "init", function(self, _cmd) {
return self;
});
cappruby_define_method(self, "==:", function(self, _cmd, other) {
return self === other ? true : false;
});
cappruby_define_method(self, "equal?:", function(self, _cmd, other) {
return self === other ? true : false;
});
cappruby_define_method(self, "!", function(self, _cmd) {
return self ? false : true;
});
return cappruby_define_method(self, "!=:", function(self, _cmd, other) {
return cappruby_msgSend(self, "==:", other ? false : true);
});
}, 0);
})();

//boolean.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
// 
//  boolean.rb
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-10.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 
// TrueClass and FalseClass are merged into single Boolean class for Javascript.
// All methods work as expected, as this class handles the correct responses for
// the right class (be it true or false).
cappruby_defineclass(self, nil, "Boolean", function(self) {
// Returns a string representation of the receiver: 'true' for true, and 
// 'false' for false.
// 
// Usage
// =====
// 
//     true.to_s   # "true"
//     false.to_s  # "false"
// 
// @return [String] string representation
// 
cappruby_define_method(self, "to_s", function(self, _cmd) {
return self ? "true" : "false";
});
// Returns string representation of receiver. Same principle as {#to_s}.
// 
// Usage
// =====
// 
//     true.inspect   # "true"
//     false.inspect  # "false"
// 
// @return [String] string representation
//
cappruby_define_method(self, "inspect", function(self, _cmd) {
return self ? "true" : "false";
});
// Performs a boolean AND using the receiver and the given argument. For
// <tt>true</tt>, returns <tt>false</tt> if other is <tt>nil</tt> or 
// <tt>false</tt>, <tt>true</tt> otherwise. For <tt>false</tt>, this method
// always evaluates to <tt>false</tt>.
// 
// Usage
// =====
// 
//     true & nil      # false
//     true & "a"      # true
//     true & 0        # true
//     false & true    # false
//     false & false   # false
// 
// @param [Object] object to compare
// @return [Boolean] result
// 
cappruby_define_method(self, "&:", function(self, _cmd, other) {
if (self){
return other ? true : false;
}else{
return false;
}
});
cappruby_define_method(self, "|:", function(self, _cmd, other) {
if (self){
return true;
}else{
return other ? true : false;
}
});
return cappruby_define_method(self, "^:", function(self, _cmd, other) {
if (self){
return other ? false : true;
}else{
return other ? true : false;
}
});
}, 0);
})();

//class.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
// 
//  class.rb
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-18.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 
cappruby_defineclass(self, nil, "Class", function(self) {
var anonymous_class_count = 0;cappruby_define_singleton_method(self, "new:", function(self, _cmd, super_class) {
// puts "creating subclass #{super_class}"
var klass = objj_allocateClassPair(super_class, "AnonymousClass" + ++anonymous_class_count);
    klass.cappruby_parent = super_class.cappruby_parent;
    // force initialize
    klass.info |= CLS_INITIALIZED;
    klass.isa.info |= CLS_INITIALIZED;
    return klass;
    });
return cappruby_define_singleton_method(self, "new", function(self, _cmd) {
return cappruby_msgSend(self, "new:", cappruby_const_get(self, "Object"));
});
}, 0);
})();

//error.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
// 
//  error.rb
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-11.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 
cappruby_defineclass(self, nil, "Exception", function(self) {
cappruby_define_method(self, "init", function(self, _cmd, message) {
cappruby_msgSend(self, "initWithName:reason:userInfo:", self.name, message, nil);
return self;
});
cappruby_define_method(self, "setMessage:", function(self, _cmd, message) {
return self.message = message;});
cappruby_define_method(self, "message", function(self, _cmd) {
return self.message;});
return cappruby_define_method(self, "inspect", function(self, _cmd) {
// <Exception: something>
return ["#", "<", objj_msgSend(cappruby_msgSend(cappruby_msgSend(self, "class"), "className"), 'to_s'), ": ", objj_msgSend(cappruby_msgSend(self, "message"), 'to_s'), ">"].join("");
});
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "Exception"), "SystemExit", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "Exception"), "Fatal", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "Exception"), "SignalException", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "SignalException"), "Interrupt", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "Exception"), "StandardError", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "StandardError"), "TypeError", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "StandardError"), "ArgumentError", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "StandardError"), "IndexError", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "IndexError"), "KeyError", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "StandardError"), "RangeError", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "Exception"), "ScriptError", function(self) {
}, 0);
// class SyntaxError < ScriptError; end
// class LoadError < SyntaxError; end
cappruby_defineclass(self, cappruby_const_get(self, "StandardError"), "NotImplementedError", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "StandardError"), "NameError", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "NameError"), "NoMethodError", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "StandardError"), "RuntimeError", function(self) {
}, 0);
})();

//hash.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
// 
//  hash.rb
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-12.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 
cappruby_defineclass(self, nil, "Hash", function(self) {
cappruby_define_method(self, "[]=:", function(self, _cmd, key, value) {
cappruby_msgSend(self, "setObject:forKey:", value, key);
return value;
});
cappruby_define_method(self, "[]:", function(self, _cmd, key) {
return cappruby_msgSend(self, "objectForKey:", key);
});
cappruby_define_method(self, "each", function(self, _cmd) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}
var i = 0, keys = self._keys, values = self._buckets;
    for (var i = 0; i < keys.length; i++) {
      cappruby_yield(block, keys[i], values[keys[i]]);
    }
    return self;
    });
// alias_method :each_pair, :each
cappruby_define_method(self, "each_key", function(self, _cmd) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}
var i = 0, keys = self._keys;
    for (var i = 0; i < keys.length; i++) {
      cappruby_yield(block, keys[i]);
    }
    return self;
    });
cappruby_define_method(self, "each_value", function(self, _cmd) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}
var i = 0, keys = self._keys, values = self._buckets;
    for (var i = 0; i < keys.length; i++) {
      cappruby_yield(block, values[keys[i]]);
    }
    return self;
    });
cappruby_define_method(self, "merge:", function(self, _cmd, options) {
var result;
result = cappruby_msgSend(cappruby_const_get(self, "Hash"), "dictionaryWithDictionary:", self);
cappruby_msgSend(result, "addEntriesFromDictionary:", options);
return result;
});
cappruby_define_method(self, "empty?", function(self, _cmd) {
return self._keys.length == 0;});
cappruby_define_method(self, "size", function(self, _cmd) {
return cappruby_msgSend(self, "count");
});
// alias_method :length, :size
cappruby_define_method(self, "include?:", function(self, _cmd, member) {
return cappruby_msgSend(self, "containsKey:", member);
});
// alias_method :member?, :include?
// alias_method :has_key?, :include?
// alias_method :key?, :include?
cappruby_define_method(self, "delete:", function(self, _cmd, key) {
var value;
value = self._buckets[key];
cappruby_msgSend(self, "removeObjectForKey:", key);
return value;
});
return cappruby_define_method(self, "==:", function(self, _cmd, other) {
return cappruby_msgSend(self, "isEqual:", other);
});
}, 0);
})();

//kernel.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
// 
//  kernel.rb
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-10.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 
// Currently modules dont exist, so cheat and add Kernel's methods directly into
// CPObject.
cappruby_defineclass(self, nil, "Object", function(self) {
cappruby_define_method(self, "puts:", function(self, _cmd, args) {
args = Array.prototype.slice.call(arguments, 2);
cappruby_msgSend(args, "each", function(_self, __cmd, arg) {
with ({ self: (_self == nil ? self : _self), _cmd: (__cmd == nil ? _cmd : __cmd) }) {
(typeof CPLogPrint !== 'undefined') ? print(arg) : CPLogConsole(arg, 'info', arg);}
});
return nil;
});
cappruby_define_method(self, "nil?", function(self, _cmd) {
return false;
});
cappruby_define_method(self, "===:", function(self, _cmd, other) {
return cappruby_msgSend(self, "==:", other);
});
cappruby_define_method(self, "tap", function(self, _cmd) {
var _block = arguments[arguments.length - 1];
if (!(_block) ||_block.isa !== CPBlock) {_block = undefined;}
cappruby_yield(_block, self);
return self;
});
cappruby_define_method(self, "=~:", function(self, _cmd, matcher) {
return nil;
});
cappruby_define_method(self, "!~:", function(self, _cmd, matcher) {
return cappruby_msgSend(self, "=~:", cappruby_msgSend(self, "obj") ? false : true);
});
cappruby_define_method(self, "eql?:", function(self, _cmd, other) {
return self === other ? true : false;
});
cappruby_define_method(self, "raise:", function(self, _cmd, exception, string) {
var msg, exc;
// puts "going to raise error.."
// puts exception
// puts exception.is_a?(Exception)
// puts "exception class: #{exception.class}"
msg = "";
if (cappruby_msgSend(exception, "is_a?:", cappruby_const_get(self, "String"))){
// puts "string"
msg = exception;
exc = cappruby_msgSend(cappruby_const_get(self, "RuntimeError"), "new:", msg);
}else if (cappruby_msgSend(exception, "is_a?:", cappruby_const_get(self, "Exception"))){
// puts "exception"
exc = exception;
}else{
// puts "its a class"
msg = string;
exc = cappruby_msgSend(exception, "new:", msg);
}
throw exc;return self;
});
// alias_method :fail, :raise
cappruby_define_method(self, "object_id", function(self, _cmd) {
return objj_msgSend(self, 'UID');});
cappruby_define_method(self, "respond_to?:", function(self, _cmd, method_id) {
return cappruby_msgSend(self, "respondsToSelector:", cappruby_msgSend(method_id, "to_s"));
});
cappruby_define_method(self, "to_s", function(self, _cmd) {
return cappruby_msgSend(self, "description");
});
cappruby_define_method(self, "inspect", function(self, _cmd) {
return cappruby_msgSend(self, "to_s");
});
cappruby_define_method(self, "__send__:", function(self, _cmd, method, arg) {
var result;
cappruby_msgSend(self, "puts:", ["in send for ", objj_msgSend(method, 'to_s'), " from ", objj_msgSend(cappruby_msgSend(self, "inspect"), 'to_s')].join(""));
cappruby_msgSend(self, "puts:", self);
// meth
result = cappruby_msgSend(self, 'method:', arg);
// result = `cappruby_msgSend(#{self}, 'inspect', #{arg})`
cappruby_msgSend(self, "puts:", ["result is: ", objj_msgSend(cappruby_msgSend(result, "inspect"), 'to_s')].join(""));
return result;
});
cappruby_define_method(self, "instance_of?:", function(self, _cmd, cls) {
return cappruby_msgSend(self, "isMemberOfClass:", cls);
});
cappruby_define_method(self, "kind_of?:", function(self, _cmd, cls) {
return cappruby_msgSend(self, "isKindOfClass:", cls);
});
// alias_method :is_a?, :kind_of?
// FIXME: implement alias
cappruby_define_method(self, "is_a?:", function(self, _cmd, cls) {
return cappruby_msgSend(self, "isKindOfClass:", cls);
});
cappruby_define_method(self, "instance_eval", function(self, _cmd) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}
// if string
//   raise "Kernel.instance_eval with string not yet implemented"
// end
// raise "no block given for instance_eval" unless block
return block(self, null);});
cappruby_define_method(self, "instance_exec:", function(self, _cmd, arg) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}
return block(self, null, arg);});
cappruby_define_method(self, "instance_variable_set:", function(self, _cmd, ivarname, value) {
return self[ivarname] = value;});
return cappruby_define_method(self, "instance_variable_get:", function(self, _cmd, ivarname) {
return self[ivarname];});
}, 0);
})();

//match_data.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
// 
//  match_data.rb
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-13.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 
cappruby_defineclass(self, nil, "MatchData", function(self) {
cappruby_define_method(self, "init", function(self, _cmd, data) {
self["@data"] = data;
return self;
});
cappruby_define_method(self, "inspect", function(self, _cmd) {
return ["#", "<MatchData '", objj_msgSend(cappruby_msgSend(self["@data"], "[]:", 0), 'to_s'), "'>"].join("");
});
cappruby_define_method(self, "to_s", function(self, _cmd) {
return cappruby_msgSend(self["@data"], "[]:", 0);
});
cappruby_define_method(self, "[]:", function(self, _cmd, index) {
return cappruby_msgSend(self["@data"], "[]:", index);
});
return cappruby_define_method(self, "length", function(self, _cmd) {
return self["@data"].length;});
// alias_method :size, :length
}, 0);
})();

//module.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
// Currently modules do not exist, so cheat and add module methods directly into
// CPObject's meta chain.
(function(self) {
// if Klass.new is called with args
cappruby_define_method(self, "new:", function(self, _cmd, args) {
args = Array.prototype.slice.call(arguments, 2);
var r = objj_msgSend(self, 'alloc');
    return objj_msgSend.apply(r, [r, 'init'].concat(args));});
// Define a method, with the given method_id, with block as its implementation
// 
// @param {Symbol} method_id
// @param {Proc} block
cappruby_define_method(self, "define_method:", function(self, _cmd, method_id) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}
var block = arguments[arguments.length - 1];
    return cappruby_define_method(self, cappruby_msgSend(method_id, "to_s"), block);});
cappruby_define_method(self, "alias_method:", function(self, _cmd, new_method, old_method) {
return cappruby_alias(self, new_method._sym, old_method._sym);});
cappruby_define_method(self, "===:", function(self, _cmd, instance) {
return cappruby_msgSend(instance, "is_a?:", self);
});
cappruby_define_method(self, "attr:", function(self, _cmd, attributes) {
});
cappruby_define_method(self, "attr_reader:", function(self, _cmd, attrbutes) {
attrbutes = Array.prototype.slice.call(arguments, 2);
// attributes.each do |attribute|
//   define_method attribute do
//     `return #{self}['#{attribute}'];`
//   end
// end
});
cappruby_define_method(self, "attr_writer:", function(self, _cmd, attributes) {
attributes = Array.prototype.slice.call(arguments, 2);
});
cappruby_define_method(self, "attr_accessor:", function(self, _cmd, attributes) {
attributes = Array.prototype.slice.call(arguments, 2);
// attr_reader *attributes
// attr_writer *attributes
});
cappruby_define_method(self, "const_set:", function(self, _cmd, name, value) {
return cappruby_const_set(self, name, value);});
return cappruby_define_method(self, "module_eval", function(self, _cmd) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}
return block(self, "");});
})(cappruby_singleton_class(cappruby_const_get(self, "CPObject")));
})();

//nilclass.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
cappruby_defineclass(self, nil, "NilClass", function(self) {
cappruby_define_method(self, "nil?", function(self, _cmd) {
return true;
});
cappruby_define_method(self, "inspect", function(self, _cmd) {
return "nil";
});
return cappruby_define_method(self, "==:", function(self, _cmd, other) {
print("in nil.==");print(self);print(other);return self === other;});
}, 0);
})();

//number.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
// 
//  number.rb
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-10.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 
cappruby_defineclass(self, nil, "Number", function(self) {
cappruby_define_method(self, "+:", function(self, _cmd, other) {
return self + other;});
cappruby_define_method(self, "-:", function(self, _cmd, other) {
return self - other;});
cappruby_define_method(self, "*:", function(self, _cmd, other) {
return self * other;});
cappruby_define_method(self, "/:", function(self, _cmd, other) {
return self / other;});
cappruby_define_method(self, "%:", function(self, _cmd, other) {
return self % other;});
cappruby_define_method(self, "**:", function(self, _cmd, other) {
return Math.pow(self, other);});
cappruby_define_method(self, "+@", function(self, _cmd) {
return self;
});
cappruby_define_method(self, "-@", function(self, _cmd) {
return -self;});
cappruby_define_method(self, ">:", function(self, _cmd, other) {
return self > other;});
cappruby_define_method(self, ">=:", function(self, _cmd, other) {
return self >= other;});
cappruby_define_method(self, "<:", function(self, _cmd, other) {
return self < other;});
cappruby_define_method(self, "<=:", function(self, _cmd, other) {
return self <= other;});
cappruby_define_method(self, "<<:", function(self, _cmd, other) {
return self << self;});
cappruby_define_method(self, ">>:", function(self, _cmd, other) {
return self >> other;});
cappruby_define_method(self, "|:", function(self, _cmd, other) {
return self | other;});
cappruby_define_method(self, "&:", function(self, _cmd, other) {
return self & other;});
cappruby_define_method(self, "to_s", function(self, _cmd) {
return self.toString();});
cappruby_define_method(self, "inspect", function(self, _cmd) {
return self.toString();});
cappruby_define_method(self, "<=>:", function(self, _cmd, other) {

    if (self === other)
      return 0;
    else if (self < other)
      return -1;
    return 1;
    });
cappruby_define_method(self, "real?", function(self, _cmd) {
return self != Math.round(self);});
cappruby_define_method(self, "integer?", function(self, _cmd) {
return self == Math.round(self);});
cappruby_define_method(self, "nonzero?", function(self, _cmd) {
return self !== 0;});
cappruby_define_method(self, "zero?", function(self, _cmd) {
return self === 0;});
cappruby_define_method(self, "==:", function(self, _cmd, other) {
return self === other;});
cappruby_define_method(self, "eql?:", function(self, _cmd, other) {
return self === other;});
cappruby_define_method(self, "even?", function(self, _cmd) {
return (self %2 ==0) ? true : false;});
cappruby_define_method(self, "odd?", function(self, _cmd) {
return (self %2 == 0) ? false : true;});
cappruby_define_method(self, "pred", function(self, _cmd) {
return --self;});
cappruby_define_method(self, "next", function(self, _cmd) {
return ++self;});
// alias_method :succ, :next
cappruby_define_method(self, "^:", function(self, _cmd, other) {
return self ^ other;});
cappruby_define_method(self, "~", function(self, _cmd) {
return ~self;});
cappruby_define_method(self, "to_f", function(self, _cmd) {
return parseFloat(self);});
cappruby_define_method(self, "to_i", function(self, _cmd) {
return parseInt(self);});
// alias_method :to_int, :to_i
cappruby_define_method(self, "floor", function(self, _cmd) {
return Math.floor(self);});
cappruby_define_method(self, "ceil", function(self, _cmd) {
return Math.ceil(self);});
cappruby_define_method(self, "round", function(self, _cmd) {
return Math.round(self);});
cappruby_define_method(self, "truncate", function(self, _cmd) {
return Math.round(self);});
cappruby_define_method(self, "times:", function(self, _cmd, number) {
var _block = arguments[arguments.length - 1];
if (!(_block) ||_block.isa !== CPBlock) {_block = undefined;}
for (var i = 0; i < number; i++) {
      cappruby_yield(_block, i);
    }return self;
});
cappruby_define_method(self, "upto:", function(self, _cmd, stop) {
var _block = arguments[arguments.length - 1];
if (!(_block) ||_block.isa !== CPBlock) {_block = undefined;}
// return self if `#{stop}<#{self}`
for (var i = self; i<= stop; i++) {
      cappruby_yield(_block, i);
    }return self;
});
return cappruby_define_method(self, "downto:", function(self, _cmd, stop) {
var _block = arguments[arguments.length - 1];
if (!(_block) ||_block.isa !== CPBlock) {_block = undefined;}
// return self if `#{stop}>#{self}`
for (var i = self; i >= stop; i--) {
      cappruby_yield(_block, i);
    }return self;
});
}, 0);
})();

//proc.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
// 
//  proc.rb
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-18.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 
cappruby_defineclass(self, nil, "Proc", function(self) {
cappruby_define_singleton_method(self, "new", function(self, _cmd) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}
return block;
});
cappruby_define_method(self, "to_proc", function(self, _cmd) {
return self;
});
return cappruby_define_method(self, "call:", function(self, _cmd, arg1, arg2, arg3, arg4) {
return self(null, null, arg1, arg2, arg3, arg4);});
}, 0);
})();

//regexp.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
// 
//  regexp.rb
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-13.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 
cappruby_defineclass(self, nil, "Regexp", function(self) {
cappruby_define_singleton_method(self, "new:", function(self, _cmd, str) {
return new RegExp(str);});
cappruby_define_method(self, "===:", function(self, _cmd, str) {
return self.exec(str) ? true : false;});
cappruby_define_method(self, "match:", function(self, _cmd, str) {
var m;
if (m = self.exec(str)){
return cappruby_msgSend(cappruby_const_get(self, "MatchData"), "new:", m);
}else{
return nil;
}
});
return cappruby_define_method(self, "inspect", function(self, _cmd) {
return self.toString();});
}, 0);
})();

//string.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
cappruby_defineclass(self, nil, "String", function(self) {
cappruby_define_method(self, "==:", function(self, _cmd, other) {
return self === other;});
cappruby_define_method(self, "eql?:", function(self, _cmd, other) {
return self === other;});
cappruby_define_method(self, "empty?", function(self, _cmd) {
return self.length === 0;});
cappruby_define_method(self, "reverse", function(self, _cmd) {
return self.split("").reverse().join("");});
cappruby_define_method(self, "intern", function(self, _cmd) {
return ID2SYM(self);});
// alias_method :to_sym, :intern
cappruby_define_method(self, "length", function(self, _cmd) {
return self.length;});
// alias_method :size, :length
cappruby_define_method(self, "+:", function(self, _cmd, other) {
return self + other;});
cappruby_define_method(self, "to_s", function(self, _cmd) {
return new String(self);});
// alias_method :to_str, :to_s
cappruby_define_method(self, "inspect", function(self, _cmd) {
return '"' + self + '"';});
cappruby_define_method(self, "upcase", function(self, _cmd) {
return self.toUpperCase();});
cappruby_define_method(self, "downcase", function(self, _cmd) {
return self.toLowerCase();});
cappruby_define_method(self, "capitalize", function(self, _cmd) {
return self[0].toUpperCase() + self.substr(1).toLowerCase();});
cappruby_define_method(self, "*:", function(self, _cmd, other) {
});
return cappruby_define_method(self, "each", function(self, _cmd) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}
});
// alias_method :each_line, :each
}, 0);
})();

//symbol.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
// 
//  symbol.rb
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-10.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 
// 
// @class Symbol
// 
// The Ruby Symbol class for symbol literals. You cannot instantiate a new symbol
// instance; an error will be thrown if you try.
// 
cappruby_defineclass(self, nil, "Symbol", function(self) {
cappruby_define_method(self, "init", function(self, _cmd) {
cappruby_msgSend(self, "raise:", "cannot instantiate new Symbol instance");
return self;
});
cappruby_define_method(self, "==:", function(self, _cmd, other) {
return self === other ? true : false;
});
cappruby_define_method(self, "inspect", function(self, _cmd) {
return ":" + self._sym;});
cappruby_define_method(self, "to_s", function(self, _cmd) {
return self._sym;});
// alias_method :id2name, :to_s
// FIXME: alias_method
cappruby_define_method(self, "id2name", function(self, _cmd) {
return cappruby_msgSend(self, "to_s");
});
cappruby_define_method(self, "to_sym", function(self, _cmd) {
return self;
});
// alias_method :intern, :to_sym
// FIXME: alias_method
cappruby_define_method(self, "intern", function(self, _cmd) {
return self;
});
cappruby_define_method(self, "to_proc", function(self, _cmd) {
var id = self._sym;
    var f = function(self, _cmd, o) {
      return objj_msgSend(o, id); 
    };
    return f;});
cappruby_define_method(self, "succ", function(self, _cmd) {
return self;
});
// alias_method :next, :succ
cappruby_define_method(self, "length", function(self, _cmd) {
return self._sym.length;});
// alias_method :size, :length
cappruby_define_method(self, "upcase", function(self, _cmd) {
return ID2SYM(self._sym.toUpperCase());});
cappruby_define_method(self, "downcase", function(self, _cmd) {
return ID2SYM(self._sym.toLowerCase());});
return cappruby_define_method(self, "capitalize", function(self, _cmd) {
return ID2SYM(self._sym[0].toUpperCase() +self._sym.substr(1).toLowerCase());});
}, 0);
})();

//time.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
cappruby_defineclass(self, nil, "Time", function(self) {
cappruby_define_singleton_method(self, "now", function(self, _cmd) {
return cappruby_msgSend(self, "new");
});
return cappruby_define_method(self, "-:", function(self, _cmd, another) {
return self.getTime() - another.getTime();});
}, 0);
})();

//top_self.rb
(function() {
var self = cappruby_top_self;
var _cmd = "";
cappruby_define_method(self, "to_s", function(self, _cmd) {
return "main";
});
return cappruby_define_method(self, "inspect", function(self, _cmd) {
return "main";
});
})();
