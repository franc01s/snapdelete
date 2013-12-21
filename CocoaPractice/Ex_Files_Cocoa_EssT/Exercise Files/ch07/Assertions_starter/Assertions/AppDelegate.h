//
//  AppDelegate.h
//  Assertions
//
//  Created by Simon on 6/4/12.
//  Copyright (c) 2012 Simon. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;


@property (weak) IBOutlet NSTextField *myLabel;

- (IBAction)doSomething:(id)sender;

@end
