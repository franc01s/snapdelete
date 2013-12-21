//
//  AppDelegate.h
//  SandboxExample
//
//  Created by Simon on 6/5/12.
//  Copyright (c) 2012 Simon. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet WebView *myWebView;


@end
