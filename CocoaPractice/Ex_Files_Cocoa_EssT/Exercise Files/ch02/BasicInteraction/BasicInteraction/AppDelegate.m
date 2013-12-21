//
//  AppDelegate.m
//  BasicInteraction
//
//  Created by Simon Allardice on 5/28/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize textField, myLabel;

-(IBAction)changeLabel:(id)sender {
    NSString *message = [[NSString alloc] initWithFormat:@"Hello, %@", [textField stringValue]];
    [myLabel setStringValue:message];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

@end
