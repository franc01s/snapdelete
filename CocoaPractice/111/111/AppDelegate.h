//
//  AppDelegate.h
//  111
//
//  Created by francois on 2/13/13.
//  Copyright (c) 2013 francois. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

-(IBAction)changeLabel:(id)sender) changeLabel;
-(void) doSomething;

@end
