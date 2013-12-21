//
//  AppDelegate.h
//  test3
//
//  Created by francois on 2/13/13.
//  Copyright (c) 2013 francois. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
- (IBAction)MessageShow:(id)sender;
- (IBAction)writeText:(id)sender;

@property (weak) IBOutlet NSTextField *MyField;


@end
