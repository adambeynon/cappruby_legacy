var Jake = require('jake');
var File = require('file');
var CappRuby = require('./lib/cappruby');
// 
// Jake.task('test', ['self_contained'], function() {
//   var dir = File.absolute('test/rb');
//   var out = File.absolute('test/js');
//   File.list(dir).forEach(function(file) {
//      print('doing ' + file);
//      var outputFile = File.join(out, File.basename(file, '.rb')) + '.js';
//      var src = File.read(File.absolute('test/rb/' + file));
//      var str = new CappRuby.Parser(src, 'aFile.rb').parse();
//      File.write(outputFile, str);
//   });
// });
// 
// // Rebuild CappRuby.framework in ./build
// // This framework can be used then in any cappuccino application
// Jake.task('framework', function() {
//   
// });
// 
// // Rebuild CappRuby.j in ./build
// // Smaller, singular file that can just be added to any application. It is self
// // contained and includes the whole runtime needed for cappruby applications in
// // cappuccino.
// Jake.task('self_contained', function() {
//   var out = File.absolute('build/CappRuby.j');
//   var str = "";
//   // javascript 'cappruby' sources
//   var inputs = ['module', 'control', 'boot', 'vm'];
//   inputs.forEach(function(file) {
//     str += File.read(File.absolute('framework/runtime/' + file + '.js'));
//   });
//   // core library sources
//   File.list(File.absolute('framework/core')).forEach(function(file) {
//     if (File.extension(file) !== '.rb') return;
//     print("doing: " + file);
//     var src = File.read(File.absolute('framework/core/' + file));
//     str += "\n//" +  file + "\n";
//     str += new CappRuby.Parser(src, file).parse();
//   });
//   // Capp extensions
//   // File.list(File.absolute('framework/cappruby')).forEach(function(file) {
//   //    if (File.extension(file) !== '.rb') return;
//   //    print ("doing " + file);
//   //    var src = File.read(File.absolute('framework/cappruby/' + file));
//   //    str += "\n//" +  file + "\n";
//   //    str += new CappRuby.Parser(src, file).parse();
//   //  });
//   File.write(out, str);
// });
// 
// Jake.task('spec', function() {
//   // var CappSpec = require('cappspec');
//   CappSpec.Runner.run();
//   // var list = new Jake.FileList('lib/**/*.js');
//   // list.forEach(function(item) {
//   //   print(item);
//   // });
// });
// 
// // Compile all ruby found in ./src to javascript to be placed in ./lib
// Jake.task('src', function() {
//   
// });


// rebuild both cappruby.j and cappruby_dev.j ready for the browser
Jake.task('browser', ['cappruby', 'cappruby_dev'], function() {

});

// rebuild cappruby (core libraries and runtime) ready for browser deployment
Jake.task('cappruby', function() {
  var out = File.absolute('tmp/cappruby.j')
      str = "",
      core = ['kernel', 'module', 'array', 'basic_object', 'boolean', 'class', 'error', 'hash', 'match_data', 'nil_class', 'number', 'proc', 'regexp', 'string', 'symbol', 'time', 'top_self'];
  
  ['module', 'control', 'boot', 'vm'].forEach(function(file) {
    str += File.read(File.absolute('framework/runtime/' + file + '.js'));
  });
  
  core.forEach(function(core_lib) {
    print("doing: " + core_lib);
    str + "\n//" + core_lib + "\n";
    str += CappRuby.parse(File.read(File.absolute('framework/core/' + core_lib + '.rb')), core_lib) + ";\n";
  });
  
  File.write(out, str);
});

// rebuild cappruby_dev (parser/compiler etc) ready for browser deployment
Jake.task('cappruby_dev', function() {
  var out  = File.absolute('tmp/cappruby_dev.js')
      str  = "",
      pre  = "var CappRuby = {};\n(function(global, exports) {\n",
      post = "\n})(window, CappRuby);\n";
  
  str += File.read(File.absolute('lib/objj.js'));
  
  str += pre;
  
  ['ruby_parser', 'generator', 'lexer', 'optimizer', 'parser', 'string_scanner', 'cappruby'].forEach(function(file) {
    str += File.read(File.absolute('lib/' + file + '.js'));
  });
  
  str += post;
  
  File.write(out, str);
});

// rebuild parser
Jake.task('parser', function() {
  require('jison');
  var parser = require('./lib/grammar').Parser;
  var gen = parser.generate();
  File.write('lib/ruby_parser.js', gen);
});
