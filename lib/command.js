var CappRuby = require('./cappruby');

require('objective-j');

// There MUST be a better way to do this?!?!?!
objj_eval("@import <AppKit/AppKit.j>");
// objj_importFile('AppKit/AppKit.j', false);

require('../build/CappRuby');

global.quit = function() {
  OS.exit(0);
};

var repl = function() {
  var Readline = require('readline');
  while (true) {
    try {
      system.stdout.write('cappruby> ').flush();
      var line = Readline.readline();
      var result = new CappRuby.Parser(line, { filename:'main', context:'main'}).parse();
      print(eval(result));
    }
    catch (e) {
      print(e);
    }
  }
};

repl();
