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
cappruby_block = nil;

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
  call all cappruby inits
*/
function cappruby_init() {
  Init_Object();
  Init_Array();
  Init_String();
  Init_Proc();
  Init_VM();
};
