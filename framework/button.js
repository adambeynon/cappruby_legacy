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
  
  
  
  
  
  var size_to_fit = dictionary_containsKey(h, ID2SYM('origin'));
  var frame = cr_mappings_do_control_sizing(self, options);
  
  var btn = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", frame);
  
  if(_$) { // if block given
   cr_yield(_$, [btn]);
  }
  
  objj_msgSend(btn, "setTitle:", "My Button");
  
  if (size_to_fit) objj_msgSend(btn, 'sizeToFit');
  
  return btn;
};

/**
  CPButton#on_action(&block)
  
  When the action event of the button fires, run the block.
  
  This method makes a fake target for the button, and adds a single method, to
  act as the action, which essentially calls the proc. The proc will have access
  to the scope in which it was defined.
*/
function cr_mappings_on_action(btn, sel) {
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

/**
  cr_mappings_do_map
  
  Make a mapping from name, to the class.
  This will call initWithOptions:(options) on the given class. The method will 
  be added to the Kernel module.
*/
function cr_mappings_do_map(name, klass, default_options) {
  var f = function(cls, sel, options) {
    var _$ = cappruby_block; cappruby_block = nil;
    var h = cr_mappings_collate_options(name, options);

    var obj = objj_msgSend(klass, "alloc");
    objj_msgSend(obj, "initWithOptions:", h);

    if (_$) cr_yield(_$, [obj]);
    return obj;
  };
  
  rb_define_method(rb_mKernel, name, f, 1);
  cr_mappings_defaults_store[name] = default_options;
};

function Init_Mappings_Button() {
  
  cr_mappings_do_map("button:", CPButton, rb_hash_new(
    ID2SYM('frame'), [100, 100, 80, 24],
    ID2SYM('title'), "Button"
  ));
  
  rb_define_method(CPButton, "on_action", cr_mappings_on_action, 0);
  
  
};
