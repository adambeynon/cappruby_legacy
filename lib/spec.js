var CappRuby = require('./cappruby');
var FILE     = require('file');
require('objective-j');

// There MUST be a better way to do this?!?!?!
objj_eval("@import <Foundation/Foundation.j>");
// because this doesnt work...
// objj_importFile('AppKit/AppKit.j', false);

require('../build/CappRuby');
print("requiring matchers");
require('./cappruby/spec/matchers');
// require 'spec/expectations'
require('./cappruby/spec/example');
// require 'spec/runner'
print("requiring dsl");
require('./cappruby/spec/dsl');

// Run
// print("looking for files");
FILE.glob('./spec/**/*.rb').forEach(function(spec) {
  // print("load spec: " + FILE.absolute(spec));
  require(FILE.absolute(spec));
});
 