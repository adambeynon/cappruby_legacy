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

function rb_ary_inspect(ary, sel) {
  return objj_msgSend(ary, 'description');
};

function rb_ary_to_a(ary, sel) {
  return ary;
};

function rb_ary_push(ary, sel, val) {
  ary.push(val);
  return val;
};

function rb_ary_each(ary, sel) {
  var _$ = cappruby_block; cappruby_block = nil;
  if (!_$) throw "no block passed to ary#each. need to return enumerator"

  for (var i = 0; i < ary.length; i++) {
    cr_yield(_$, [ary[i]]);
  }
  return ary;
};

function rb_ary_equal(ary, sel, other) {
  return objj_msgSend(ary, 'isEqual:', other);
};

function rb_ary_aref(ary, sel, idx) {
  // FIXME: should take multiple params
  return ary[idx];
};

function rb_ary_aset(ary, sel, idx, val) {
  // FIXME: should take multiple params
  return ary[idx] = val;
};

function rb_ary_includes(ary, sel, obj) {
  return ary.indexOf(obj) !== -1;
};

function rb_ary_first(ary, sel) {
  if (arguments.length === 2) {
    if (ary.length === 0) return nil;
    return ary[0];
  }
  else {
    var count = arguments[2];
    return ary.slice(0, count);
  }
};

function rb_ary_last(ary, sel) {
  if (arguments.length === 2) {
    if (ary.length === 0) return nil;
    return ary[ary.length - 1];
  }
  else {
    var count = arguments[2];
    return ary.slice(count -1, count);
  }
};

