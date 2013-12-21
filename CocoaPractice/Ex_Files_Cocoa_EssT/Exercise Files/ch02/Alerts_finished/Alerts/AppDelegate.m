//
//  AppDelegate.m
//  Alerts
//
//  Created by Simon  on 5/30/12.
//  Copyright (c) 2012 Simon . All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)createAlertPanel:(id)sender {
    NSInteger result = NSRunAlertPanel(@"Title", @"Basic %@ alert %@ message", @"OK", nil, @"Other",@"First",@"Second");
    NSLog(@"The result is %li", result);
}

- (IBAction)createAlertSheet:(id)sender {
    NSAlert *myAlert = [NSAlert alertWithMessageText:@"Message text" defaultButton:@"OK" alternateButton:@"Alternate" otherButton:@"Other" informativeTextWithFormat:@"This can be another format string"];
    [myAlert beginSheetModalForWindow:_window modalDelegate:nil didEndSelector:nil contextInfo:nil];
}
@end
