var CappRuby = require('./cappruby');
var File = require('file');

// Load objj and require foundation
function load_objj_runtime() {
  CappRuby.require_cappruby();
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
        var result = CappRuby.parse(line);
        // print(result);
        print('=> ' + rb_call(eval(result), 'inspect'));
      }
      catch (e) {
        print(e);
      }
    }
  };

  repl();
}
