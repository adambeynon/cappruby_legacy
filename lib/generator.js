
var BaseIseq = function() {
  this.initialize();
  return this;
};

BaseIseq.prototype = {
  initialize: function() {
    this.code = "";
    // all our temps go into locals as well....
    this.locals = [];
    this.args = [];
    
    this.norm_args = [];
    this.opt_args = [];
    this.opt_args_stmt = [];
    this.rest_args = null;
    this.block_arg = '__block__';
    // tmp stuff
    this.temp_current = 'a';
    this.temp_queue = [];
    
    this.ensure_ivars = [];
  },
  
  SELF: 'self',
  NIL: 'nil',
  
  push_code: function(code) {
    this.code = code;
  },
  
  join: function() {
    var res = [];
    res.push('function(__f) {\n');
    res.push('var self = rb_top_self;\n');
    
    // inner code
    this.join_variables(res);
    this.join_inner(res);
    // end inner code
    
    res.push('}');
    return res.join('');
  },
  
  join_variables: function(res) {

    for (var i = 0; i < this.ensure_ivars.length; i++) {
      res.push('if (' + this.SELF + '.' + this.ensure_ivars[i] + ' === undefined) ' + this.SELF + '.' + this.ensure_ivars[i] + ' = ' + this.NIL + ';\n');
    }
    if (this.locals.length > 0) {
      res.push('var ');
      res.push(this.locals.join(', '));
      res.push(';\n');
    }
  },
  
  join_inner: function(res) {
    res.push(this.code);
  },
  
  // ensures an ivar is not null or undefined at top of current iseq
  ensure_ivar: function(name) {
    if (this.ensure_ivars.indexOf(name) == -1)
      this.ensure_ivars.push(name);
  },
  
  // write: function(str) {
    // this.code.push(str);
  // },
  
  temp_local: function() {
    if (this.temp_queue.length) {
      return this.temp_queue.pop();
    }
    var name = '__' + this.temp_current;
    this.locals.push(name);
    this.temp_current = String.fromCharCode(this.temp_current.charCodeAt(0) + 1);
    return name;
  },
  
  queue_temp: function(temp) {
    this.temp_queue.push(temp);
  },
  
  lookup_local: function(str) {
    if (this.locals.indexOf(str) !== -1) {
      return str;
    }
    else if (this.args.indexOf(str) !== -1) {
      return str;
    }
    else if (this.parent_iseq instanceof DefIseq) {
      return this.parent_iseq.lookup_local(str);
    }
    return null;
  },
  
  def_should_handle_return: function() {
    var parent = this;
    while (parent) {
      if (parent instanceof DefIseq) {
        parent._should_handle_return = true;
        return;
      }
      parent = parent.parent_iseq;
    }
  },
  
  push_local: function(str) {
    this.locals.push(str);
    return str;
  }
};

var TempIseq = (function() {
  var ctor = function() {};
  ctor.prototype = BaseIseq.prototype;
  var result = function() { this.initialize(); return this; };
  result.prototype = new ctor();
  return result;
})();

TempIseq.prototype.join = function() {
  return this.code.join("");
};

var DefIseq = (function() {
  var ctor = function() {};
  ctor.prototype = BaseIseq.prototype;
  var result = function() { this.initialize(); return this; };
  result.prototype = new ctor();
  return result;
})();

DefIseq.prototype.uses_block = function() {
  this._uses_block = true;
};

DefIseq.prototype.push_arg = function(name) {
  this.args.push(name);
  this.norm_args.push(name);
  return name;
};

DefIseq.prototype.push_rest_arg = function(name) {
  this.args.push(name);
  this.rest_args = name;
  return name;
};

DefIseq.prototype.push_opt_arg = function(name, stmt) {
  this.args.push(name);
  this.opt_args.push(name);
  this.opt_args_stmt.push(stmt);
  return name;
};

DefIseq.prototype.push_block_arg = function(name) {
  this.args.push(name);
  this.block_arg = name;
  return name;
};

DefIseq.prototype.join = function() {
  var res = [];
  res.push('function(');
  this.method_args(res);
  this.join_variables(res);
  this.method_fixing(res);
  this.join_inner(res);
  res.push('}');
  return res.join('');
};

DefIseq.prototype.join_inner = function(res) {
  var try_catch = this._should_handle_return;
  if (try_catch) {
    res.push('try {');
  }
  res.push(this.code);
  
  if (try_catch) {
    res.push('} catch(__err__) {');
    // return
    if (this._should_handle_return) {
      res.push('if (__err__.__keyword__ == "return") {');
      res.push('return __err__.__value__;');
      res.push('}');
    }
    // last case, rethrow..
    res.push("throw __err__;");
    res.push('}');
  }
};

