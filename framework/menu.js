/* 
 * menu.js
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

function cr_mappings_menu(self, sel) {
  var _$ = cappruby_block; cappruby_block = nil;
  var menu = objj_msgSend(objj_msgSend(CPMenu, 'alloc'), 'initWithTitle:', '');
  
  if (_$) cr_yield(_$, [menu]);
  
  return menu;
};

function cr_menu_submenu(menu, sel, sym, options) {
  var _$ = cappruby_block; cappruby_block = nil;
  var item = objj_msgSend(menu, 'addItemWithTitle:action:keyEquivalent:', cr_str_titleize(sym.ptr), nil, "");
  var submenu = objj_msgSend(objj_msgSend(CPMenu, 'alloc'), 'initWithTitle:', '');
  if (_$) cr_yield(_$, [submenu]);
  objj_msgSend(menu, 'setSubmenu:forItem:', submenu, item);
  return submenu;
};

function cr_menu_item(menu, sel, sym, options) {
  if (!options) options = rb_hash_new();
  var keyequiv = rb_hash_delete(options, 'delete:', ID2SYM('key'));
  var action = rb_hash_delete(options, 'delete:', ID2SYM('action'));
  if (!action) action = sym;
  var action = "on_" + action.ptr;
  var item = objj_msgSend(menu, 'addItemWithTitle:action:keyEquivalent:', cr_str_titleize(sym.ptr), action, keyequiv);
  objj_msgSend(menu, 'addItem:', item);
  return item;
};

function cr_menu_separator(menu, sel) {
  objj_msgSend(menu, 'addItem:', objj_msgSend(CPMenuItem, 'separatorItem'));
  return menu;
};

function Init_Mappings_Menu() {
  rb_define_method(rb_mKernel, "menu", cr_mappings_menu, 0);
  
  rb_define_method(CPMenu, 'submenu:', cr_menu_submenu, 1);
  rb_define_method(CPMenu, 'item', cr_menu_item, 1);
  rb_define_method(CPMenu, 'separator', cr_menu_separator, 0);
};
