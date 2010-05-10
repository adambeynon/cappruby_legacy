cappruby_break = function(breakValue) {
  var err = new Error();
  err._keyword = 'break';
  err._arg = breakValue;
  err.toString = function() {
    return "break uncaught! (must be outside loop context)";
  };
  throw err;
};

cappruby_next = function() {
  var err = new Error();
  err._keyword = 'next';
  err.toString = function() {
    return "next uncaught! (must be ouside loop context)";
  };
  throw err;
}

cappruby_yield = function(block) {
  // console.log("yielding: " + Array.prototype.slice.call(arguments, 1).join(''));
  if (!block) throw "cappruby_yield: no block given"
  
  switch (arguments.length) {
    case 1: return block(null, null);
    case 2: return block(null, null, arguments[1]);
    case 3: return block(null, null, arguments[1], arguments[2]);
    case 4: return block(null, null, arguments[1], arguments[2], arguments[3]);
    case 5: return block(null, null, arguments[1], arguments[2], arguments[3], arguments[4]);
    default: throw "cappruby_yield: too many args: " + arguments.length
  }
};
