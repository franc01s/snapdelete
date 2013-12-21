//
//  AppDelegate.h
//  DelegateAlertSheetExample
//
//  Created by Simon  on 5/31/12.
//  Copyright (c) 2012 Simon . All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)createAlertSheet:(id)sender;
@end
