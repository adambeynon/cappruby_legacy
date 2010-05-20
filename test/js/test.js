(function() {
var self = cappruby_top_self;
var _cmd = "";
// 
//  test.rb
//  cappruby
//  
//  Created by Adam Beynon on 2010-05-09.
//  Copyright 2010 Adam Beynon. All rights reserved.
// 
cappruby_defineclass(self, nil, "ModuleA", function(self) {
cappruby_defineclass(self, nil, "ModuleB", function(self) {
return cappruby_msgSend(cappruby_const_at(cappruby_const_at(cappruby_const_get(self, "Spec"), "Example"), "ExampleGroupFactory"), "create_example_group:", cappruby_msgSend(self, "str"), cappruby_msgSend(self, "block"));
}, 2);
}, 2);
cappruby_defineclass(self, nil, "AppController", function(self) {
// attr_accessor :the_window
cappruby_define_method(self, "applicationDidFinishLaunching:", function(self, _cmd, aNotification) {
var btn2;
// This is called when the application is done loading
console.log('ohhhhh yeah! applicationDidFinishLaunching');btn2 = cappruby_msgSend(self, "button:", objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", ["Click me!", [100, 100, 100, 24]], [ID2SYM("title"), ID2SYM("frame")]));
cappruby_msgSend(btn2, "setTitle:", "CappRuby rokz!");
return cappruby_msgSend(cappruby_msgSend(cappruby_const_get(self, "CPApp"), "mainWindow"), "<<:", btn2);
});
cappruby_define_method(self, "awakeFromCib", function(self, _cmd) {
var success;
// This is called when the cib is done loading
success = true;
success = false;
cappruby_msgSend(self, "instance_eval", cappruby_msgSend(self["@_implementation"], 'to_proc'));
cappruby_msgSend(self, "instane_eval", cappruby_msgSend(cappruby_msgSend(cappruby_msgSend(self, "example_implementations"), "[]:", cappruby_msgSend(self, "example")), 'to_proc'));
return 100;
});
cappruby_define_method(self, "be_nil", function(self, _cmd) {
return cappruby_msgSend(cappruby_const_get(self, "Matcher"), "new:", ID2SYM("be_nil"), nil, function(_self, __cmd, exp) {
with ({ self: (_self == nil ? self : _self), _cmd: (__cmd == nil ? _cmd : __cmd) }) {
return cappruby_msgSend(self, "match", function(_self, __cmd, actual) {
with ({ self: (_self == nil ? self : _self), _cmd: (__cmd == nil ? _cmd : __cmd) }) {
return cappruby_msgSend(actual, "nil?");
}
});
}
});
});
return cappruby_define_method(self, "instance_exec:", function(self, _cmd, arg) {
var block = arguments[arguments.length - 1];
if (!(block) ||block.isa !== CPBlock) {block = undefined;}
return block(self, null, arg);});
}, 0);
/^\n\.omg/;
["adam ", objj_msgSend(10, 'to_s'), " ", objj_msgSend(20, 'to_s')].join("");
cappruby_defineclass(self, nil, "Animal", function(self) {
}, 0);
cappruby_defineclass(self, cappruby_const_get(self, "Animal"), "Hamster", function(self) {
}, 0);
})();
