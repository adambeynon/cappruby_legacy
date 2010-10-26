var CappRuby;

function CappRubyLoader() {
  
  function makeNarwhalFactory (content, path) {
    // print("making narwhal factory");
    var str = CappRuby.parse(content);
    print("parsed just fine.");
    print(str);
    return eval("(function(require,exports,module,system,print){function objj_executeFile(path) {return require(path);};" + str + ";})");
  };
  
  var loader = {};
  var factories = {};
  
  loader.reload = function(topId, path) {
    if (typeof CappRuby === 'undefined') CappRuby = require('../cappruby');
    factories[topId] = makeNarwhalFactory(system.fs.read(path), path);
  };
  
  loader.load = function(topId, path) {
    if (!factories.hasOwnProperty(topId)) {
      loader.reload(topId, path);
    }
    return factories[topId];
  };
  
  return loader;
};

require.loader.loaders.unshift(['.rb', CappRubyLoader()]);