DefIseq.prototype.method_args = function(res) {
  var norm = this.norm_args.length,
      opt  = this.opt_args.length,
      rest = this.rest_args;
  
  // always need a block arg
  // res.push(this.block_arg);
  
  // always self and selector
  res.push('self, _cmd');
  
  // norm
  for (var i = 0; i < norm; i++) {
    res.push(', ');
    res.push(this.norm_args[i]);
  }
  // opt
  for (var i = 0; i < opt; i++) {
    res.push(', ');
    res.push(this.opt_args[i]);
  }
  // rest
  if (rest) {
    res.push(', ');
    res.push(rest);
  }
  // end args
  res.push(') {\n');
};

DefIseq.prototype.method_fixing = function(res) {
  var norm = this.norm_args.length,
      opt  = this.opt_args.length,
      rest = this.rest_args;
  
  // handle opt args
  for (var i = 0; i < opt; i++) {
    res.push('if (' + this.opt_args[i] + ' === undefined) ' + this.opt_args[i] + ' = ' + this.opt_args_stmt[i] + ';\n');
    // res.push(this.opt_args[i]);
  }
  // handle rest args
  if (rest) {
    var rest_offset = norm + opt + 2; // should take into account opt.. we add two to skip self and _cmd
    res.push(rest + ' = Array.prototype.slice.call(arguments, ' + rest_offset + ');\n');
  }
  
  // potentially handle yield
  if (this._uses_block) {
    res.push("var " + this.block_arg + " = (rb_block !== nil && rb_block_id == _cmd) ? rb_block : rb_no_block;\n");
    // make sure we reset block
    res.push("rb_block = rb_block_id = nil;\n");
  }
};

var BlockIseq = (function() {
  var ctor = function() {};
  ctor.prototype = DefIseq.prototype;
  var result = function() { this.initialize(); return this; };
  result.prototype = new ctor();
  return result;
})();

var ClassIseq = (function() {
  var ctor = function() {};
  ctor.prototype = BaseIseq.prototype;
  var result = function() { this.initialize(); return this; };
  result.prototype = new ctor();
  return result;
})();

ClassIseq.prototype.join = function() {
  var res = [];
  res.push('function(self) {\n');
  this.join_inner(res);
  res.push('}');
  return res.join('');
};

var RubyGenerator = function(tree) {
  this._tree = tree;
};

