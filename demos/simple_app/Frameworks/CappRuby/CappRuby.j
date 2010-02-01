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
  var _$ = cappruby_block; cappruby_block = nil;
  if (!_$) throw "no block passed to ary#each. need to return enumerator"

  for (var i = 0; i < ary.length; i++) {
    cr_yield(_$, [ary[i]]);
  }
};

function Init_Array() {
  rb_cArray = objj_getClass("CPArray");
  // rb_include_module(rb_cArray, rb_mEnumerable);
  
  // rb_define_singleton_method(rb_cArray, "[]", rb_ary_s_create, -1);
  // rb_define_singleton_method(rb_cArray, "try_convert", rb_ary_s_create, 1);
  
  rb_define_method(rb_cArray, "each", rb_ary_each, 0);
};
/* 
 * button.js
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

function cr_mappings_button(self, sel, options) {
  var _$ = cappruby_block; cappruby_block = nil;
  var h = cr_mappings_collate_options('button', options);

  var btn = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(100,100,84,24));

  if(_$) { // if block given
   cr_yield(_$, [btn]);
  }

  objj_msgSend(btn, "setTitle:", "My Button");

  return btn;
};

/**
  CPButton#on_action(&block)
  
  When the action event of the button fires, run the block.
  
  This method makes a fake target for the button, and adds a single method, to
  act as the action, which essentially calls the proc. The proc will have access
  to the scope in which it was defined.
*/
function cr_window_on_action(btn, sel) {
  var _$ = cappruby_block; cappruby_block = nil;
  if (!_$) {
    throw "no block given for CPButton#on_action"
  }
  
  var target = class_createInstance(rb_cObject);
  rb_define_singleton_method(target, "button_action:",function(self, sel, obj) {
    // call the proc with the "sender" as the param (if needed)
    rb_ivar_get(self, '@button_action')(obj);
  }, 1);
  
  rb_ivar_set(target, '@button_action', _$);
  
  objj_msgSend(btn, "setTarget:", target); 
  objj_msgSend(btn, "setAction:", 'button_action:');  
  
  return btn;
};

function Init_Mappings_Button() {
  rb_define_method(rb_mKernel, "button:", cr_mappings_button, 1);
  rb_define_method(CPButton, "on_action", cr_window_on_action, 0);
};
/* 
 * cappruby.js
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

/**
  Main CappRuby entry point. 
  
  main_file - the .rb file to load (and run)
  args - Passed from main. We send these to CPApplicationMain
  namedArgs - ditto.
*/
function cappruby_main(main_file, args, namedArgs) {
  cappruby_init();
  cappruby_file_hash['/lib/application.rb'](cappruby_top_self);
  // cappruby_trial(cappruby_top_self);
  CPApplicationMain(args, namedArgs);
  // console.log("jere");
};

/**
  call all cappruby inits
*/
function cappruby_init() {
  Init_Object();
  Init_Array();
  Init_String();
  Init_Proc();
  Init_VM();
  Init_Mappings();
};
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

function rb_define_method(klass, id, func, arity) {
  var m = new cappruby_method_t(id, func, []);
  m.arity = arity;
  
  klass.method_list.push(m);
  klass.method_dtable[id] = m;
  m.method_imp.displayName = klass.name + "#" + id;
  return true;
};

function rb_define_singleton_method(klass, id, func, arity) {
  return rb_define_method(rb_singleton_class(klass), id, func, arity);
};

/**
  Returns the singleton class. Meta classes are already singleton classes,
  so this method just returns the meta class itself. Classes in objj are
  not singleton, so a new class will be created, and returned, and then 
  injected into the hierarchy. CLS_META identifies meta classes, while
  CLS_CLASS identifies classes. A singleton class will have a CLS_SINGLETON
  also, which is added on creation. Note, althogh a meta class is singleton,
  it will not have a CLS_SINGLETON mask
*/
function rb_singleton_class(klass) {
  if (klass.isa.info & CLS_CLASS) {
    if (klass.isa.info & CLS_SINGLETON) {
      // already a singleton
      return klass.isa;
    }
    else {
      // not a singleton, so make it one. keep same name
      var s = objj_allocateClassPair(klass.isa, klass.isa.name);
      _class_initialize(s);
      s.info |= CLS_SINGLETON;
      klass.isa = s;
      return klass.isa;
    }
  }
  else {
    // meta class, so its already a singleton
    return klass.isa;
  }
};

