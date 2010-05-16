var CappRuby = require('./cappruby');
var FILE = require('file');
require('objective-j');

// There MUST be a better way to do this?!?!?!
objj_eval("@import <Foundation/Foundation.j>");
// because this doesnt work...
// objj_importFile('AppKit/AppKit.j', false);

require('../build/CappRuby');

CappRuby_main_repl_context = { adam: 10 };

/*
  Require statements are passed through here if they are received in main, aka
  while using REPL. For this reason, we manually search for paths etc.
*/
CappRuby_cwd_require = function(path) {
  print("requiring from cwd");
  require(FILE.join(FILE.cwd(), path));
};

var ARGS = system.args;

if (ARGS.length > 1) {
  if (FILE.exists(ARGS[1])) {
    var src = FILE.read(ARGS[1]);
    eval(new CappRuby.Parser(src, { filename:ARGS[1], context:'top'}).parse());
  } else {
    throw "cannot find file: " + ARGS[1]
  }
} else {
  var repl = function() {
    var Readline = require('readline');
    while (true) {
      try {
        system.stdout.write('>> ').flush();
        var line = Readline.readline();
        var result = new CappRuby.Parser(line, { filename:'main', context:'main'}).parse();
        print('=> ' + cappruby_msgSend(eval(result), 'inspect'));
      }
      catch (e) {
        print(e);
      }
    }
  };

  repl();
}
