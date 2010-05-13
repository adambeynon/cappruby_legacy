var Jake = require('jake');
var File = require('file');
var CappRuby = require('./lib/cappruby');

Jake.task('test', ['self_contained'], function() {
  var dir = File.absolute('test/rb');
  var out = File.absolute('test/js');
  File.list(dir).forEach(function(file) {
     print('doing ' + file);
     var outputFile = File.join(out, File.basename(file, '.rb')) + '.js';
     var src = File.read(File.absolute('test/rb/' + file));
     var str = new CappRuby.Parser(src, 'aFile.rb').parse();
     File.write(outputFile, str);
  });
});

// Rebuild CappRuby.framework in ./build
// This framework can be used then in any cappuccino application
Jake.task('framework', function() {
  
});

// Rebuild CappRuby.j in ./build
// Smaller, singular file that can just be added to any application. It is self
// contained and includes the whole runtime needed for cappruby applications in
// cappuccino.
Jake.task('self_contained', function() {
  var out = File.absolute('build/CappRuby.j');
  var str = "";
  // javascript 'cappruby' sources
  var inputs = ['module', 'control', 'boot', 'vm'];
  inputs.forEach(function(file) {
    str += File.read(File.absolute('framework/runtime/' + file + '.js'));
  });
  // core library sources
  File.list(File.absolute('framework/core')).forEach(function(file) {
    if (File.extension(file) !== '.rb') return;
    print("doing: " + file);
    var src = File.read(File.absolute('framework/core/' + file));
    str += "\n//" +  file + "\n";
    str += new CappRuby.Parser(src, file).parse();
  });
  // Capp extensions
  File.list(File.absolute('framework/cappruby')).forEach(function(file) {
    if (File.extension(file) !== '.rb') return;
    print ("doing " + file);
    var src = File.read(File.absolute('framework/cappruby/' + file));
    str += "\n//" +  file + "\n";
    str += new CappRuby.Parser(src, file).parse();
  });
  File.write(out, str);
});