function boot_defclass(id, superclass) {
  var o = rb_class_boot(superclass, id);
  // rb_class_tbl[id] = o;
  rb_const_set((rb_cObject ? rb_cObject : o), id, o);
  return o;
};

function rb_class_boot(superclass, name) {
    return rb_objj_create_class(name, superclass);
};

function rb_objj_create_class(name, superclass) {
    var RB_CLASS = 0;
    return rb_objj_alloc_class(name, superclass, RB_CLASS, nil);
};

function rb_alloc_class(type, klass) {
  var obj = new RClass();
  obj.$klass = klass;
  obj.$type = type;
  return obj;
};

rb_anonymous_count = 0;

function rb_objj_alloc_class(name, superclass, type, klass) {
    name = name || ("RubyAnonymous" + rb_anonymous_count++);
    superclass = superclass || rb_cObject;
    var o = objj_allocateClassPair(superclass, name);
    objj_registerClassPair(o);
    return o;
};
/* 
 * enumerator.js
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

rb_cEnumerator = nil;

function rb_enumerator_alloc(cls, sel) {
  return CPEnumerator;
};

function Init_Enumerator() {
  // Is this silly?
  rb_cEnumerator = objj_getClass("CPEnumerator");
  // rb_include_module(rb_cEnumerator, rb_mEnumerable);
  
  rb_define_singleton_method(rb_cEnumerator, "alloc", rb_enumerator_alloc, 0);
};
/* 
 * file.js
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

/**
  hash of all full filenames => contents. Ruby files will be wrapped in a func
  so execute it.
*/
cappruby_file_hash = { };

/**
  Loaded from the application as "compiled ruby code"
  
  - file is the filepath of the "ruby file" : used for require()
  - content is the compiled ruby, as javascript. It is enclosed in a function()
    so to run it (on require), simply execute the content e.g. c();
*/
function cappruby_file(file, content) {
  cappruby_file_hash[file] = content;
};
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
/* 
 * hash.js
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

rb_cHash = nil;

/**
  Create a new hash. Only called from JS. args are keys and values, so:
  key1, val1, key2, val2, .......keyN, valN.
*/
function rb_hash_new() {
  var k, v, h = new objj_dictionary();
  for (var i = 0; i < arguments.length; i++) {
    k = arguments[i], v = arguments[i+1];
    i ++;
    dictionary_setValue(h, k, v);
  }
  return h;
};

function rb_hash_delete(hash, sel, id) {
  var r = dictionary_getValue(hash, id);
  dictionary_removeValue(hash, id);
  return r;
};

function rb_hash_merge(hash, sel, options) {
    return objj_msgSend(hash, "addEntriesFromDictionary:", options);
};


