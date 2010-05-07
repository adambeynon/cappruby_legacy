var CappRuby = require('./cappruby');

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
