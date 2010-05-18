// 
//  module.js
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-09.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 

// create an anonymous module
cappruby_module_new = function() {
  return cappruby_defiine_module_id("");
};

cappruby_define_module_id = function(id) {
  return objj_alloc_class(id, CPObject, 1, cappruby_cModule);
};

function cappruby_define_module_under(outer, id) {
  var m;
  if (cappruby_const_defined(outer, id)) {
    m = cappruby_const_get(outer, id);
    // check tyoe
    return m;
  }
  m = cappruby_define_module_id(id);
  cappruby_const_set(outer, id, m);
  m.cappruby_parent = outer;
  return m;
};