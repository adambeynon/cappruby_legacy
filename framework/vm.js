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

cappruby_trial = function(self) {
  cr_a(nil, nil, "AppController", function(self) { return nil; }, 0);
};

/**
  This isnt actually a vm. All the functions in here are what are called in the
  output in the compiled ruby. They are more efficient and handle the delecate
  nature of the ruby commands. They adjust the value of self etc to be the right
  object for the right context;
  
  Every method is prepended with cr_ - cappruby.
*/

/**
  top self context in ruby. All files will be executed with this top self value
  as "self".
*/
cappruby_top_self = nil;

/**
  defineclass
*/
function cr_a(base, super_class, name, body, flag) {
  switch (flag) {
    case 0:
      if (super_class == nil) super_class = CPObject;
      rb_define_class(name, super_class); 
      break;
    default:
      throw "unknwon defineclass type"
  }
};