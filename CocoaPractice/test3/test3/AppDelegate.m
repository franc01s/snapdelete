//
//  AppDelegate.m
//  test3
//
//  Created by francois on 2/13/13.
//  Copyright (c) 2013 francois. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize MyField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)MessageShow:(id)sender {
    NSRunAlertPanel(@"Test", @"test2", @"OK", nil, nil);
}

- (IBAction)writeText:(id)sender {
    [MyField setStringValue:@"test"];
    
    
}
@end