function Init_Array() {
  rb_cArray = objj_getClass("CPArray");
  rb_const_set(rb_cObject, "Array", rb_cArray);
  // rb_include_module(rb_cArray, rb_mEnumerable);
  
  // rb_define_singleton_method(rb_cArray, "[]", rb_ary_s_create, -1);
  // rb_define_singleton_method(rb_cArray, "try_convert", rb_ary_s_create, 1);
  
  // rb_define_method(rb_cArray, "initialize", rb_ary_initialize, -1);
  // rb_define_method(rb_cArray, "initialize_copy", rb_ary_replace, 1);

  rb_define_method(rb_cArray, "to_s", rb_ary_inspect, 0);
  rb_define_method(rb_cArray, "inspect", rb_ary_inspect, 0);
  rb_define_method(rb_cArray, "to_a", rb_ary_to_a, 0);
  rb_define_method(rb_cArray, "to_ary", rb_ary_to_a, 0);
  // rb_define_method(rb_cArray, "frozen?",  rb_ary_frozen_p, 0);

  rb_define_method(rb_cArray, "==", rb_ary_equal, 1);
  rb_define_method(rb_cArray, "eql?", rb_ary_equal, 1);
  // rb_define_method(rb_cArray, "hash", rb_ary_hash, 0);

  rb_define_method(rb_cArray, "[]", rb_ary_aref, -1);
  rb_define_method(rb_cArray, "[]=", rb_ary_aset, -1);
  // rb_define_method(rb_cArray, "at", rb_ary_at, 1);
  // rb_define_method(rb_cArray, "fetch", rb_ary_fetch, -1);
  rb_define_method(rb_cArray, "first", rb_ary_first, -1);
  rb_define_method(rb_cArray, "last", rb_ary_last, -1);
  // rb_define_method(rb_cArray, "concat", rb_ary_concat, 1);
  rb_define_method(rb_cArray, "<<", rb_ary_push, 1);
  // rb_define_method(rb_cArray, "push", rb_ary_push_m, -1);
  // rb_define_method(rb_cArray, "pop", rb_ary_pop_m, -1);
  // rb_define_method(rb_cArray, "shift", rb_ary_shift_m, -1);
  // rb_define_method(rb_cArray, "unshift", rb_ary_unshift_m, -1);
  // rb_define_method(rb_cArray, "insert", rb_ary_insert, -1);
  rb_define_method(rb_cArray, "each", rb_ary_each, 0);
  // rb_define_method(rb_cArray, "each_index", rb_ary_each_index, 0);
  // rb_define_method(rb_cArray, "reverse_each", rb_ary_reverse_each, 0);
  // rb_define_method(rb_cArray, "length", rb_ary_length, 0);
  // rb_define_alias(rb_cArray,  "size", "length");
  // rb_define_method(rb_cArray, "empty?", rb_ary_empty_p, 0);
  // rb_define_method(rb_cArray, "find_index", rb_ary_index, -1);
  // rb_define_method(rb_cArray, "index", rb_ary_index, -1);
  // rb_define_method(rb_cArray, "rindex", rb_ary_rindex, -1);
  // rb_define_method(rb_cArray, "join", rb_ary_join_m, -1);
  // rb_define_method(rb_cArray, "reverse", rb_ary_reverse_m, 0);
  // rb_define_method(rb_cArray, "reverse!", rb_ary_reverse_bang, 0);
  // rb_define_method(rb_cArray, "sort", rb_ary_sort, 0);
  // rb_define_method(rb_cArray, "sort!", rb_ary_sort_bang, 0);
  // rb_define_method(rb_cArray, "collect", rb_ary_collect, 0);
  // rb_define_method(rb_cArray, "collect!", rb_ary_collect_bang, 0);
  // rb_define_method(rb_cArray, "map", rb_ary_collect, 0);
  // rb_define_method(rb_cArray, "map!", rb_ary_collect_bang, 0);
  // rb_define_method(rb_cArray, "select", rb_ary_select, 0);
  // rb_define_method(rb_cArray, "values_at", rb_ary_values_at, -1);
  // rb_define_method(rb_cArray, "delete", rb_ary_delete, 1);
  // rb_define_method(rb_cArray, "delete_at", rb_ary_delete_at_m, 1);
  // rb_define_method(rb_cArray, "delete_if", rb_ary_delete_if, 0);
  // rb_define_method(rb_cArray, "reject", rb_ary_reject, 0);
  // rb_define_method(rb_cArray, "reject!", rb_ary_reject_bang, 0);
  // rb_define_method(rb_cArray, "zip", rb_ary_zip, -1);
  // rb_define_method(rb_cArray, "transpose", rb_ary_transpose, 0);
  // rb_define_method(rb_cArray, "replace", rb_ary_replace, 1);
  // rb_define_method(rb_cArray, "clear", rb_ary_clear, 0);
  // rb_define_method(rb_cArray, "fill", rb_ary_fill, -1);
  rb_define_method(rb_cArray, "include?", rb_ary_includes, 1);
  // rb_define_method(rb_cArray, "<=>", rb_ary_cmp, 1);

  // rb_define_method(rb_cArray, "slice", rb_ary_aref, -1);
  // rb_define_method(rb_cArray, "slice!", rb_ary_slice_bang, -1);

  // rb_define_method(rb_cArray, "assoc", rb_ary_assoc, 1);
  // rb_define_method(rb_cArray, "rassoc", rb_ary_rassoc, 1);

  // rb_define_method(rb_cArray, "+", rb_ary_plus, 1);
  // rb_define_method(rb_cArray, "*", rb_ary_times, 1);

  // rb_define_method(rb_cArray, "-", rb_ary_diff, 1);
  // rb_define_method(rb_cArray, "&", rb_ary_and, 1);
  // rb_define_method(rb_cArray, "|", rb_ary_or, 1);

  // rb_define_method(rb_cArray, "uniq", rb_ary_uniq, 0);
  // rb_define_method(rb_cArray, "uniq!", rb_ary_uniq_bang, 0);
  // rb_define_method(rb_cArray, "compact", rb_ary_compact, 0);
  // rb_define_method(rb_cArray, "compact!", rb_ary_compact_bang, 0);
  // rb_define_method(rb_cArray, "flatten", rb_ary_flatten, -1);
  // rb_define_method(rb_cArray, "flatten!", rb_ary_flatten_bang, -1);
  // rb_define_method(rb_cArray, "count", rb_ary_count, -1);
  // rb_define_method(rb_cArray, "shuffle!", rb_ary_shuffle_bang, 0);
  // rb_define_method(rb_cArray, "shuffle", rb_ary_shuffle, 0);
  // rb_define_method(rb_cArray, "sample", rb_ary_sample, -1);
  // rb_define_method(rb_cArray, "cycle", rb_ary_cycle, -1);
  // rb_define_method(rb_cArray, "permutation", rb_ary_permutation, -1);
  // rb_define_method(rb_cArray, "combination", rb_ary_combination, 1);
  // rb_define_method(rb_cArray, "product", rb_ary_product, -1);

  // rb_define_method(rb_cArray, "take", rb_ary_take, 1);
  // rb_define_method(rb_cArray, "take_while", rb_ary_take_while, 0);
  // rb_define_method(rb_cArray, "drop", rb_ary_drop, 1);
  // rb_define_method(rb_cArray, "drop_while", rb_ary_drop_while, 0);
};
