//
//  AppDelegate.h
//  Alerts
//
//  Created by Simon  on 5/30/12.
//  Copyright (c) 2012 Simon . All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)createAlertPanel:(id)sender;
- (IBAction)createAlertSheet:(id)sender;
@end
