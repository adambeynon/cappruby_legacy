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
// require 'AppKit/CPWindow.j'
// require 'AppKit/AppKit'
// require './string_scanner'
// require '../window.js'
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
// This is called when the cib is done loading
});
return cappruby_define_method(self, "tester", function(self, _cmd) {
var adam = arguments[arguments.length - 1];
if ((typeof adam === "function")){
cappruby_yield(adam, self);
}
});
}, 0);
/^\n\.omg/;
return ["adam ", objj_msgSend(10, 'to_s'), " ", objj_msgSend(20, 'to_s')].join("");
})();