RubyGenerator.prototype = {
  
  SELF: 'self',
  
  NIL: 'nil',
  
  push_iseq: function(klass) {
    var cur = this.iseq_current;
    var iseq = new klass();
    iseq.parent_iseq = cur;
    this.iseq_stack.push(iseq);
    this.iseq_current = iseq;
    return iseq;
  },
  
  pop_iseq: function() {
    var iseq = this.iseq_current;
    this.iseq_stack.pop();
    this.iseq_current = this.iseq_stack[this.iseq_stack.length - 1];
    // console.log(iseq);
    return iseq.join();
  },
  
  generate_objj_context: function() {
    this.clear();
    return this.generate_objj(this._tree);
  },
  
  generate_top_context: function() {
    this.clear();
    return this.generate_top(this._tree);
  },
  
  clear: function() {
    this.iseq_current = null;
    this.iseq_stack = [];
    this._dependencies = [];
  },
  
  generate_top: function(stmt) {
    this.push_iseq(BaseIseq);
    this.iseq_current.push_code('return ' + this.generate_compstmt(stmt[1]) + ';');
    var top_iseq = this.current_iseq;
    var code = '(' + this.pop_iseq() + ')()';
    return code;
  },
  
  generate_objj: function(stmt) {
    this.push_iseq(BaseIseq);
    this.iseq_current.push_code(this.generate_compstmt(stmt[1]));
    var top_iseq = this.current_iseq;
    var code = '(' + this.pop_iseq() + ')()';
    console.log(code);
    console.log("dependencies:");
    console.log(this._dependencies);
    var dependencies = [];
    for (var i = 0; i < this._dependencies.length; i++) {
      var d = this._dependencies[i];
      dependencies.push(new ObjectiveJ.FileDependency(new CFURL(d), d.charAt(0) == '.'));
    }
    return new ObjectiveJ.Executable(code, dependencies, "some_file.rb");
  },
  
  generate: function(stmt) {
    var name = stmt[0];
    if (this['generate_' + name]) 
      return this['generate_' + name](stmt);
    
    console.log(this);
    console.log("unknown stmt type: " + stmt);
    throw "unknown stmt type: " + stmt;
  },
  
  generate_bodystmt: function(stmt) {
    var s = stmt[1][1];
    
    if (s.length == 1 && s[0][0] == 'xstring') {
      return this.generate(s[0]);
    }
    // if (s.length == 1)
      // print(s[0]);
    
    return 'return ' + this.generate_compstmt(stmt[1][1]) + ';';
  },
  
  generate_compstmt: function(stmt) {
    var s, res = [];
    // no length stmts
    if (stmt.length == 0) {
      return '(' + this.NIL + ')';
    }
    
    for (var i = 0; i < stmt.length; i++) {
      res.push(this.generate(stmt[i]));
    }
    return '(' + res.join(', ') + ')';
  },
  
  // ['method_call', callable, args, block]
  generate_method_call: function(stmt) {
    stmt[1][3] = stmt[2];
    stmt[1][4] = stmt[3];
    return this.generate(stmt[1]);
  },
  
  generate_constant_call: function(stmt) {
    var res = ['cappruby_function("' + stmt[2] + '"'];
    var arg, args = stmt[3][0];
    // norm args
    if (args && args.length > 0) {
      for (var i = 0; i < args.length; i++) {
        res.push(', ' + this.generate(args[i]));
        // arg = args[i];
        // this.write(', ');
        // this.generate(arg, {});
      }
    }
    // hash/assocs arg
    args = stmt[3][2];
    if (args) {
      res.push(', opalhash(');
      for (var i = 0; i < args.length; i++) {
        if (i > 0) res.push(', ');
        res.push(this.generate(args[i][0]) + ', ' + this.generate(args[i][1]));
      }
      res.push(')');
    }
    
    res.push(')');
    
    return res.join('');
  },
  
  generate_objj_call: function(stmt) {
    var sel = stmt[2] + ':';
    var parts = stmt[3][2];
    for (var i = 0; i < stmt[3][2].length; i++) {
      sel += stmt[3][2][0][0][1] + ':';
    }
    
     var res = [];
      res.push('rb_call(');
      if (stmt[1])
        res.push(this.generate(stmt[1]));
      else
        res.push(this.SELF);
      // method
      res.push(', "' + sel + '"');

      var arg, args = stmt[3][0];
      // norm args
      if (args && args.length > 0) {
        for (var i = 0; i < args.length; i++) {
          res.push(', ' + this.generate(args[i]));
          // arg = args[i];
          // this.write(', ');
          // this.generate(arg, {});
        }
      }
      // hash/assocs arg
      args = stmt[3][2];
        for (var i = 0; i < args.length; i++) {
          res.push(', ');
          // console.log(args[i][1]);
          res.push(this.generate(args[i][1]));
        }

      res.push(')');

      return res.join('');
  },
  
  // ['call', recv, meth, args, block]
  // args: [norm, opt, rest, block]
  generate_call: function(stmt) {
    // check for constant stylr calls: CGMakeSize()
    if (/^[A-Z]/.exec(stmt[2]) && !stmt[1]) {
      return this.generate_constant_call(stmt);
      // throw "constant call: " + stmt[2];
    }
    // console.log(stmt[3][2]);
    // check for objj style call
    if (stmt[3][2] && stmt[3][2][0] && stmt[3][2][0][0][0] == 'label') {
      // console.log("doing objj call");
      return this.generate_objj_call(stmt);
      // throw "objj call!!! " + stmt[2];
    }
    
    var sel = stmt[2];
    
    if ((stmt[3][0] && stmt[3][0].length) || (stmt[3][1] && stmt[3][1].length)) {
      sel += ':';
    }
    
    var res = [];
    
    // block:
    if (stmt[4]) {
      res.push('rb_block_call(');
      res.push('(function(__proc__, __self__) {\n');
      res.push('__proc__.__self__ = __self__;');
      res.push('return __proc__;\n');
      res.push('})(');
      res.push(this.generate_block(stmt[4]));
      res.push(', ' + this.SELF + ')');
      res.push(', ');
    }
    // amper block (to_proc) .. a.b(&block)
    else if(stmt[3][3]) {
      // throw "block arg!" + stmt[3][3];
      res.push('rb_block_call(');
      res.push('rb_call(');
      res.push(this.generate(stmt[3][3]));
      res.push(', "to_proc")');
      res.push(', ');
    }
    else {
      res.push('rb_call(');
    }
    
    if (stmt[1])
      res.push(this.generate(stmt[1]));
    else
      res.push(this.SELF);
    // method
    res.push(', "' + sel + '"');
    
    var arg, args = stmt[3][0];
    // norm args
    if (args && args.length > 0) {
      for (var i = 0; i < args.length; i++) {
        res.push(', ' + this.generate(args[i]));
        // arg = args[i];
        // this.write(', ');
        // this.generate(arg, {});
      }
    }
    // hash/assocs arg
    args = stmt[3][2];
    if (args) {
      res.push(', opalhash(');
      for (var i = 0; i < args.length; i++) {
        if (i > 0) res.push(', ');
        res.push(this.generate(args[i][0]) + ', ' + this.generate(args[i][1]));
      }
      res.push(')');
    }
    
    res.push(')');
    
    return res.join('');
  },
  
  generate_block: function(stmt, o) {
    this.push_iseq(BlockIseq);
    
    if (stmt[0] && stmt[0][0]) {
      var args = stmt[0][0];
      
      for (var i = 0; i < args[0].length; i++) {
        this.iseq_current.push_arg(args[0][i]);
      }
    }
    // var args = stmt[3];
    
    // var stmts = stmt[1];
    // for (var i = 0; i < stmt[3][0].length; i++) {
      // this.iseq_current.push_arg(stmt[3][0][i]);
    // }
    
    this.iseq_current.push_code('return ' + this.generate_compstmt(stmt[1][1]) + ';');
    // this.write(this.generate_compstmt(stmt[1][1], ';'));
    
    var result = this.pop_iseq();
    
    // this.write(result);
    return result;
  },
  
  // ['method_call', callable, args, block]
  generate_method_call: function(stmt, o) {
    stmt[1][3] = stmt[2];
    stmt[1][4] = stmt[3];
    // console.log(stmt[2]);
    return this.generate(stmt[1], o);
  },
  
  // ['brace_cell', method_call, braceblock]
  generate_brace_call: function(stmt) {
    stmt[1][3] = stmt[2];
    return this.generate(stmt[1]);
  },
  
  generate_string: function(stmt, o) {
    var res = [];
    
    if (stmt[1].length == 0) {
      return '""';
    }
    else if (stmt[1].length == 1) {
      if (stmt[1][0][0] == 'string_content') {
        res.push('"' + stmt[1][0][1] + '"');
      }
      else if (stmt[1][0][0] == 'string_dbegin') {
        res.push("rb_call(");
        res.push(this.generate(stmt[1][0][1][1][0]));
        res.push(", 'to_s'");
        
      }
      else {
        res.push(this.SELF + '.i$' + stmt[1][0][1] + '.$to_s()');
      }
    }
    else {
      res.push('(');
      var part;
      for (var i = 0; i < stmt[1].length; i++) {
        if (i > 0) res.push(' + ');
        part = stmt[1][i];
        if (part[0] == 'string_content') {
          res.push('"' + part[1] + '"');
        }
        else if (part[0] == 'string_dbegin') {
          res.push("rb_call(");
          res.push(this.generate(part[1][1][0]));
          res.push(',"to_s")');
        }
        else {
          res.push(this.SELF + '.i$' + part[1] + '.$to_s()');
        }
      }
      res.push(')');
    }
    
    return res.join("");
  },
  
  generate_self: function(stmt) {
    return this.SELF;
  },
  
  generate_numeric: function(stmt) {
    return stmt[1];
  },
  
  generate_class: function(stmt) {
    // cappruby_defineclass = function(base, super_class, name, body, flag)
    var res = [];
    
    this.push_iseq(ClassIseq);
    
    this.iseq_current.push_code(this.generate_bodystmt(stmt[3]));
    
    var result = this.pop_iseq();
    // if path is ::CONST then we use opal.top_self as base
    res.push('cappruby_defineclass' + '(' + this.SELF + ', ');
    
    // superclass
    if (stmt[2]) {
      res.push(this.generate(stmt[2]));
    }
    else {
      res.push(this.NIL);
    }
    res.push(', "' + stmt[1][1] + '", ' + result + ', 0)');
    
    return res.join("");
  },
  
  generate_class_shift: function(stmt) {
    var res = [];

    this.push_iseq(ClassIseq);

    this.iseq_current.push_code(this.generate_bodystmt(stmt[2]));

    var result = this.pop_iseq();
    // if path is ::CONST then we use opal.top_self as base
    res.push('cappruby_defineclass' + '(' + this.SELF + ', ');

    // superclass
      res.push(this.NIL);
    res.push(', "' + stmt[1][1] + '", ' + result + ', 1)');

    return res.join("");
  },
  
  generate_module: function(stmt) {
    var res = [];
    
    this.push_iseq(ClassIseq);
    
    this.iseq_current.push_code(this.generate_bodystmt(stmt[2]));
    
    var result = this.pop_iseq();
    // if path is ::CONST then we use opal.top_self as base
    res.push('cappruby_defineclass' + '(' + this.SELF + ', ');
    
    // superclass
      res.push(this.NIL);
    res.push(', "' + stmt[1][1] + '", ' + result + ', 2)');
    
    return res.join("");
  },
  
  // ['begin', bodystatements]
  generate_begin: function(stmt) {
    var res = [];
    var local;
    res.push('(function(){');
    res.push('try{');
    res.push('return ' + this.generate_compstmt(stmt[1][1][1]) + ';');
    res.push('}catch(__err__){');
    for (var i = 0; i < stmt[1][2].length; i++) {
      var rescue = stmt[1][2][i];
      res.push('if (__err__){');
      // console.log(rescue);
      // if we have a var, then assign error to it:
      if (rescue[2]) {
        if (!(local = this.iseq_current.lookup_local(rescue[2]))) {
          local = this.iseq_current.push_local(rescue[2]);
        }
        res.push(local + ' = __err__;');
      }
      res.push('return ' + this.generate_compstmt(rescue[3][1]) + ';');
      res.push('}');
    }
    // console.log(stmt[1][2]);
    // res.push(this.generate(stmt[1][2]));
    // console.log(re)
    res.push('}');
    console.log(stmt);
    res.push('})()')
    return res.join('');
  },
  
  generate_objj_def: function(stmt) {
    var res = [];
    var is_singleton = stmt[1];
    
    this.push_iseq(DefIseq);
    
    this.iseq_current.push_code(this.generate_bodystmt(stmt[4]));
    
    var m_id = stmt[2] + ':';
    // objj parts name
    // console.log(stmt[3]);
    for (var i = 0; i < stmt[3][2].length; i++) {
      m_id += stmt[3][2][i][0] + ':';
    }
    
    // args
    // for (var i = 0; i < stmt[3][0].length; i++) {
      // this.iseq_current.push_arg(stmt[3][0][i]);
    // }
    this.iseq_current.push_arg(stmt[3][1][0]);
    for (var i = 0; i < stmt[3][2].length; i++) {
      this.iseq_current.push_arg(stmt[3][2][i][1]);
    }
    
    var result = this.pop_iseq();
    
    
    
    if (is_singleton) {
      // need to fix:
      res.push('cappruby_define_singleton_method(' + this.generate(stmt[1]));
    }
    else {
      res.push('rb_def_method(' + this.SELF);
    }
    // arity as 0 - it isnt, but saves us complicating rb_def_method.. our
    // selector is right as it is.
    res.push(', "' + m_id + '", ' + result + ', ' + 0 + ')');
    
    return res.join('');
  },
  
  // normal ruby style methods never add a colon to the selector, this is done
  // by our runtime (in vm.js). objj style label methods are treated differently
  generate_def: function(stmt) {
    // detect objj
    if (stmt[3][0] == 'objj') {
      // throw "objj method: " + stmt;
      return this.generate_objj_def(stmt);
    }
    var res = [];
    var is_singleton = stmt[1];
    
    this.push_iseq(DefIseq);
    
    var args = stmt[3];
        
    // norm arg
    for (var i = 0; i < stmt[3][0].length; i++) {
      this.iseq_current.push_arg(stmt[3][0][i]);
    }
    
    // opt arg
    for (var i = 0; i < stmt[3][1].length; i++) {
      // console.log(stmt[3][1][i]);
      var gen_opt_iseq = this.generate(stmt[3][1][i][1]);
      this.iseq_current.push_opt_arg(stmt[3][1][i][0], gen_opt_iseq);
    }
    
    // rest arg
    if (stmt[3][2]) {
      this.iseq_current.push_rest_arg(stmt[3][2]);
    }
    
    var arity = stmt[3][0].length;
    
    if (stmt[3][2]) arity = arity - 1;
    
    // block arg
    if (stmt[3][3]) {
      // console.log("Block arf: " + stmt[3][3]);
      this.iseq_current.push_block_arg(stmt[3][3]);
      this.iseq_current.uses_block();
    }
    
    // if we are an "initialize" method, then we must automatically return self
    // to avoid differences between objj and ruby methods
    if (stmt[2] === 'initialize') {
      stmt[4][1][1].push(['self', 'self']);
      stmt[2] = 'init';
    }
    this.iseq_current.push_code(this.generate_bodystmt(stmt[4]));
    
    var result = this.pop_iseq();
    
    if (is_singleton) {
      // need to fix:
      res.push('cappruby_define_singleton_method(' + this.generate(stmt[1]));
    }
    else {
      res.push('rb_def_method(' + this.SELF);
    }
    
    res.push(', "' + stmt[2] + '", ' + result + ', ' + arity + ')');
    
    return res.join('');
  },
  
  // ['assign', lhs, rhs]
  generate_assign: function(stmt, o) {
    var type  = stmt[1][0];
    var res = [];
    
    if (type == 'identifier') {
      if (!(local = this.iseq_current.lookup_local(stmt[1][1]))) {
        local = this.iseq_current.push_local(stmt[1][1]);
      }
      return local + ' = ' + this.generate(stmt[2]);
    }
    else if (type == 'ivar') {
      return (this.SELF + '.' + stmt[1][1] + ' = ' + this.generate(stmt[2]));
    }
    else if (type == 'constant') {
      
      res.push('cappruby_const_set(' + this.SELF + ',"');
      // res.push(this.SELF + '.cs("');
      res.push(stmt[1][1]);
      res.push('", ');
      res.push(this.generate(stmt[2]));
      res.push(')');
      return res.join("");
    }
    else if (type == 'call') {
      res.push('rb_call(');
      res.push(this.generate(stmt[1][1]));
      res.push(', "set' + stmt[1][2][0].toUpperCase() + stmt[1][2].substr(1) + ':", ');
      // res.push(this.mid_to_jsid(stmt[1][2] + '='));
      // res.push('(');
      res.push(this.generate(stmt[2]));
      res.push(')');
      return res.join("");
    }
    else if (type == 'aref'){
      return this.generate_aset(stmt[1], stmt[2]);
    }
  },
  
  generate_constant: function(stmt) {
    // if (o.full && o.last) this.write('return ');
    // this.write(this.SELF + '.cg("' + stmt[1] + '")');
    // if (o.full) this.write(';\n');
    return 'cappruby_const_get(' + this.SELF + ', "' + stmt[1] + '")';
  },
  
  generate_identifier: function(stmt) {
    var local = this.iseq_current.lookup_local(stmt[1]);

    if (local)
      return local;
    else
      return 'rb_call(' + this.SELF + ', "' + stmt[1] + '")';
  },
  
  generate_true: function(stmt) {
    return "true";
  },
  
  generate_false: function(stmt) {
    return "false";
  },
  
  generate_nil: function(stmt) {
    return this.NIL;
  },
  
  generate_yield: function(stmt) {
    this.iseq_current.uses_block();
    var block = this.iseq_current.block_arg;
    var res = [block + "(" + block + ".__self__, ''"];
    // args
    if (stmt[1]) {
      for (var i = 0; i < stmt[1][0].length; i++) {
        res.push(', ');
        res.push(this.generate(stmt[1][0][i]));
      }
    }
    res.push(')');
    return res.join("");
  },
  
  generate_ternary: function(stmt) {
    var res = [];  
    res.push('((');
    var tmp_assign = this.iseq_current.temp_local();
    res.push(tmp_assign + ' = ');
    res.push(this.generate(stmt[1]));
    res.push(', ' + tmp_assign + ' !== ' + this.NIL + ' && ' + tmp_assign + ' !== false) ? ');
    res.push(this.generate(stmt[2]));
    res.push(' : ');
    res.push(this.generate(stmt[3]));
    res.push(')');
    this.iseq_current.queue_temp(tmp_assign);
    return res.join("");
  },
  
  generate_xstring: function(stmt) {
    var res = [];
    if (stmt[1].length == 0) {
      return '';
    }
    else if (stmt[1].length == 1) {
      return stmt[1][0][1];
    }
    else {
      for (var i = 0; i < stmt[1].length; i++) {
        if (stmt[1][i][0] == 'string_content') {
          res.push(stmt[1][i][1]);
        }
        else {
         res.push(this.generate(stmt[1][i][1][1][0]));
        }
      }
    }
    return res.join("");
  },
  
  // ['if'/'unless', expr, stmt, tail]
  generate_if: function(stmt, o) {
    var res = [];
    var tmp_assign = this.iseq_current.temp_local();
    var done_else = false;
    var ternary_count = 1;
    res.push('((' + tmp_assign + ' = ');
    // this.write(stmt[0] == 'if' ? 'if(' : 'if(!');
    // this.write(this.SELF + '.t(')
    res.push(this.generate(stmt[1]));
    if (stmt[0] == 'if') {
      res.push(', ' + tmp_assign + ' !== ' + this.NIL + ' && ' + tmp_assign + ' !== false) ? ');
    }
    else {
      res.push(', ' + tmp_assign + ' === ' + this.NIL + ' || ' + tmp_assign + ' === false) ? ');
    }
    this.iseq_current.queue_temp(tmp_assign);
    var c = stmt[2][1], s;
    res.push(this.generate_compstmt(c));
    res.push(' : ');
       // this.write('}\n');
    //    
    for (var i = 0; i < stmt[3].length; i++) {
      var t = stmt[3][i];
      // console.log(t);
      if (t[0] == 'elsif') {
        ternary_count++;
        res.push('((' + tmp_assign + ' = ' + this.generate(t[1]));
        res.push(', ' + tmp_assign + ' !== ' + this.NIL + ' && ' + tmp_assign + ' !== false) ? ');
        this.iseq_current.queue_temp(tmp_assign);
        res.push(this.generate_compstmt(t[2][1]));
        res.push(' : ');
        // this.write('else if (');
        // this.write(this.SELF + '.t(')
        // this.generate(t[1], {});
        // this.write(')) {\n');
        // c = t[2][1];
        // this.generate_compstmt(c, o);
        // this.write('}\n');
      }
      else {
        done_else = true;
        res.push(this.generate_compstmt(t[1][1]));
        // this.write('else {\n');
        // c = t[1][1];
        // this.generate_compstmt(c, o);
        // this.write('}\n');
      }
    }
    // if we didnt have an else, do it ourselves:
    if (!done_else) {
      res.push(this.NIL);
    }
    for (var i = 0; i < ternary_count; i ++) res.push(')');
    return res.join('');
  },
  
  generate_unless: function(stmt, o) {
    return this.generate_if(stmt, o);
  },
  
  generate_if_mod: function(stmt) {
    var res = [];
    var tmp_assign = this.iseq_current.temp_local();
    res.push('((' + tmp_assign + ' = ');
    
    res.push(this.generate(stmt[2]));
    if (stmt[1] == 'if') {
      res.push(', ' + tmp_assign + ' !== ' + this.NIL + ' && ' + tmp_assign + ' !== false) ? ');
    }
    else {
      res.push(', ' + tmp_assign + ' === ' + this.NIL + ' || ' + tmp_assign + ' === false) ? ');
    }
    this.iseq_current.queue_temp(tmp_assign);
    res.push(this.generate(stmt[3]));
    res.push(' : ' + this.NIL + ')');
    // this.write('}\n');
    return res.join('');
  },
  
  generate_aref: function(stmt, o) {
    var res = [];
    res.push('rb_call(')
    res.push(this.generate(stmt[1]));
    res.push(', "[]:"');
    if (stmt[2]) {
      for (var i = 0; i < stmt[2].length; i++) {
        var s = stmt[2][i];
        res.push(', ');
        res.push(this.generate(s));
      }
    }
    res.push(')');
    return res.join('');
  },
  
  // [arefs, aset]
  generate_aset: function(aref, arg) {
    var res = [];
    // console.log(aref);
    res.push('rb_call(')
    res.push(this.generate(aref[1]));
    res.push(', "[]=:"');
    if (aref[2]) {
      for (var i = 0; i < aref[2].length; i++) {
        var s = aref[2][i];
        res.push(', ');
        res.push(this.generate(s));
      }
    }
    res.push(', ');
    res.push(this.generate(arg));
    res.push(')');
    return res.join("");
  },
  
  // ['array', arefs]
  generate_array: function(stmt, o) {
    var res = [];
    if (stmt[1]) {
      for (var i = 0; i < stmt[1].length; i++) {
        var s = stmt[1][i];
        res.push(this.generate(s));
      }
    }
    return '[' + res.join(", ") + ']';
  },
  
  generate_ivar: function(stmt) {
    this.iseq_current.ensure_ivar(stmt[1]);
    return this.SELF + '.' + stmt[1];
  },
  
  // ['require', STRING_CONTENT]
  generate_require: function(stmt) {
    var str = stmt[1];
    var is_local = str[0] == '.';
    // if (is_local) {
      // str = str.substr(str.indexOf('/') + 1);
    // }
    // if (! /\/ .str.indexOf('.') == -1) {
      // str += '.rb';
    // }
    if(!str.match(/\.\w*$/)) {
      str += '.rb';
    }
    this._dependencies.push(str);
    return "objj_executeFile('" + str + "', " + (is_local ? "true" : "false") + ")";
  },
  
  generate_hash: function(stmt) {
    var res = [];
    res.push('objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [');
    for (var i = 0; i < stmt[1].length; i++) {
      if (i > 0) res.push(', ');
      res.push(this.generate(stmt[1][i][1]));
    }
    res.push('], [')
    for (var i = 0; i < stmt[1].length; i++) {
      if (i > 0) res.push(', ');
      res.push(this.generate(stmt[1][i][0]));
    }
    res.push('])');
    return res.join("");
  },
  
  generate_symbol: function(stmt) {
    if (stmt[1][0] == 'identifier') {
      return 'ID2SYM("' + stmt[1][1] + '")';
    }
    else {
      this.write("Bad Symbol Part: " + stmt[1][0]);
    }
  },
  
  generate_colon2: function(stmt) {
    return "cappruby_const_at(" + this.generate(stmt[1]) + ", '" + stmt[2] + "')";
  },
  
  generate_return: function(stmt) {
    // need to inform iseq_current to tell its nearest def iseq parent to catch
    // all return statements
    this.iseq_current.def_should_handle_return();
    var res = [];
    res.push('rb_return(');
    if (stmt[1]) {
      var arg, args = stmt[1][0];
      // norm args
      if (args && args.length > 0) {
        if (args.length == 1) {
          res.push(this.generate(args[0]));
        } else {
          res.push('[');
          for (var i = 0; i < args.length; i++) {
            arg = args[i];
            if (i > 0) res.push(', ');
            res.push(this.generate(arg));
          }
          res.push(']');
        }
      }
    } else {
      res.push(this.NIL);
    }
    res.push(')');
    return res.join("");
  },
  
  // ['or', lhs, rhs]
  generate_or: function(stmt) {
    var res = [];
    var tmp_assign = this.iseq_current.temp_local();
    res.push('((' + tmp_assign + ' = ');
    res.push(this.generate(stmt[1]));
    res.push(', ' + tmp_assign + ' !== ' + this.NIL + ' && ' + tmp_assign + ' !== false)');
    // this.write("(" + this.SELF + ".t(" + tmp_assign + "=");
    // this.generate(stmt[1], {});
    res.push(" ? ");
    res.push(tmp_assign);
    res.push(" : ");
    res.push(this.generate(stmt[2]));
    res.push(")");
    this.iseq_current.queue_temp(tmp_assign);
    return res.join("");
  },
  
  // ['and', lhs, rhs]
  generate_and: function(stmt, o) {
    var res = [];
    var tmp_assign = this.iseq_current.temp_local();
    res.push('((' + tmp_assign + ' = ');
    res.push(this.generate(stmt[1]));
    res.push(', ' + tmp_assign + ' !== ' + this.NIL + ' && ' + tmp_assign + ' !== false)');
    // this.write("(" + this.SELF + ".t(" + tmp_assign + "=");
    // this.generate(stmt[1], {});
    res.push(" ? ");
    res.push(tmp_assign);
    res.push(" : ");
    res.push(this.generate(stmt[2]));
    res.push(")");
    this.iseq_current.queue_temp(tmp_assign);
    return res.join("");
  }  ,

    // ['op_asgn', op, lhs, rhs]
    generate_op_asgn: function(stmt, o) {
      var new_left = stmt[2];
      if (stmt[1] == '||') {
        var new_right = ['assign', stmt[2], stmt[3]];
        var assign = ['or', new_left, new_right];
      }
      else if (stmt[1] == '&&') {
        var new_right = ['assign', stmt[2], stmt[3]];
        var assign = ['and', new_left, new_right];
      }
      else if (['+', '-', '*', '/'].indexOf(stmt[1]) != -1) {
        var new_right = ['call', stmt[2], stmt[1], [[stmt[3]]]];
        var assign = ['assign', new_left, new_right];
      }
      else {
        console.log( "op asgn, bad OP");
        throw "op asgn, bad OP"
      }
      return this.generate(assign, o);
    }
};

exports.Generator = RubyGenerator;
