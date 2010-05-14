Requiring files/importing
-------------------------
Until File/Dir etc are implemented from the core library, and they are 
integrated into objj's loading system, require is treated as a keyword inside
cappruby to make requiring/loading files simpler. It's use is designed to mirror
the normal loading procedure in terms of syntax as closely as possible, so when
switching back to normal loading no changes of user code are required. One
limitation of the current implementation is that a require path MUST be a string
literal. Looping over string values etc is not supported, as the string literal
is simply output to the @import path in objective-j.

Import extension
================
If no extension is given, .rb is added. You can use .j or .js to import non
cappruby sources as normal.

Importing/Requiring local (current framework) files
===================================================

Importing files from other frameworks
=====================================
