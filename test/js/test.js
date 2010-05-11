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
if (cappruby_msgSend(cappruby_msgSend(self, "adam"), "<:", 10)){
cappruby_msgSend(40, "+:", 40);
}
if (!(cappruby_msgSend(cappruby_msgSend(self, "adam"), "<:", 10))){
return cappruby_msgSend(40, "-:", 400);
}
// adam.do_something unless adam
})();
