//
//  AppDelegate.m
//  DelegationUI
//
//  Created by Simon  on 5/31/12.
//  Copyright (c) 2012 Simon . All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)comboBoxSelectionDidChange:(NSNotification *)notification {
    NSLog(@"The combo box changed. The notification was %@ and the object was %@", notification.name, notification.object);
}

@end
