var CappRuby = require('./cappruby');
var FILE     = require('file');
require('objective-j');

// There MUST be a better way to do this?!?!?!
objj_eval("@import <Foundation/Foundation.j>");
// because this doesnt work...
// objj_importFile('AppKit/AppKit.j', false);

CappRuby.require_cappruby();
print("requiring matchers");
require('./cappruby/spec/matchers');
require('./cappruby/spec/expectations');
require('./cappruby/spec/example');
require('./cappruby/spec/runner');
// print("requiring dsl");
require('./cappruby/spec/dsl');

// Run
print("looking for files");
print(FILE.absolute('./framework/spec'));
FILE.glob('./framework/spec/**/*.rb').forEach(function(spec) {
  print("load spec: " + FILE.absolute(spec));
  require(FILE.absolute(spec));
});

require('./cappruby/spec/spec.rb');