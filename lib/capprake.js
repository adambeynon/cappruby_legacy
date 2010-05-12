var JAKE    = require("jake");
var SYSTEM  = require("system");
var FILE    = require("file");

// run rake
exports.run = function() {
  if (FILE.exists('Rakefile')) {
    

    // JAKE.application().run({ args : SYSTEM.args });
  }
  else {
    throw "Cannot find Rakefile in " + FILE.cwd()
  }
};
