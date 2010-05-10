CappRuby = {};

CappRuby.Class = function (class_name,super_class,class_body) {
var r,c,prop;
r = function () {
this.initialize.apply(this,arguments);
return this;
};
super_class = super_class || function() {};
c = function () {
};
c.prototype = super_class.prototype;
for (i = 0; i < super_class.length; i++) {
prop = super_class[i];
r[prop] = super_class[prop];
}
r.__super__ = super_class.prototype;
r.__classid__ = class_name;
r.prototype = new c();
r.prototype.constructor = r;
r.prototype.__super__ = super_class.prototype;
r.prototype.__classid__ = class_name;
class_body.apply(r,[]);
return r;
};

var iseq_current = null;
var iseq_stack = [];

function iseq_stack_push(iseq) {
  iseq_current = iseq;
  iseq_stack.push(iseq);
};

function iseq_stack_pop() {
  var iseq = iseq_current;
  iseq_stack.pop();
  iseq_current = iseq_stack[iseq_stack.length - 1];
};

// add the name as a fake vairbale in current scope to allow re-opening classes
// that might or might not exist
// var name = name;
function add_class_name_ivar(name) {
  iseq_current.add_class_name_ivar(name);
};

// write str as code to current iseq
function write(str) {
  iseq_current.write(str);
};

CappRuby.BasicNode = new CappRuby.Class('BasicNode', null, function() {
  this.prototype.initialize = function() {
    
  };
  
  this.prototype.make_full_stmt = function() {
    this._full_stmt = true;
  };
  
  this.prototype.make_last_stmt = function() {
    this._last_stmt = true;
  };
});

CappRuby.CommentNode = new CappRuby.Class('CommentNode', CappRuby.BasicNode, function() {
  
  this.prototype.initialize = function(content) {
    this._content = content;
  };
  
  this.prototype.generate = function() {
    write('//' + this._content + '\n');
  };
});

CappRuby.TopNode = new CappRuby.Class('TopNode', CappRuby.BasicNode, function() {
  
  this.prototype.initialize = function(bodystmt) {
    this._code = [];
    
    this._arg_names = [];
    
    this._locals = [];
    
    this._stmts = bodystmt[0];
    
    for (var i = 0; i < this._stmts.length; i++) {
      this._stmts[i].make_full_stmt();
    }
    
    for (var i = this._stmts.length - 1; i >= 0; i--) {
      if (!(this._stmts[i] instanceof CappRuby.CommentNode)) {
        this._stmts[i].make_last_stmt();
        break;
      }
    }
  };
  
  this.prototype.lookup_local = function(name) {
    if (this._locals.indexOf(name) !== -1) {
      return name;
    } 
    if (this._arg_names.indexOf(name) !== -1) {
      return name;
    }
    return false;
  };
  
  this.prototype.write = function(str) {
    this._code.push(str);
  };
  
  this.prototype.push_arg_name = function(name) {
    this._arg_names.push(name);
  };
  
  this.prototype.generate = function() {
    iseq_stack_push(this);
    for (var i = 0; i < this._stmts.length; i++) {
      this._stmts[i].generate();
    }
    iseq_stack_pop();
    
    var r = [];
    r.push('(function() {\n');
    r.push('var self = cappruby_top_self;\n');
    r.push('var _cmd = "";\n');
    r.push(this._code.join(''));
    r.push('})();\n');
    return r.join('');
  };
  
});

CappRuby.NumericNode = new CappRuby.Class('NumericNode', CappRuby.BasicNode, function() {
  
  this.prototype.initialize = function(value) {
    this._value = value;
  };
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    write(this._value);
    if (this._full_stmt) write(';\n');
  };
});

CappRuby.SymbolNode = new CappRuby.Class('SymbolNode', CappRuby.BasicNode, function() {
  
  this.prototype.initialize = function(name) {
    this._name = name;
  };
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    write('ID2SYM("' + this._name + '")');
    if (this._full_stmt) write(';\n');
  };
});

CappRuby.ArrayNode = new CappRuby.Class('ArrayNode', CappRuby.BasicNode, function() {
  
  this.prototype.initialize = function(args) {
    this._args = args;
  };
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    write('[');
    for (var i = 0; i < this._args.length; i++) {
      if (i > 0) write(', ');
      this._args[i].generate();
    }
    write(']');
    if (this._full_stmt) write(';\n');
  };
});

