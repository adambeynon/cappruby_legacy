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
cappruby_defineclass(self, nil, "AppController", function(self) {
// attr_accessor :the_window
cappruby_define_method(self, "applicationDidFinishLaunching:", function(self, _cmd, aNotification) {
// This is called when the application is done loading
console.log('ohhhhh yeah!');// main_window
});
objj_msgSend(self, "puts:", "adam");
cappruby_define_method(self, "awakeFromCib", function(self, _cmd) {
// This is called when the cib is done loading
});
cappruby_define_method(self, "normal:", function(self, _cmd, adam, ben, john) {
});
cappruby_define_method(self, "splat:", function(self, _cmd, args) {
args = Array.prototype.slice.call(arguments, 2);
});
return cappruby_define_method(self, "none", function(self, _cmd) {
});
}, 0);
return objj_msgSend([1, 2, 3, 4], "each", function(_self, __cmd, arg) {
with ({ self: (_self == nil ? self : _self), _cmd: (__cmd == nil ? _cmd : __cmd) }) {
if (objj_msgSend(arg, ">:", 2)){
cappruby_break();
}
return objj_msgSend(self, "puts:", arg);
}
});
})();
