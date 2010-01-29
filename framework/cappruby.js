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
  Global block. Used for passing blocks around functions. We need this as we
  are not using a stack based runtime. :(
*/
cappruby_global_block = nil;

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
  console.log("jere");
};

/**
  Loaded from the application as "compiled ruby code"
  
  - file is the filepath of the "ruby file" : used for require()
  - content is the compiled ruby, as javascript. It is enclosed in a function()
    so to run it (on require), simply execute the content e.g. c();
*/
function cappruby_file(file, content) {
  cappruby_file_hash[file] = content;
};

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
  call all cappruby inits
*/
function cappruby_init() {
  Init_Object();
  Init_VM();
};

/**
  To start every funcall, set global cappruby_block var to a block, if we get
  sent one. Every ruby based function will then get that as a local var, set it
  and then set the global var to nil. each method will then have nil for the
  block, or an actual block it can use. This stops other methods carrying on the
  block and treating it as their own. Also, makes objj calls into functions not
  break our block system. If no global block, then it wont be set. Also, we 
  should only do this process when rb_funcalling to a function that is a ruby
  based. To achieve this we can set a flag on a function (named to avoid objj)
  local names to identify it as a cappruby function. If we try this process with
  a objj method, then it wont clear the global block, so it could be incorrecly
  sent onto a method which shouldnt take it.
  
  this is only done for block. We still use objj_msgSend, just with blocks we
  add a small layer for "compatibility".
*/
function rb_funcall_block(block, recv, id) {
  var method = recv.isa.method_dtable[id];
  // fixme
  if (!method) throw "cappruby: cannot find method " + id
  
  if (method.capprubymethod) {
    cappruby_global_block = block;
    return objj_msgSend.apply(recv, Array.prototype.slice.call(arguments, 1));
  }
};
