if (typeof require !== 'undefined') {
  var Parser    = require('./parser').Parser,
      Generator = require('./generator').Generator;
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
