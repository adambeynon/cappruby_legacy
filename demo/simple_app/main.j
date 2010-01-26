/*
 * AppController.j
 * simple_app
 *
 * Created by You on Janurary 26, 2010.
 * Copyright 2010, Your Company All rights reserved.
 */

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>
@import <CappRuby/CappRuby.j>

function main(args, namedArgs)
{
    // CPApplicationMain(args, namedArgs);
    cappruby_main("rb_main.rb", argc, argv);
}
