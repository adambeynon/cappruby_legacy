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
