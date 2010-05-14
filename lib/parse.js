// 
//  parse.js
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-14.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 

if (typeof require !== "undefined") {
  var CappRuby = require('./cappruby');
  var cappruby_parser = require(require('file').absolute('lib/cappruby_parser.js'));
  var Lexer = require('./lexer').Lexer;
  var Generate = require('./generate').Generate;
  require('./nodes');
}
else {
  // var exports = Opal;
  cappruby_parser = {
    parser: cappruby_parser
  };
  var StringScanner = exports.StringScanner;
  var Generate = exports.Generate;
}

exports.Parser = function Parser(str, options) {
  this._options = options || {};
  var lexer = new Lexer(str);
  this._tokens = lexer.tokenize();
  this._position = 0;
  // options = options || {};
  cappruby_parser.parser.lexer = this;
  return this;
};



exports.Parser.prototype = {
  setInput: function() {
    
  },
  
  wordListPairs: {
    '{': '}',
    '[': ']',
    '(': ')'
  },
  
  lex: function() {
    if (this._done) return "";
    var token = this._tokens[this._position++];
    if (!token || token[0] === false) {
      this._done = true;
      return "EOF";
    }
    // print("yytext is " + token[1] + " for " + token[0]);
    this.yytext = token[1];
    return token[0];

  },
  
  /**
    Lexer function
  */
  upcomingInput: function() {
    return this.scanner.peek(10);
  },
  
  /**
    Lexer functions
  */
  showPosition: function() {
    return this.line_number;
  },
  
  /**
    Parse the string given on initialzation and return a string representation
    of the compiled ruby.
  */
  parse: function() {
    // throw "down to here"
    cappruby_parser.parser.parse(this.str);
    var res = cappruby_parser.parser.__result || cappruby_parser.__result;
    var str = res.generate(this._options);
    console.log("result is:");
    console.log(str);
    return str;
  }
};
