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
  
  this.prototype.write = function(str) {
    this._code.push(str);
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
    this._fname = fname;
    this._singleton = singleton;
    this._args = args;
    
    // work out if labelled style def, i.e. capp style
    // also if not labeled, then append ':' to fname if we take an arg to make
    // method compatible with selector style syntax: no selector if no args
    
    CappRuby.TopNode.prototype.initialize.apply(this, [body]);
  };
  
  this.prototype.generate = function() {
    if (this._full_stmt && this._last_stmt) write('return ');
    write('cappruby_define_method(self, "' + this._fname + '", function(self, _cmd');
    // arglist..
    write(') {\n');
    for (var i = 0; i < this._stmts.length; i++) {
      this._stmts[i].generate();
    }
    write('})');
    if (this._full_stmt) write(';\n');
  };
  
});
