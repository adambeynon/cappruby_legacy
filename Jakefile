var Jake = require('jake');
var File = require('file');
var CappRuby = require('./lib/cappruby');

Jake.task('test', function() {
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
