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

function cr_str_titleize(str, sel) {
  var parts = str.split("_");
  for (var i = 0; i < parts.length; i++) {
    parts[i] = parts[i].charAt(0).toUpperCase() + parts[i].substr(1);
  }
  return parts.join(" ");
};

function rb_str_intern(str, sel) {
  return ID2SYM(str);
};

function rb_str_plus(str, sel, other) {
  return str + other;
};

function Init_String() {
  // string
  rb_cString = objj_getClass("CPString");
  // rb_include_module(rb_cString, rb_mComparable);
  
  rb_define_method(rb_cString, "to_s", rb_str_to_s, 0);
  
  rb_define_method(rb_cString, "titleize", cr_str_titleize, 0);
  
  rb_define_method(rb_cString, "+", rb_str_plus, 1);
  
  rb_define_method(rb_cString, "intern", rb_str_intern, 0);
  rb_define_method(rb_cString, "to_sym", rb_str_intern, 0);
  
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
