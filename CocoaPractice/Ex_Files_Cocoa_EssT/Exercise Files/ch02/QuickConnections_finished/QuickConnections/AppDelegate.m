//
//  AppDelegate.m
//  QuickConnections
//
//  Created by Simon Allardice on 5/29/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize textField;
@synthesize myLabel;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)changeLabel:(id)sender {
    NSString *message = [[NSString alloc]initWithFormat:@"Hello, %@", [textField stringValue]];
    [myLabel setStringValue:message];
}
@end