CappRuby.DefNode = new CappRuby.Class('DefNode', CappRuby.TopNode, function () {
  
  this.prototype.initialize = function(fname, singleton, args, body) {
    this._fname     = fname;
    this._singleton = singleton;
    this._args      = args[0];
    this._optargs   = args[1] || [];
    this._restargs  = args[2] || [];
    this._postargs  = args[3] || [];
    this._blockarg  = args[4];
    
    if (args[0].length > 0 || args[1].length > 0 || args[2].length > 0 || args[3].length > 0) {
      this._fname += ':';
    }
    
    // work out if labelled style def, i.e. capp style
    // also if not labeled, then append ':' to fname if we take an arg to make
    // method compatible with selector style syntax: no selector if no args
    
    CappRuby.TopNode.prototype.initialize.apply(this, [body]);
  };
  
  this.prototype.block_name = function() {
    // if block arg was given, use that, otherwise use default '_block'
    this._block_name = '_block';
    return this._block_name;
  };
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    write('cappruby_define_method(self, "' + this._fname + '", function(self, _cmd');
    
    this.deal_with_method_args();
    
    iseq_stack_push(this);
    for (var i = 0; i < this._stmts.length; i++) {
      this._stmts[i].generate();
    }
    iseq_stack_pop();
    
    if (this._block_name) {
      write('var ' + this._block_name + ' = arguments[arguments.length - 1];\n');
    }
    
    write(this._code.join(''));
    write('})');
    if (this._full_stmt) write(';\n');
  };
  
  this.prototype.deal_with_method_args = function() {
    var norm = this._args.length, opt = this._optargs.length, rest = this._restargs.length, post = this._postargs.length;
    
    for (var i = 0; i < norm; i++) {
      this.push_arg_name(this._args[i]);
    }
    
    for (var i = 0; i < rest; i++) {
      this.push_arg_name(this._restargs[i]);
    }
    
    // case 1: no arguments at all
    if (norm == 0 && opt == 0 && rest == 0 && post == 0) {
      write(') {\n');
    }
    // case 2: any number of normal args (no others)
    else if (opt == 0 && rest == 0 && post == 0) {
      for (var i = 0; i < this._args.length; i++) {
        write(', ');
        write(this._args[i]);
      }
      write(') {\n');
    }
    // case 3: just splat arg
    else if (norm == 0 && opt == 0 && rest == 1 && post == 0) {
      write(', ');
      write(this._restargs[0]);
      write(') {\n');
      write(this._restargs[0]);
      write(' = Array.prototype.slice.call(arguments, 2);\n');
    }
    else {
      write("ERM, DONT KNOW) {\n}");
    }
  };
  
});

CappRuby.BlockNode = new CappRuby.Class('BlockNode', CappRuby.DefNode, function() {
  
  this.prototype.initialize = function(args, stmts) {
    this._args      = args[0] || [];
    this._optargs   = args[1] || [];
    this._restargs  = args[2] || [];
    this._postargs  = args[3] || [];
    this._blockarg  = args[4] || null;
    // super
    CappRuby.TopNode.prototype.initialize.apply(this, [stmts]);
  };
  
  this.prototype.generate = function(parent) {
    this._parent = parent;
    
    write('function(_self, __cmd')
    this.deal_with_method_args();
    write("with ({ self: (_self == nil ? self : _self), _cmd: (__cmd == nil ? _cmd : __cmd) }) {\n");
    
    iseq_stack_push(this);
    for (var i = 0; i < this._stmts.length; i++) {
      this._stmts[i].generate();
    }
    iseq_stack_pop();
    
    write(this._code.join(''));
    
    write("}\n");
    
    write('}');
    // write(r.join(''));
  };
});


CappRuby.TrueNode = new CappRuby.Class('TrueNode', CappRuby.BasicNode, function () {
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    write('true');
    if (this._full_stmt) write(';\n');
  };
  
});

CappRuby.FalseNode = new CappRuby.Class('FalseNode', CappRuby.BasicNode, function () {
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    write('false');
    if (this._full_stmt) write(';\n');
  };
  
});

CappRuby.SelfNode = new CappRuby.Class('SelfNode', CappRuby.BasicNode, function () {
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    write('self');
    if (this._full_stmt) write(';\n');
  };
  
});

CappRuby.NilNode = new CappRuby.Class('NilNode', CappRuby.BasicNode, function () {
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    write('nil');
    if (this._full_stmt) write(';\n');
  };
  
});

CappRuby.StringNode = new CappRuby.Class('StringNode', CappRuby.BasicNode, function () {
  
  this.prototype.initialize = function(parts) {
    this._parts = parts;
  };
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    var parts = this._parts, length = parts.length;
    
    if (length === 0) {
      write('""');
    }
    else if (length === 1) {
      write('"');
      write(parts[0][1]);
      write('"');
    }
    else {
      write('[');
      for (var i = 0; i < length; i++) {
        if (parts[i][0] === 'string_content') {
          write('"' + parts[i][1] + '"');
        }
      }
      write('].join("")');
    }
    
    if (this._full_stmt) write(';\n');
  };
  
});

