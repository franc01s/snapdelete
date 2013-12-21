//
//  AppDelegate.h
//  myfirst
//
//  Created by francois on 3/3/13.
//  Copyright (c) 2013 francois. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "volClass.h"
#import "ArrayHelper.h"
#import "Volumes.h"

@class NAApiConnection;
@class NAElementOutlineController;


@interface AppDelegate : NSObject

@property (weak) IBOutlet NSTableView *TableO;
@property (weak) IBOutlet NSTextField *Text1;
@property (weak) IBOutlet NSTextField *Text2;

@property (weak) IBOutlet NSTextField *filer;

@property (weak) IBOutlet NSTextField *username;
@property (weak) IBOutlet NSTextField *userpassword;

@property (weak)  NSString *request;

@property (strong) NSMutableArray *myarray;

@property (assign) IBOutlet NSWindow *window;

@property (strong)volClass * myvolume;

@property (strong) IBOutlet ArrayHelper *myarrayh;

- (void)responseReceived:(NAApiConnection*)resp;

- (IBAction)send:(NSButton *)sender;


- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication;



@end
