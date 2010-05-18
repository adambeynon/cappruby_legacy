// 
//  cappruby.js
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-14.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 

if (typeof require !== 'undefined') {
  // commonJS
  exports.Parser = require('./parse').Parser;
  // load all our commonJS specific libraries
  // print("looking");
  // require('file').glob('framework/commonjs/*.rb').forEach(function(rb) {
    // require(require('file').absolute(rb));
  // });
} else {
  // browser
  var exports = this.CappRuby = {};
}

exports.compile = function(str, options) {
  
};
