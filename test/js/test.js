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
console.log('ohhhhh yeah! applicationDidFinishLaunching');// main_window
});
return cappruby_define_method(self, "awakeFromCib", function(self, _cmd) {
// This is called when the cib is done loading
});
}, 0);
try {
cappruby_msgSend(self, "do_way:");
}
catch (_err) {
var e = _err;
// puts "rescued!"
console.log("rescued!");}
cappruby_msgSend(self, "raise:", "OMG!");
self["@adam"] = cappruby_msgSend(self["@adam"], "+:", 4);
self["@adam"] = cappruby_msgSend(self["@adam"], "-:", 4);
self["@adam"] = cappruby_msgSend(self["@adam"], "*:", 4);
self["@adam"] = cappruby_msgSend(self["@adam"], "/:", 4);
self["@adam"] = cappruby_msgSend(self["@adam"], "%:", 100);
self["@adam"] = cappruby_msgSend(self["@adam"], "**:", 400);
self["@adam"] = cappruby_msgSend(self["@adam"], "&:", 200);
self["@adam"] = cappruby_msgSend(self["@adam"], "|:", 400);
self["@adam"] = cappruby_msgSend(self["@adam"], "^:", 600);
self["@adam"] = cappruby_msgSend(self["@adam"], "<<:", 800);
self["@adam"] = cappruby_msgSend(self["@adam"], ">>:", 392);
self["@adam"] = self["@adam"] && 400;
return self["@ben"] = self["@ben"] || 700;
})();