function Init_Hash() {
  rb_cHash = objj_getClass("CPDictionary");
  rb_const_set(rb_cObject, "Hash", rb_cHash);
  
  // rb_include_module(rb_cHash, rb_mEnumerable);
  
  // rb_define_singleton_method(rb_cHash, "[]", rb_hash_s_create, -1);
  // rb_define_singleton_method(rb_cHash, "try_convert", rb_hash_s_try_convert, 1);
  rb_define_method(rb_cHash, "initialize", rb_hash_initialize, -1);

  // rb_define_method(rb_cHash, "to_hash", rb_hash_to_hash, 0);
  // rb_define_method(rb_cHash, "to_a", rb_hash_to_a, 0);
  // rb_define_method(rb_cHash, "to_s", rb_hash_inspect, 0);
  // rb_define_method(rb_cHash, "inspect", rb_hash_inspect, 0);

  // rb_define_method(rb_cHash, "==", rb_hash_equal, 1);
  // rb_define_method(rb_cHash, "[]", rb_hash_aref, 1);
  // rb_define_method(rb_cHash, "eql?", rb_hash_eql, 1);
  // rb_define_method(rb_cHash, "fetch", rb_hash_fetch, -1);
  // rb_define_method(rb_cHash, "[]=", rb_hash_aset, 2);
  // rb_define_method(rb_cHash, "store", rb_hash_aset, 2);
  // rb_define_method(rb_cHash, "default", rb_hash_default, -1);
  // rb_define_method(rb_cHash, "default=", rb_hash_set_default, 1);
  // rb_define_method(rb_cHash, "default_proc", rb_hash_default_proc, 0);
  // rb_define_method(rb_cHash, "key", rb_hash_key, 1);
  // rb_define_method(rb_cHash, "index", rb_hash_index, 1);
  // rb_define_method(rb_cHash, "size", rb_hash_size, 0);
  // rb_define_method(rb_cHash, "length", rb_hash_size, 0);
  // rb_define_method(rb_cHash, "empty?", rb_hash_empty_p, 0);

  // rb_define_method(rb_cHash, "each_value", rb_hash_each_value, 0);
  // rb_define_method(rb_cHash, "each_key", rb_hash_each_key, 0);
  // rb_define_method(rb_cHash, "each_pair", rb_hash_each_pair, 0);
  // rb_define_method(rb_cHash, "each", rb_hash_each_pair, 0);

  // rb_define_method(rb_cHash, "keys", rb_hash_keys, 0);
  // rb_define_method(rb_cHash, "values", rb_hash_values, 0);
  // rb_define_method(rb_cHash, "values_at", rb_hash_values_at, -1);

  // rb_define_method(rb_cHash, "shift", rb_hash_shift, 0);
  rb_define_method(rb_cHash, "delete:", rb_hash_delete, 1);
  // rb_define_method(rb_cHash, "delete_if", rb_hash_delete_if, 0);
  // rb_define_method(rb_cHash, "select", rb_hash_select, 0);
  // rb_define_method(rb_cHash, "reject", rb_hash_reject, 0);
  // rb_define_method(rb_cHash, "reject!", rb_hash_reject_bang, 0);
  // rb_define_method(rb_cHash, "clear", rb_hash_clear, 0);
  // rb_define_method(rb_cHash, "invert", rb_hash_invert, 0);

  // rb_define_method(rb_cHash, "update", rb_hash_update, 1);
  // rb_define_method(rb_cHash, "replace", rb_hash_replace, 1);
  // rb_define_method(rb_cHash, "merge!", rb_hash_update, 1);
  rb_define_method(rb_cHash, "merge:", rb_hash_merge, 1);
  // rb_define_method(rb_cHash, "assoc", rb_hash_assoc, 1);
  // rb_define_method(rb_cHash, "rassoc", rb_hash_rassoc, 1);
  // rb_define_method(rb_cHash, "flatten", rb_hash_flatten, -1);
};
/* 
 * mapings.js
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

/**
  Mappings are a port/inspired of the Hotcocoa mappings
*/

/**
  Stores all "default" options that can be used by mappings.
*/
cr_mappings_defaults_store = nil;

/**
  Setup the defaults. We do not want to do this until we can use the hash, so we
  pop it into the Init_x functions call sequences.
*/
function cr_mappings_default_init() {
  cr_mappings_defaults_store = {

    'window': rb_hash_new(
      // window title
      ID2SYM("title"), "Window",
      // frame can be an array, which is automatically converted into a rect
      ID2SYM("frame"), [100, 100, 400, 500]
    )
  };
};

/**
  merge default and given options
  
  our options need to be merged into our defaults, so our user options will
  overwrite the defaults where new ones are specified, or use the old ones
  where they are not specified.
*/
function cr_mappings_collate_options(name, options) {
  var h = new objj_dictionary();
  rb_hash_merge(h, 'merge', cr_mappings_defaults_store[name]);
  rb_hash_merge(h, 'merge', options);
  return h;
};

/**
  Once important options have been set, the rest can be applied to any given 
  object by assuming they have kvo setters to set the properties.
  
  Important options should be #delete! from the hash, so when it is given here,
  they will not be reset.
*/
function cr_mappings_set_options(obj, hash) {
  
};

