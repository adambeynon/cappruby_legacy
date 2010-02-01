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
