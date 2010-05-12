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
cappruby_msgSend(self, "ben") || cappruby_msgSend(self, "tom");
cappruby_msgSend(self, "adam") && cappruby_msgSend(self, "ben");
cappruby_msgSend(self, "ben") || cappruby_msgSend(self, "tom");
cappruby_msgSend(self, "ben") && cappruby_msgSend(self, "tom");
cappruby_msgSend(cappruby_msgSend(self, "tom"), "!");
return cappruby_msgSend(cappruby_msgSend(self, "tommy"), "!");
})();