/**
  Initialize mappings. All methods are added to Kernel module to avoid 
  over populating the Object namespace. (hide from Cappuccino).
*/
function Init_Mappings() {
  // setup defaults.
  cr_mappings_default_init();
  Init_Mappings_Window();
  Init_Mappings_Button();
  Init_Mappings_Slider();
  Init_Mappings_Geometry();
};
/* 
 * method.js
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

/**
  cappruby method. Similar to objj_method, but takes extra "ruby specific" bits
  and pieces.
*/
function cappruby_method_t(name, imp, types) {
  this.name = name;
  this.method_imp = imp;
  this.types = types;

  // this is set to true if the method is a cappruby method
  this.capprubymethod = true;
  // arity
  this.arity = 0;
};

/**
  global functions. Some methods in ruby can be defined as "global functions".
  These all begin with uppercase lettters, and look like constants. All global
  functions are stored in this table. As an exception for objj, searching for 
  global functions will first search this table, and then, search the global
  namespace. This will allow CoreGraphics, CGRect, CPApplicationMain etc all to
  become available to ruby. Note, with global functions, no "self" property is 
  used. This allows functions from objj to be seemesly used.
*/
rb_global_functions_table = { };

function rb_global_functions_search(id) {
  if (rb_global_functions_table[id]) {
    return rb_global_functions_table[id];
  }
  // if found in window/global, ensure it is a function.
  else if (window[id] && typeof window[id] === 'function') {
    return window[id];
  }
  // not found..
  return nil;
};
 
/**
 Search for the method in klass. Additons to objj search are that it searches
 modules as well, which are attatched to classes via rb_included_modules.
*/
function rb_search_method(klass, id) {
 var m = klass.method_dtable[id];

 if (!m) {
   // this whole loop is to look for included moduels. method_dtable takes care
   // of all inherited methods. Also, by definitoons, look at methods on class
   // before included methods...
   while (klass) {
     if (klass.rb_included_modules) {
       for (var i = 0; i < klass.rb_included_modules.length; i++) {
         if (m = klass.rb_included_modules[i].method_dtable[id]) {
           break;
         }
       }
       if (m) break;
     }
     klass = klass.super_class;
   }
   // if we found it
   if (m) return m.method_imp;
   return nil;
 }
 // if found straight away..
 return m.method_imp;
};

/**
  If we dont have a .isa property, find out the type of class. We can, for 
  instance, guess its a rect/point/size etc, and add a .isa property to it for
  the future. If all else fails, we assume it to be a regular JSON object. In
  this case, we must return the WrapperJSON class. WrapperJSON does not add a
  .isa property, as this could muck up json properties of the object (e.g. a
  property that shouldnt really exist), so the class is a Wrapper class that can
  interact with any nominal object. CPRect, CPPoint and CPSize .isa properties
  will be added, as they wont affect the nature of these structs.
*/
function rb_find_class_for_obj(obj) {
  if (obj.hasOwnProperty('size') && obj.hasOwnProperty('origin')) {
    obj.isa = cr_cRect;
    return cr_cRect;
  }
  else if (obj.hasOwnProperty('width') && obj.hasOwnProperty('height')) {
    obj.isa = cr_cSize;
    return cr_cSize;
  }
  else if (obj.hasOwnProperty('x') && obj.hasOwnProperty('y')) {
    obj.isa = cr_cPoint;
    return cr_cPoint;
  }
  console.log(obj);
  throw "trying to find class for obj - must be JSON, so use JSONWrapper"
};
/* 
 * module.js
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

function rb_module_new() {
  return rb_define_module_id("");
};

function rb_define_module_id(id) {
  var m;
  m = rb_objj_alloc_class(id, rb_cObject, T_MODULE, rb_cModule);
  return m;
};

function rb_define_module(id) {
  var m;
  if (rb_const_defined(rb_cObject, id)) {
    m = rb_const_get(rb_cObject, id);
    // check tyoe
    return m;
  }
  m = rb_define_module_id(id);
  rb_const_set(rb_cObject, id, m);
  return m;
};

/**
  Objj wont natively support including modules, so instead, modules
  are added to class's meta classes in an array, so rb_funcall can
  check there if a method is not found otherwise. This is correct
  behaviour as methods defined in modules, then included, should 
  be checked after method defined on a class itself. Note, because
  we use this, objj_msgSend cannot be used: rb_funcall must be used
  instead.

  Also, these are stores on the klass in which the module was included.
  For that reason, the entire inheritance stack must be searched all the
  way back to CPObject (i.e. no more superclass.)

  This will only happen on module methods, not all the time, so there
  wont be that much performance impact.
*/
function rb_include_module(klass, module) {
  // make array if not already present
  if (!klass.rb_included_modules) klass.rb_included_modules = [];
  // might already be included
  if (klass.rb_included_modules.indexOf(module) != -1) return;
  // else, push it on
  klass.rb_included_modules.push(module);
};
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
  var k = "set" + id.charAt(0).toUpperCase() + id.substr(1) + ":";
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
  
  
  
  
  rb_mKernel = rb_define_module("Kernel");
  rb_include_module(rb_cObject, rb_mKernel);
  
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
};
/* 
 * objj_additions.js
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

/**
  Stuff in here are things that are generally useful, and could be implemented
  as part of vanilla objj.
*/ 

