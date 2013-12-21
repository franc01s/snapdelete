//
//  AppDelegate.h
//  CustomController
//
//  Created by Simon Allardice on 5/30/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)simpleMethod:(id)sender;
@end
