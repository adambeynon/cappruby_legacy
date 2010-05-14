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
} else {
  // browser
  var exports = this.CappRuby = {};
}

exports.compile = function(str, options) {
  
};
