
var StringScanner = require('./string_scanner').StringScanner;

var EXPR_BEG    = 0,    EXPR_END    = 1,    EXPR_ENDARG = 2,    EXPR_ARG   = 3,
    EXPR_CMDARG = 4,    EXPR_MID    = 5,    EXPR_FNAME  = 6,    EXPR_DOT   = 7,
    EXPR_CLASS  = 8,    EXPR_VALUE  = 9;

/**
  Initializer. Basically takes the sting of code that we need to lex. Options
  will include filename etc that might be useful
*/
exports.Lexer = Lexer = function Lexer(string) {
  this._string = string;
  this._scanner = new StringScanner(string);
  this.lex_state = EXPR_BEG;
  this._tokens = [];
  return this;
};

/**
  Tokenize!
*/
Lexer.prototype.tokenize = function() {
  var token;
  this._string_parse_stack = [];
  while ((token = this.next_token()) && token[0] !== false) {
    this._tokens.push(token);
  }
  // print(this._tokens.join('\n'));
  return this._tokens;
};

Lexer.prototype.push_string_parse = function(o) {
  this._string_parse_stack.push(o);
};

Lexer.prototype.pop_string_parse = function() {
  this._string_parse_stack.pop();
};

Lexer.prototype.current_string_parse = function() {
  if (this._string_parse_stack.length == 0) return null;
  return this._string_parse_stack[this._string_parse_stack.length - 1];
};

