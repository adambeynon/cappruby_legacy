var CappRuby = require('./cappruby');

require('objective-j');

// There MUST be a better way to do this?!?!?!
objj_eval("@import <AppKit/AppKit.j>");
// because this doesnt work...
// objj_importFile('AppKit/AppKit.j', false);

require('../build/CappRuby');

CappRuby_main_repl_context = { adam: 10 };

global.quit = function() {
  OS.exit(0);
};

var repl = function() {
  var Readline = require('readline');
  while (true) {
    try {
      system.stdout.write('>> ').flush();
      var line = Readline.readline();
      var result = new CappRuby.Parser(line, { filename:'main', context:'main'}).parse();
      print('=> ' + objj_msgSend(eval(result), 'inspect'));
    }
    catch (e) {
      print(e);
    }
  }
};

repl();
