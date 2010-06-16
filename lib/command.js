var CappRuby = require('./cappruby');
var FILE = require('file');

// Load objj and require foundation
function load_objj_runtime() {
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
};

var ARGS = system.args;

if (ARGS.length > 1) {
  var Generate = require('./generate');
  if (ARGS[1] === "gen") {
    if (ARGS.length == 2) {
      print("gen: need to supply project name");
    } else {
      print("need to generate a cappruby project");
      Generate.generate(ARGS[2]);
    }
  } else if (ARGS[1] === "update") {
    print("need to update cappruby files");
  } else if (FILE.exists(ARGS[1])) {
    load_objj_runtime();
    var src = FILE.read(ARGS[1]);
    eval(new CappRuby.Parser(src, { filename:ARGS[1], context:'top'}).parse());
  } else {
    throw "cannot find file: " + ARGS[1]
  }
} else {
  load_objj_runtime();
  // No args, so just load an interactive CappRuby REPL session
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