Lexer.prototype.get_next_string_token = function() {
  var str_parse = this.current_string_parse(), scanner = this._scanner;
  // print("string end is " + str_parse.end);
  // see if we can read end of string/xstring/regexp markers
  if (scanner.scan( new RegExp('^\\' + str_parse.end))) {
    this.pop_string_parse();
    if (str_parse.beg == '"' || str_parse.beg == "'") {
      this.lex_state = EXPR_END;
      return ['STRING_END', scanner.matched()];
    }
    else if (str_parse.beg == '`') {
      // assume to be xstring
      this.lex_state = EXPR_END;
      return ['XSTRING_END', scanner.matched()];
    }
    else if (str_parse.beg == '/') {
      this.lex_state = EXPR_END;
      return ['REGEXP_END', scanner.matched()];
    }
    else if (str_parse.end == '}') {
      this.lex_state = EXPR_END;
      return ['STRING_END', scanner.matched()];
    }
    else {
      throw "unknown string ending"
    }
  }
  
  // not end of string, so we must be parsing contents
  var str_buffer = [];
  
  if (scanner.scan(/^#(\$|\@)/)) {
    return ['tSTRING_DVAR', scanner.matched()];
  }
  else if (scanner.scan(/^#\{/)) {
    // we are into ruby code, so stop parsing content (for the moment)
    str_parse.content = false;
    return ['STRING_DBEG', scanner.matched()];
  }
  // causes error, so we will just collect it later on with other text
  // else if (scanner.scan(/^#/)) {
  //   str_buffer.push('#');
  // }
  
  // content regexp (what is valid content for strings..)
  var reg_exp = (str_parse.beg == '`') ?
              // xstring: CAN include new lines
              new RegExp('[^\\' + str_parse.end + '\#\0]+|.') :
              // normal string: cannot include new lines
              new RegExp('[^\\' + '\\' + str_parse.end + '\#\0\\\n]+|.');
  
  scanner.scan(reg_exp);
  var temp_slash = scanner.matched();
  
  if (scanner.matched() === '\\') {
    // console.log("matched backs;ash!");
    if (scanner.scan(new RegExp('^' + str_parse.end))) {
      str_buffer.push(str_parse.end);
      // console.log("finsihed backslash append");
    }
    else {
      scanner.scan(reg_exp);
      str_buffer.push(temp_slash + scanner.matched());
    }
  }
  else {
    str_buffer.push(scanner.matched());
  }
  
  return ['STRING_CONTENT', str_buffer.join('')];
};

/**
  Return the next token. Result should be an array, first index is token type,
  second is lex value
*/
Lexer.prototype.next_token = function() {
  var string_scanner;
  if ((string_scanner=this.current_string_parse())&&string_scanner.content) {
    return this.get_next_string_token();
  }
  
  var scanner = this._scanner;
  var space_seen = false, c = '', cmd_start = false;
  
  while (true) {
    if (scanner.scan(/^(\ |\t|\r)/)) {
      space_seen = true;
      continue;
    }
    else if (scanner.scan(/^(\n|#)/)) {
      // console.log('found: ' + scanner.matched());
      c = scanner.matched();
      if (c == '#') {
        scanner.scan(/^(.*)/);
        // do not do mod comments yet!
        if (this.lex_state == EXPR_BEG) {
        // must make expr end to stop picking up any paranethesied call_Args
          this.lex_state = EXPR_END;
          return ['COMMENT', scanner.matched()];
        }
      }
      
      // \n and #\n both mean we read one line, so..
      // line_number++;
      
      // we can skip any more blank lines..(combine them into one..)
      scanner.scan(/^(\n+)/);
      // line_number += scanner.matched().length;
      if (this.lex_state == EXPR_BEG) {
        // return ['COMMENT', scanner.matched()];
        continue;
      }
      cmd_start = true;
      this.lex_state = EXPR_BEG;
      return ['\\n', '\\n'];
    }
    else if (scanner.scan(/^[+-]/)) {
      var result = scanner.matched() == '+' ? '+' : '-';
      var sign = (result == '+') ? 'UPLUS' : 'UMINUS';
      // method name
      if (this.lex_state == EXPR_FNAME || this.lex_state == EXPR_DOT) {
        this.lex_state = EXPR_ARG;
        if (scanner.scan(/^@/)) {
          return [sign, result + '@'];
        }
        else {
          return [sign, result];
        }
      }
      // += or -=
      if (scanner.scan(/^\=/)) {
        this.lex_state = EXPR_BEG;
        return ['OP_ASGN', result];
      }

      if (this.lex_state == EXPR_BEG || this.lex_state == EXPR_MID) {
        this.lex_state = EXPR_BEG;
        return [sign, result];
      }

      this.lex_state = EXPR_BEG;
      return [result, scanner.matched()];
    }
    
    
    
    else if (scanner.scan(/^\/\=/)) {
      return ['OP_ASGN', '/'];
    }
    else if (scanner.scan(/^\//)) {
      if (this.lex_state == EXPR_BEG || this.lex_state == EXPR_MID || this.lex_state == EXPR_CMDARG) {
        this.push_string_parse({ beg: '/', content: true, end:'/' });
        return ['tREGEXP_BEG', scanner.matched()];
      }
      this.lex_state = EXPR_BEG;
      return ['/', scanner.matched()];
    }
    else if (scanner.scan(/^\*\*\=/)) {
      this.lex_state = EXPR_BEG;
      return ['OP_ASGN', "**"];
    }
    else if (scanner.scan(/^\*\*/)) {
      return ['**', "**"];
    }
    else if (scanner.scan(/^\*\=/)) {
      this.lex_state = EXPR_BEG;
      return ['OP_ASGN', '*'];
    }
    else if (scanner.scan(/^\*/)) {
      var r;
      if (this.lex_state == EXPR_FNAME) {
        this.lex_state = EXPR_BEG;
        r = "*";
      }
      else if (this.lex_state == EXPR_BEG || this.lex_state == EXPR_MID) {
        r = 'tSTAR';
      }
      else {
        this.lex_state = 'EXPR_BEG';
        r = "*"
      }
      return [r, scanner.matched()];
    }
    else if (scanner.scan(/^\!\=\=/)) {
      this.lex_state = EXPR_BEG;
      return ['!==', scanner.matched()];
    }
    else if (scanner.scan(/^\!\=/)) {
      this.lex_state = EXPR_BEG;
      return ['!=', scanner.matched()];
    }
    else if (scanner.scan(/^\!\~/)) {
      this.lex_state = EXPR_BEG;
      return ["!~", '!~'];
    }
    else if (scanner.scan(/^\!/)) {
      this.lex_state = EXPR_BEG;
      return ['!', '!'];
    }
    
    
    
    else if (scanner.scan(/^\^/)) {
      if (scanner.scan(/^\=/)) {
        return ['OP_ASGN', '^'];
      }
      return ['^', scanner.matched()];
    }
    else if (scanner.scan(/^\~/)) {
      return ['~', scanner.matched()];
    }
    
    
    
    else if (scanner.scan(/^\<\=\>/)) {
      return ['<=>', scanner.matched()];
    }
    else if (scanner.scan(/^\<\=/)) {
      return ['<=', "<="];
    }
    else if (scanner.scan(/^\<\<\=/)) {
      this.lex_state = EXPR_BEG;
      return ['OP_ASGN', '<<'];
    }
    else if (scanner.scan(/^\<\</)) {
      return ['<<', "<<"];
    }
    else if (scanner.scan(/^\</)) {
      lex_state = EXPR_BEG;
      return ["<", "<"];
    }
    
    
    
    
    else if (scanner.scan(/^\&\&\=/)) {
      lex_state = EXPR_BEG;
      return ['OP_ASGN', "&&"];
    }
    else if (scanner.scan(/^\&\&/)) {
      this.lex_state = EXPR_BEG;
      return ['ANDOP', "&&"];
    }
    else if (scanner.scan(/^\&\=/)) {
      lex_state = EXPR_BEG;
      return ['OP_ASGN', '&'];
    }
    else if (scanner.scan(/^\&/)) {
      var r;
      if (space_seen && !scanner.check(/^\s/)) {
        if (this.lex_state == EXPR_CMDARG) r = 'AMPER';
        else r = "&";
      }
      else if (this.lex_state == EXPR_BEG || this.lex_state == EXPR_MID) {
        r = 'AMPER';
      }
      else {
        r = "&";
      }
      return [r, "&"];
    }
    
    
    
    
    // strings.. in order: double, single, xstring
    else if (scanner.scan(/^\"/)) {
      this.push_string_parse({ beg: '"', content: true, end:'"' });
      return ['STRING_BEGIN', scanner.matched()];
    }
    else if (scanner.scan(/^\'/)) {
      this.push_string_parse({ beg: "'", content: true, end:"'" });
      return ['STRING_BEGIN', scanner.matched()];
    }
    else if (scanner.scan(/^\`/)) {
      this.push_string_parse({ beg: "`", content: true, end:'`' });
      return ['XSTRING_BEGIN', scanner.matched()];
    }
    
    // numbers
    else if (scanner.check(/^[0-9]/)) {
      this.lex_state = EXPR_END;
      if (scanner.scan(/^[\d_]+\.[\d_]+\b/)) {
        return ['FLOAT', scanner.matched().replace(/_/g, '')];
      }
      else if (scanner.scan(/^[\d_]+\b/)) {
        return ['INTEGER', scanner.matched().replace(/_/g, '')];
      }
      else if (scanner.scan(/^0(x|X)(\d|[a-f]|[A-F])+/)) {
        return ['INTEGER', scanner.matched().replace(/_/g, '')];
      }
      else {
        // console.log('unexpected number type');
        return [false, false];
      }
    }
    
    
    else if (scanner.scan(/^\|\|\=/)) {
      this.lex_state = EXPR_BEG;
      return ['OP_ASGN', '||'];
    }
    else if (scanner.scan(/^\|\|/)) {
      this.lex_state = EXPR_BEG;
      return ['OROP', scanner.matched()];
    }
    else if (scanner.scan(/^\|\=/)) {
      lex_state = EXPR_BEG;
      return ['OP_ASGN', '|'];
    }
    else if (scanner.scan(/^\|/)) {
      lex_state = EXPR_BEG;
      return ["|", scanner.matched()];
    }
    else if (scanner.scan(/^\:\:/)) {
      if (this.lex_state == EXPR_BEG || this.lex_state == EXPR_MID || this.lex_state == EXPR_CLASS || this.lex_state == EXPR_FNAME) {
        this.lex_state = EXPR_BEG;
        return ['COLON3', scanner.matched()];
      }
      this.lex_state = EXPR_DOT;
      return ['COLON2', scanner.matched()];
    }
    else if (scanner.scan(/^\:/)) {
      if (this.lex_state == EXPR_END || this.lex_state == EXPR_ENDARG || scanner.check(/^\s/)) {
        if (!scanner.check(/^\w/)) {
          return [':', scanner.matched()];
        }
      }
      // console.log ("HERE " + lex_state);
      this.lex_state = EXPR_BEG;
      return ['SYMBOL_BEGIN', scanner.matched()];
    }
    
    else if (scanner.scan(/^\[/)) {
      var result = scanner.matched();
      
      if (this.lex_state == EXPR_FNAME || this.lex_sate === EXPR_DOT) {
        this.lex_state = EXPR_ARG;
        if (scanner.scan(/^\]\=/)) {
          return ['[]=', '[]='];
        }
        else if (scanner.scan(/^\]/)) {
          return ['[]', '[]'];
        }
        else {
          throw "unexpected '[' token"
        }
      }
      
      if (this.lex_state == EXPR_BEG || this.lex_state == EXPR_MID || space_seen) {
        return ['ARRAY_BEGIN', scanner.matched()];
      }
      this.lex_state = EXPR_BEG;
      return ['INDEX_BEGIN', scanner.matched()]
    }
    
    else if (scanner.scan(/^\{/)) {
      return ['{', scanner.matched()];
    }
    
    // ]
    else if (scanner.scan(/^\]/)) {
      this.lex_state = EXPR_END;
      return ['ARRAY_END', scanner.matched()];
    }      
    
    else if (scanner.scan(/^\;/)) {
      lex_state = EXPR_BEG;
      return [';', ';'];
    }
    // #
    else if (scanner.scan(/^\(/)) {
      var result = 'CALL_BEGIN';
      // if (this.lex_state == EXPR_FNAME) {
        // result = 'PAREN_BEGIN';
      // }
      if (this.lex_state == EXPR_BEG || this.lex_state == EXPR_MID) {
        result = 'PAREN_BEGIN';
      }
      else if (space_seen) {
        result = 'CALL_BEGIN';
      }
      this.lex_state = EXPR_BEG;
      return [result, scanner.matched()];
    }
    // )
    else if (scanner.scan(/^\)/)) {
      this.lex_state = EXPR_END;
      return ['CALL_END', scanner.matched()];
    }
    
    // }
    else if (scanner.scan(/^\}/)) {
      this.lex_state = EXPR_END;
      // throw 'got to end of string'
      if (this.current_string_parse()) {
        this.current_string_parse().content = true
      }
      // check if parsing string...
      return ['}', scanner.matched()];
    }
    
    // .
    else if (scanner.scan(/^\.\.\./)) {
      this.lex_state = EXPR_BEG;
      return ['...', scanner.matched()];
    }
    else if (scanner.scan(/^\.\./)) {
      this.lex_state = EXPR_BEG;
      return ['..', scanner.matched()];
    }
    else if (scanner.scan(/^\?/)) {
      this.lex_state = EXPR_END;
      // console.log("in nil? keyword");
      return ['?', scanner.matched()];
    }
  else if(scanner.scan(/^\.(defined|string|object|number|function|null)\?/)){
      this.lex_state = EXPR_END;
      return ['TYPE_Q', scanner.matched()];
    }
    else if (scanner.scan(/^\./)) {
      // should be EXPR_DOT in ALL cases?
      if (this.lex_state !== EXPR_FNAME) {
        this.lex_state = EXPR_DOT;
      }
      return ['.', scanner.matched()];
    }
    else if (scanner.scan(/^\%[wW]/)) {
      var word_start = scanner.scan(/^./);
      var word_end = this.wordListPairs[word_start];
      if (!word_end) throw "bad word list start:" + word_start
      this.push_string_parse({ beg: word_start, content: true, end:word_end});
      return ['tWORDS_BEG', scanner.matched()];
    }
    else if (scanner.scan(/^\%/)) {
      if (scanner.scan(/^\=/)) {
        this.lex_state = EXPR_BEG;
        return ['OP_ASGN', '%'];
      }
      else {
        return ['%', '%'];
      }
    }
    
    // ,
    else if (scanner.scan(/^\,/)) {
      this.lex_state = EXPR_BEG;
      return [',', scanner.matched()];
    }
    
    // Class variabled
    else if (scanner.scan(/^\@\@\w*/)) {
      lex_state = EXPR_END;
      return [tCVAR, scanner.matched()];
    }
    // Instance variables
    else if (scanner.scan(/^\@\w*/)) {
      this.lex_state = EXPR_END;
      // return ['IVAR', scanner.matched().substr(1)];
      return ['IVAR', scanner.matched()];
    }
    
    else if (scanner.scan(/^\=\>/)) {
      this.lex_state = EXPR_BEG;
      return ['ASSOC', scanner.matched()];
    }
    else if (scanner.scan(/^\=\=\=/)) {
      this.lex_state = EXPR_BEG;
      return ['===', scanner.matched()];
    }
    else if (scanner.scan(/^\=\=/)) {
      this.lex_state = EXPR_BEG;
      return ['==', scanner.matched()];
    }
    else if (scanner.scan(/^\=\~/)) {
      this.lex_state = EXPR_BEG;
      return ['=~', scanner.matched()];
    }
    else if (scanner.scan(/^\=/)) {
      this.lex_state = EXPR_BEG;
      return ['=', scanner.matched()];
    }
    
    else if(scanner.scan(/^\>\=/)) {
      return ['>=', '>='];
    }
    else if(scanner.scan(/^\>\>/)) {
      if (scanner.scan(/^\=/)) {
        return ['OP_ASGN', '>>'];
      }
      return ['>>', '>>'];
    }
    else if(scanner.scan(/^\>/)) {
      this.lex_state = EXPR_BEG;
      return ['>', '>'];
    }
        
    else if (scanner.scan(/^\w+[\?\!]?/)) {
      switch (scanner.matched()) {
        case 'def':
          this.lex_state = EXPR_FNAME;
          return ['DEF', scanner.matched()];
        case 'end':
          this.lex_state = EXPR_END;
          return ['END', scanner.matched()];
        case 'class':
          if (this.lex_state == EXPR_DOT || this.lex_state == EXPR_FNAME) {
            return ['IDENTIFIER', scanner.matched()];
          }
          this.lex_state = EXPR_CLASS;
          return ['CLASS', scanner.matched()];
        case 'interface':
          this.lex_state = EXPR_CLASS;
          return ['INTERFACE', scanner.matched()];
        case 'import':
          return ['IMPORT', scanner.matched()];
        case 'export':
          return ['EXPORT', scanner.matched()];
        case 'as':
          return ['AS', scanner.matched()];
        case 'from':
          return ['FROM', scanner.matched()];
        case 'using':
          return ['USING', scanner.matched()];
        case 'do':
          this.lex_state = EXPR_END;
          return ['DO', scanner.matched()];
        case 'in':
          return ['IN', scanner.matched()];
        case 'of':
          return ['OF', scanner.matched()];
        case 'for':
          if (this.lex_state == EXPR_BEG) {
            return ['FOR', scanner.matched()];
          }
          this.lex_state = EXPR_BEG;
          return ['FOR_MOD', scanner.matched()];
        case 'while':
          if (this.lex_state == EXPR_BEG) {
            return ['WHILE', scanner.matched()];
          }
          this.lex_state = EXPR_BEG;
          return ['WHILE_MOD', scanner.matched()];
        case 'until':
          if (this.lex_state == EXPR_BEG) {
            return ['UNTIL', scanner.matched()];
          }
          this.lex_state = EXPR_BEG;
          return ['UNTIL_MOD', scanner.matched()];
        case 'if':
          if (this.lex_state == EXPR_BEG) {
            return ['IF', scanner.matched()];
          }
          this.lex_state = EXPR_BEG;
          return ['IF_MOD', scanner.matched()];
        case 'then':
          return ['THEN', scanner.matched()];
        case 'elsif':
          return ['ELSIF', scanner.matched()];
        case 'else':
          this.lex_state = EXPR_BEG;
          return ['ELSE', scanner.matched()];
        case 'and':
          return ['AND', scanner.matched()];
        case 'typeof':
          return ['kTYPEOF', scanner.matched()];
        case 'or':
          this.lex_state = EXPR_BEG;
          return ['OR', scanner.matched()];
        case 'not':
          return ['NOT', scanner.matched()];
        case 'begin':
          return ['BEGIN', scanner.matched()];
        case 'rescue':
          if (this.lex_state == EXPR_BEG) {
            this.lex_state = EXPR_MID;
            return ['RESCUE', scanner.matched()];
          }
          this.lex_state = EXPR_BEG;
          return ['RESCUE_MOD', scanner.matched()];
        case 'finally':
          return ['kFINALLY', scanner.matched()];
        case 'throw':
          return ['kTHROW', scanner.matched()];
        case 'break':
          this.lex_state = EXPR_MID;
          return ['BREAK', scanner.matched()];
        case 'unless':
          if (this.lex_state == EXPR_BEG) {
            return ['UNLESS', scanner.matched()];
          }
          this.lex_state = EXPR_BEG;
          return ['UNLESS_MOD', scanner.matched()];
        case 'this':
          if (this.lex_state != EXPR_FNAME) {
            this.lex_state = EXPR_END;
          }
          return ['THIS', scanner.matched()];
        case 'self':
          if (this.lex_state != EXPR_FNAME) {
            this.lex_state = EXPR_END;
          }
          return ['SELF', scanner.matched()];
        case 'super':
          this.lex_state = EXPR_ARG;
          return ['kSUPER', scanner.matched()];
        case 'true':
          this.lex_state = EXPR_END;
          return ['TRUE', scanner.matched()];
        case 'false':
          this.lex_state = EXPR_END;
          return ['FALSE', scanner.matched()];
        case 'nil':
          this.lex_state = EXPR_END;
          return ['NIL', scanner.matched()];
        case 'undefined':
          this.lex_state = EXPR_END;
          return ['UNDEFINED', scanner.matched()];
        case 'return':
          this.lex_state = EXPR_MID;
          return ['kRETURN', scanner.matched()];
        case 'case':
          this.lex_state = EXPR_BEG;
          return ['CASE', scanner.matched()];
        case 'when':
          this.lex_state = EXPR_BEG;
          return ['WHEN', scanner.matched()];
        case '__FILE__':
          this.lex_state = EXPR_END;
          return ['k__FILE__', scanner.matched()];
        case 'yield':
          this.lex_state = EXPR_ARG;
          return ['YIELD', scanner.matched()];
        case 'function':
          this.lex_state = EXPR_END;
          return ['FUNCTION', scanner.matched()];
        /**
          Objective J support keywords
        */
        case 'implementation':
          this.lex_state = EXPR_BEG;
          return ['IMPLEMENTATION', scanner.matched()];
      }

      var matched = scanner.matched();

      if (scanner.peek(2) != '::' && scanner.scan(/^\:/)) {
        return ['LABEL', matched + scanner.matched()];
      }
      
      
      if (this.lex_state == EXPR_FNAME) {
        if (scanner.scan(/^=/)) {
          // if we get a =, switch firstName= to setFirstName
          this.lex_state = EXPR_END;
          var setterName ='set' + matched[0].toUpperCase() + matched.substr(1, matched.length);
          return ['IDENTIFIER', setterName];
        }
        else if (scanner.scan(/^[?!]/)) {
          this.lex_state = EXPR_END;
          return ['IDENTIFIER', matched + scanner.matched()];
        }
                
        this.lex_state = EXPR_END;
        return ['IDENTIFIER', matched];
      }
      
      // console.log('current state: ' + lex_state);
      
      if ([EXPR_BEG, EXPR_DOT, EXPR_MID, EXPR_ARG, EXPR_CMDARG].indexOf(this.lex_state) !== -1) {
        this.lex_state = EXPR_CMDARG;
      }
      else {
        this.lex_state = EXPR_END;
      }
          
      return [matched.match(/^[A-Z]/) ? 'CONSTANT' : 'IDENTIFIER', matched];
    }

    else {
      // false, false === end of stream
      return [false, false];      
    }
  }
  
};