/**
  Types: useful for identifying types of objects: extends CLS, OBJ types.
*/
T_CLASS   = 0;
T_MODULE  = 1;
T_OBJECT  = 2;
T_ICLASS  = 3;
T_STRING  = 4;
T_ARRAY   = 5;
T_NUMBER  = 6;
T_PROC    = 7;
T_SYMBOL  = 8;
T_HASH    = 9;
T_BOOLEAN = 10;

//  type support
Number.prototype.objj_flags = T_NUMBER;
Array.prototype.objj_flags = T_ARRAY;
Boolean.prototype.objj_flags = T_BOOLEAN;
Function.prototype.objj_flags = T_PROC;

/**
  CLS_SINGLETON
  
  Identifiy objects as singletons (or more specifically, classes)
  
  This is also a "nicer" way for handling KVO replacing classes.. makes the idea
  more generic.
*/
CLS_SINGLETON = 0x16;

/**
  Duplicate class - for now a hack, need to actually do this.
*/
function objj_duplicateClass(klass, name) {
  var c = objj_allocateClassPair(klass, name);
  
  objj_registerClassPair(c);
  _class_initialize(c);
  return c;
};

/**
  Proc/Block/Func
*/
@implementation CPBlock : CPObject
{
  
}

@end

Function.prototype.isa = CPBlock;
/* 
 * proc.js
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

rb_cProc = nil;

function Init_Proc() {
  rb_cProc = objj_getClass("CPBlock");
};
/* 
 * slider.js
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

function cr_mappings_slider(self, sel, options) {
  var _$ = cappruby_block; cappruby_block = nil;
  var h = cr_mappings_collate_options('slider', options);

  var slider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake(100,200,84,24));

  if(_$) { // if block given
   cr_yield(_$, [slider]);
  }
  
  objj_msgSend(slider, "setMinValue:", rb_hash_delete(h, 'delete:', ID2SYM("min")));
  
  objj_msgSend(slider, "setMaxValue:", rb_hash_delete(h, 'delete:', ID2SYM("max")));
  
  objj_msgSend(slider, "setValue:", rb_hash_delete(h, 'delete:', ID2SYM("value")));

  // objj_msgSend(btn, "setTitle:", "My Button");

  return slider;
};

function Init_Mappings_Slider() {
  rb_define_method(rb_mKernel, "slider:", cr_mappings_slider, 1);
};
/* 
 * string.js
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

rb_cString = nil;
rb_cSymbol = nil;

// hash of symbol names to actual sym values. Like ruby, only one object per
// symbol is created. use ID2SYM to get instance, or make one.
rb_sym_stack = { };

function ID2SYM(id) {
  var s = rb_sym_stack[id];
  if (!s) {
    s = cr_send(rb_cSymbol, "alloc", [id], nil, 0);
    s.ptr = id;
    rb_sym_stack[id] = s;
  }
  return s;
};

function SYM2ID(sym) {
  return sym.ptr;
};

function rb_sym_to_s(sym, sel) {
  return sym.ptr;
};

function rb_sym_to_sym(sym, sel) {
  return sym;
};

function rb_sym_to_proc(sym, sel) {
  throw "sym#to_proc not uet implemented"
};

function rb_str_to_s(str, sel) {
  return new String(str);
};

function Init_String() {
  // string
  rb_cString = objj_getClass("CPString");
  // rb_include_module(rb_cString, rb_mComparable);
  
  rb_define_method(rb_cString, "to_s", rb_str_to_s, 0);
  
  // symbol
  rb_cSymbol = rb_define_class("Symbol", rb_cObject);
  
  // rb_define_method(rb_cSymbol, "==", rb_sym_equal, 1);
  // rb_define_method(rb_cSymbol, "inspect", rb_sym_inspect, 0);
  rb_define_method(rb_cSymbol, "to_s", rb_sym_to_s, 0);
  rb_define_method(rb_cSymbol, "id2name", rb_sym_to_s, 0);
  rb_define_method(rb_cSymbol, "intern", rb_sym_to_sym, 0);
  rb_define_method(rb_cSymbol, "to_sym", rb_sym_to_sym, 0);
  rb_define_method(rb_cSymbol, "to_proc", rb_sym_to_proc, 0);
  // rb_define_method(rb_cSymbol, "succ", rb_sym_succ, 0);
  // rb_define_method(rb_cSymbol, "next", rb_sym_succ, 0);
  // 
  // rb_define_method(rb_cSymbol, "<=>", rb_sym_cmp, 1);
  // rb_define_method(rb_cSymbol, "casecmp", rb_sym_casecmp, 1);
  // rb_define_method(rb_cSymbol, "=~", rb_sym_match, 1);
  // 
  // rb_define_method(rb_cSymbol, "[]", rb_sym_aref, -1);
  // rb_define_method(rb_cSymbol, "slice", rb_sym_aref, -1);
  // rb_define_method(rb_cSymbol, "length", rb_sym_length, 0);
  // rb_define_method(rb_cSymbol, "size", rb_sym_length, 0);
  // rb_define_method(rb_cSymbol, "empty?", rb_sym_empty, 0);
  // rb_define_method(rb_cSymbol, "match", rb_sym_match, 1);
  // 
  // rb_define_method(rb_cSymbol, "upcase", rb_sym_upcase, 0);
  // rb_define_method(rb_cSymbol, "downcase", rb_sym_downcase, 0);
  // rb_define_method(rb_cSymbol, "capitalize", rb_sym_capitalize, 0);
  // rb_define_method(rb_cSymbol, "swapcase", rb_sym_swapcase, 0);
  // 
  // rb_define_method(rb_cSymbol, "encoding", rb_sym_encoding, 0);
};
/* 
 * variable.js
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

function rb_ivar_set(obj, id, val) {
  return obj[id] = val;
};

function rb_ivar_get(obj, id) {
  return obj[id];
};

function rb_const_set(klass, id, val) {
  klass[id] = val;
};

function rb_const_defined(klass, id) {
  while (klass) {
    if (klass[id] !== undefined) return true;
    klass = klass.super_class;
  }
  // try window scope..
  if (window[id] !== undefined) return true;
  return false;
};

function rb_const_get(klass, id) {
  while (klass) {
    if (klass[id] !== undefined) return klass[id];
    klass = klass.super_class;
  }
  // try window scope..
  if (window[id] !== undefined) {
    // if we find it, pop it into the rb_cObject scope
    rb_const_set(rb_cObject, id, window[id]);
    return window[id];
  }
  throw "cannot find constant " + id;
};
/* 
 * vm.js
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

/**
  This isnt actually a vm. All the functions in here are what are called in the
  output in the compiled ruby. They are more efficient and handle the delecate
  nature of the ruby commands. They adjust the value of self etc to be the right
  object for the right context;
  
  Every method is prepended with cr_ - cappruby.
*/