CappRuby.XStringNode = new CappRuby.Class('XStringNode', CappRuby.BasicNode, function () {
  
  this.prototype.initialize = function(parts) {
    this._parts = parts;
  };
  
  this.prototype.generate = function() {
    var parts = this._parts, length = parts.length;
    
    if (length === 0) {
    }
    else if (length === 1) {
      write(parts[0][1]);
    }
    else {
      for (var i = 0; i < length; i++) {
        if (parts[i][0] === 'string_content') {
          write(parts[i][1]);
        }
        else {
          parts[i][1][0].generate();
        }
      }
    }
  };  
});

CappRuby.IdentifierNode = new CappRuby.Class('IdentifierNode', CappRuby.BasicNode, function () {
  
  this.prototype.initialize = function(value) {
    this._value = value;
  };
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    // check if local etc..
    print("lookup local: " + this._value + " :: " + iseq_current.lookup_local(this._value));
    if (iseq_current.lookup_local(this._value)) {
      write(this._value);
    }
    else {
      write('objj_msgSend(self, "' + this._value + '")');
    }
    if (this._full_stmt) write(';\n');
  };
  
});


CappRuby.ConstantNode = new CappRuby.Class('ConstantNode', CappRuby.BasicNode, function () {
  
  this.prototype.initialize = function(value) {
    this._value = value;
  };
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    
    write(this._value);
    
    if (this._full_stmt) write(';\n');
  };
  
});

CappRuby.CallNode = new CappRuby.Class('CallNode', CappRuby.BasicNode, function () {
  
  this.prototype.initialize = function(recv, meth, args, block) {
    this._recv = recv;
    this._meth = meth;
    this._args = args;
    
    // determine objj style, or not
    if (args && args[1] && args[1] instanceof CappRuby.LabelAssocs) {
      this._meth = this._meth + ':' + this._args[1].selector();
      this._args = args[1].args();
      this._args.unshift(args[0][0]);
    }
    else {
      this._args = (args && args[0]) ? args[0] : [];
      
      if (args && args[1]) this._args.unshift(args[1]);
      
      if (this._args.length > 0) this._meth += ':';
    }
    
    
    this._block = block;
  };
  
  this.prototype.set_block = function(block) {
    print('setting block..');
    this._block = block;
    print(this._block);
  };
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    
    write('objj_msgSend(');
    
    if (this._recv) {
      this._recv.generate();
    }
    else {
      write("self");
    }
    
    write(', "' + this._meth + '"');
    
    for (var i = 0; i < this._args.length; i++) {
      write(', ');
      this._args[i].generate();
    }
    
    if (this._block) {
      write(', ');
      this._block.generate();
    }    
    write(')');
    
    if (this._full_stmt) write(';\n');
  };
  
});

CappRuby.LabelAssocs = new CappRuby.Class('LabelAssocs', CappRuby.BasicNode, function() {
  
  this.prototype.initialize = function(parts) {
    this._parts = parts;
    this._selector = ""
    this._args = [];
    
    for (var i = 0; i < this._parts.length; i++) {
      this._selector = this._selector + this._parts[i][0];
      this._args.push(this._parts[i][1]);
    }
  };
  
  this.prototype.selector = function() {
    return this._selector;
  };
  
  this.prototype.args = function() {
    return this._args;
  };
});

CappRuby.Assocs = new CappRuby.Class('Assocs', CappRuby.BasicNode, function() {
  
  this.prototype.initialize = function(parts) {
    this._parts = parts;
  };
  
  this.prototype.generate = function() {
    write('objj_dictionary([')
    
    for (var i = 0; i < this._parts.length; i++) {
      if (i > 0) write(', ');
      this._parts[i][0].generate();
      write(', ');
      this._parts[i][1].generate();
    }
    
    write('])');
  };
});


CappRuby.ClassNode = new CappRuby.Class('ClassNode', CappRuby.TopNode, function() {
  
  this.prototype.initialize = function(cpath, superclass, stmts) {
    this._cpath = cpath;
    this._superclass = superclass;
    // super
    CappRuby.TopNode.prototype.initialize.apply(this, [stmts]);
  };
    
  this.prototype.generate = function() {
    this._parent = iseq_current;
    
    iseq_stack_push(this);
    for (var i = 0; i < this._stmts.length; i++) {
      this._stmts[i].generate();
    }
    iseq_stack_pop();
    
    var r = [];
    r.push('cappruby_defineclass(self, nil, "' + this._cpath + '", function(self) {\n');
    r.push(this._code.join(''));
    r.push('}, 0)');
    write(r.join(''));
    
    if (this._full_stmt) write(';\n');
  };
});

