/* 
 * parse.js
 * opal
 * 
 * Created by Adam Beynon.
 * Copyright 2010 Adam Beynon.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

if (typeof require !== "undefined") {
  var CappRuby = require('./cappruby');
  var cappruby_parser = require(require('file').absolute('lib/cappruby_parser.js'));
  var Lexer = require('./lexer').Lexer;
  var Generate = require('./generate').Generate;
  require('./nodes');
}
else {
  var exports = Opal;
  opal_parser = {
    parser: opal_parser
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
    print("yytext is " + token[1] + " for " + token[0]);
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
    return res.generate(this._options);
  }
};