/**
  Global block. Used for passing blocks around functions. We need this as we
  are not using a stack based runtime. :(
*/
cappruby_block = nil;

/**
  top self context in ruby. All files will be executed with this top self value
  as "self".
*/
cappruby_top_self = nil;

/**
  Initialize vm
*/
function Init_VM() {
  cappruby_top_self = class_createInstance(rb_cObject);
};

/**
  defineclass
  
  FIXME: this should really include arity as well.. number or array for complex
*/
cr_a = function cr_defineclass(base, super_class, name, body, flag) {
  var klass;
  switch (flag) {
    case 0:
      if (super_class == nil) super_class = CPObject;
      klass = rb_define_class(name, super_class);
      body(klass);
      break;
    default:
      throw "unknwon defineclass type"
  }
};

/**
  definemethod
*/
cr_b = function cr_definemethod(base, id, body, is_singleton) {
  // var m = new cappruby_method_t(id, body, []);
  // arity? hmm, maybe..
  if (is_singleton) {
    throw "cr_b: singleton method not uet implemented"
  }
  else {
    // arity?
    rb_define_method(base, id, body, -1);
    // base.method_list.push(m);
    // base.method_dtable[id] = m;
    // m.method_imp.displayName = base.name + "#" + id;
  }
};

/**
  send
  
  op_flag can be used to detect private calls etc
*/
cr_b = function cr_send(recv, id, argv, blockiseq, op_flag) {
  var imp, klass;
  
  // make sure we have a reciever and a class. JSON objects, Rects etc will not
  // have a ".isa" property. In which case, find one for it.
  if (recv === nil || recv === undefined) {
    klass = rb_cNilClass;
  }
  else if (!recv.isa) {
    klass = rb_find_class_for_obj(recv);
  }
  else {
    klass = recv.isa;
  }
  
  imp = rb_search_method(klass, id);
  // if we could not find it, try it with/without a colon on the end
  if (!imp) {
    if (id[id.length -1] == ":") {
      // already has a colon.. so remove it and try
    }
    else {
      // doesnt have a colon, so add one and try..
    }
  }
  
  if (!imp) {
    throw "method missing: " + id
  }
  
  // setup block - might be undefined, nil or null..
  if (blockiseq != nil) cappruby_block = blockiseq;
  
  // do actual send message
  switch (argv.length) {
    case 0: return imp(recv, id);
    case 1: return imp(recv, id, argv[0]);
    case 2: return imp(recv, id, argv[0], argv[1]);
    case 3: return imp(recv, id, argv[0], argv[1], argv[2]);
    case 4: return imp(recv, id, argv[0], argv[1], argv[2], argv[3]);
    case 5: return imp(recv, id, argv[0], argv[1], argv[2], argv[3], argv[4]);
    default: throw "currently too many args: " + argv.length + " for " + id
  }
};

