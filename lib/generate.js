var FILE = require('file');
var OS = require('os');

// Generate a project, or update a project.

// Monkey patched objj file
var OBJJ_PATH = FILE.join(FILE.dirname(module.path), '..', 'build', 'Objective-J.js');

// CappRuby.js framework path - needed for on the fly parsing of ruby etc
var COMPILER_PATH = FILE.join(FILE.dirname(module.path), '..', 'build', 'CappRuby.js');

// CappRuby.j source file - CappRuby runtime needed for deployment as well as local apps
var RUNTIME_PATH = FILE.join(FILE.dirname(module.path), '..', 'build', 'CappRuby.j');

// generate a completely new project
exports.generate = function(project_name) {

  var project_path = FILE.join(FILE.cwd(), project_name);
  
  // first: mkdir
  if (!FILE.isDirectory(project_path))
     FILE.mkdir(project_path);

  // print("in generate for: " + project_path);
  FILE.glob(FILE.join(FILE.dirname(module.path), '..', 'gen/**/*')).forEach(function(file) {
    //print(file);

    var file_name = (new RegExp(RegExp.escape(FILE.join(FILE.dirname(module.path), '..', 'gen')) + '/(.*)')).exec(file)[1];
    var destination = FILE.join(project_path, file_name);
    //print(destination);

    FILE.copy(file, destination);
  });
  // frameworks etc..
  exports.update(project_path);
};

// updates the frameworks, as well as CappRuby runtime and compiler file.
exports.update = function(project_root) {
  // STEP 1: generate cappuccino frameworks
  var capp_pipe = OS.popen('capp gen ' + project_root + ' -f');
  if (capp_pipe.wait() !== 0) {
    throw new Error("capp gen error");
  }

  // STEP 2: copy our custom objective-j file (monkey patched for ruby loading)
  FILE.copy(OBJJ_PATH, FILE.join(project_root, 'Frameworks', 'Objective-J', 'Objective-J.js'));

  // STEP 3: copy our CappRuby.js client side compiler
  FILE.copy(COMPILER_PATH, FILE.join(project_root, 'Frameworks', 'CappRuby.js'));

  // STEP 4: copy our CappRuby.j runtime file
  FILE.copy(RUNTIME_PATH, FILE.join(project_root, 'CappRuby.j'));
};

