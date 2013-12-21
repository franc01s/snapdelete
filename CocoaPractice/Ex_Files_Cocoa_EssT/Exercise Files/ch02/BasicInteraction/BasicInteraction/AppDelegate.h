//
//  AppDelegate.h
//  BasicInteraction
//
//  Created by Simon Allardice on 5/28/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *myLabel;

-(IBAction)changeLabel:(id)sender;

@end