/**
  getconstant
*/
cr_c = function cr_getconstant(base, id) {
  // if base is an object, then use its class (base.isa)
  if (base.isa.info & CLS_CLASS) base = base.isa;
  return rb_const_get(base, id);
};

/**
  functioncall
*/
cr_d = function cr_functioncall(id, argv) {
  throw "doing " + id
};

/**
  newhash
*/
cr_e = function cr_newhash() {
  return rb_hash_new.apply(rb_hash_new, arguments);
};

/**
  yield a block
  
  argv in array
  
  need to wrap in a try block. return/break etc from block/yield is different
  from a proc. if we are a proc, then we need to catch breaks/returns... this
  might/should be done in proc#call ?
*/
cr_y = function cr_yield(block, argv) {
  if (block == nil) throw "no block given..."
  return block.apply(block, argv);
};
/* 
 * window.js
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
 
/**
 window :title => "Adam", :frame => [100, 300] do |win|
   ...
 end

 Block is optional, and if given, the created window is passed. A set of 
 default options are used to "setup" the window in a default state.
*/
function cr_mappings_window(self, sel, options) {
  var _$ = cappruby_block; cappruby_block = nil;
  var h = cr_mappings_collate_options('window', options);

  var win = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(100,100,400,300), CPTitledWindowMask);

  objj_msgSend(win, "setTitle:", rb_hash_delete(h, 'delete:', ID2SYM("title")));

  if(_$) { // if block given
    cr_yield(_$, [win]);
  }

  objj_msgSend(win, "orderFront:", self);
  
  return win;
};

/**
  CPWindow#<<(subview)
  CPWindow#addSubview(subview)
  
  Add a subview to the windows' contentView.
*/
function cr_window_add_subview(win, sel, view) {
  var content_view = objj_msgSend(win, "contentView");
  objj_msgSend(content_view, "addSubview:", view);
  return view;
};

function Init_Mappings_Window() {
  rb_define_method(rb_mKernel, "window:", cr_mappings_window, 1);
  rb_define_method(CPWindow, "<<", cr_window_add_subview, 1);
  rb_define_method(CPWindow, "addSubview:", cr_window_add_subview, 1);
};
