if (typeof require !== 'undefined') {
  var Parser    = require('./parser').Parser,
      Generator = require('./generator').Generator;
      var File = require('file');
      var CappRuby = require('./cappruby');
} else {
  var Parser = exports.Parser;
  var Generator = exports.Generator;
 }

exports.parse = function(source, url) {
  var nodes = Parser.parse(source);
  var g = new Generator(nodes, {});
  var res = g.generate_top_context();
  return res;
};


exports.parse_objj = function(source, url) {
  var nodes = Parser.parse(source);
  var g = new Generator(nodes, {});
  var res = g.generate_objj_context();
  return res;
};

exports.require_cappruby = function() {
  require('objective-j');
  
  // There MUST be a better way to do this?!?!?!
  objj_eval("@import <Foundation/Foundation.j>");
  objj_eval("@import <AppKit/AppKit.j>");
  
  // because this doesnt work...
  // objj_importFile('AppKit/AppKit.j', false);

  var str = "",
      core = ['kernel', 'module', 'array', 'basic_object', 'boolean', 'class', 'error', 'hash', 'match_data', 'nil_class', 'number', 'proc', 'regexp', 'string', 'symbol', 'time', 'top_self'];
  
  ['module', 'control', 'boot', 'vm'].forEach(function(file) {
    str += File.read(File.absolute('framework/runtime/' + file + '.js'));
  });
  
  core.forEach(function(core_lib) {
    print("doing: " + core_lib);
    str + "\n//" + core_lib + "\n";
    str += CappRuby.parse(File.read(File.absolute('framework/core/' + core_lib + '.rb')), core_lib) + ";\n";
  });
  
  // Capp extensions
  File.list(File.absolute('framework/cappruby')).forEach(function(file) {
     if (File.extension(file) !== '.rb') return;
     print ("doing " + file);
     var src = File.read(File.absolute('framework/cappruby/' + file));
     str += "\n//" +  file + "\n";
     str += CappRuby.parse(src, file) + ";\n";
   });
   
   eval(str);
};
