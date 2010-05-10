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

