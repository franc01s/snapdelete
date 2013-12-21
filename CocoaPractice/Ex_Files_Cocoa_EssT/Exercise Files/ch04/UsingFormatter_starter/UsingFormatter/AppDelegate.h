//
//  AppDelegate.h
//  UsingFormatter
//
//  Created by Simon on 6/1/12.
//  Copyright (c) 2012 Simon. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

// two outlets
@property (weak) IBOutlet NSTextField *myDateField;
@property (weak) IBOutlet NSTextField *numberLabel;

@end