CappRuby.ClassShiftNode = new CappRuby.Class('ClassShiftNode', CappRuby.TopNode, function() {
  
  this.prototype.initialize = function(expr, stmts) {
    this._expr = expr;
    CappRuby.TopNode.prototype.initialize.apply(this, [stmts]);
  };
  
  this.prototype.generate = function() {
    iseq_stack_push(this);
    for (var i = 0; i < this._stmts.length; i++) {
      this._stmts[i].generate();
    }
    iseq_stack_pop();
    
    write('(function(self) {\n');
    write(this._code.join(''));
    write('})(cappruby_singleton_class(');
    this._expr.generate();
    write('))');
    if (this._full_stmt) write(';\n');
  };
  
});

CappRuby.IfNode = new CappRuby.Class('IfNode', CappRuby.BasicNode, function() {
  
  this.prototype.initialize = function(expr, stmt, tail) {
    tail.unshift(['if', expr, stmt]);
    this._tail = tail;
  };
  
  this.prototype.generate = function() {
    if (!this._full_stmt) write('(function(){\n');
    
    for (var i = 0; i < this._tail.length; i++) {
      var tail = this._tail[i];
      if (tail[0] === 'if') {
        write('if (');
        tail[1].generate();
        write(')');
      }
      else if (tail[0] === 'elsif') {
        write('else if (');
        tail[1].generate();
        write(')');
      }
      else {
        write('else');
      }
      
      write('{\n');
      
      if (this._last_stmt || !this._full_stmt) {
        for (var k = tail[2].length - 1; i >= 0; i--) {
          if (!(tail[2][k] instanceof CappRuby.CommentNode)) {
            tail[2][k].make_last_stmt();
            break;
          }
        }
      }
      
      for (var j = 0; j < tail[2].length; j++) {
        tail[2][j].make_full_stmt();
        tail[2][j].generate();
      }
      
      write('}');
    }
    if (!this._full_stmt)
      write('})()');
    else
      write('\n');
  };
});


CappRuby.AssignNode = new CappRuby.Class('AssignNode', CappRuby.BasicNode, function() {
  
  this.prototype.initialize = function(lhs, rhs) {
    this._lhs = lhs;
    this._rhs = rhs;
  };
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    
    if (this._lhs instanceof CappRuby.IdentifierNode) {
      write(this._lhs._value);
      write(' = ');
      this._rhs.generate();
    }
    else if (this._lhs instanceof CappRuby.ConstantNode) {
      write('cappruby_const_set(self, "' + this._lhs._value + '", ');
      this._rhs.generate();
      write(')');
    }
    else {
      throw "unknown AssignNode type"
    }
    
    if (this._full_stmt) write(';\n');
  };
});

CappRuby.YieldNode = new CappRuby.Class('YieldNode', CappRuby.BasicNode, function() {
  
  this.prototype.initialize = function(args) {
    // print(args);
    this._args = args;
  };
  
  this.prototype.generate = function() {
    write('cappruby_yield(');
    // print(iseq_current.__classid__);
    write(iseq_current.block_name());
    // block name
    // args
    if (this._args && this._args[0]) {
      for (var i = 0; i < this._args[0].length; i++) {
        write(', ');
        this._args[0][i].generate();
      }
    }
    
    write(')');
    
    if (this._full_stmt) write(';\n');
  };
});

CappRuby.BreakNode = new CappRuby.Class('BreakNode', CappRuby.BasicNode, function() {
  
  this.prototype.initialize = function(args) {
    this._args = args || [[]];
  };
  
  this.prototype.generate = function() {
    write('cappruby_break(');
    if (this._args && this._args[0]) {
      for (var i = 0; i < this._args[0].length; i++) {
        write(', ');
        this._args[0][i].generate();
      }
    }
    
    write(')');
    
    if (this._full_stmt) write(';\n');
  };
});

CappRuby.TernaryNode = new CappRuby.Class('TernaryNode', CappRuby.BasicNode, function() {
  
  this.prototype.initialize = function(a, b, c) {
    this._a = a;
    this._b = b;
    this._c = c;
  };
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    this._a.generate();
    write(' ? ');
    this._b.generate();
    write(' : ');
    this._c.generate();
    if (this._full_stmt) write(';\n');
  };
});