//
//  AppDelegate.m
//  myfirst
//
//  Created by francois on 3/3/13.
//  Copyright (c) 2013 francois. All rights reserved.
//

#import "AppDelegate.h"
#import "volClass.h"
#import "ArrayHelper.h"
#import <ManageONTAP/ManageONTAP.h>
#import "Volumes.h"

@implementation AppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.myvolume  = [[volClass alloc]init];
    
    [self.myvolume setName:@"François"];
    [self.myvolume setSize:@"1.90m"];
    
    _myarray = [[NSMutableArray alloc]init];
    
    //    for (int i = 0;i<3;i++){
    //        [myarray insertObject:self.myvolume atIndex:0];
    //    }
    [[self myarrayh]setMyarray:[self myarray]];
    
    
}

- (IBAction)send:(NSButton *)sender {
    //NAServer *server = nil;
	NAServer *server = [[NAServer alloc] initWithServer:[[self filer] stringValue]
								 majorVersion:1
								 minorVersion:0];
    [server setServerType:NAServerFiler];
	
	[server setUser:[self.username stringValue] password:[self.userpassword stringValue]];
	[server setTransportType:NATransportHTTPS];
    
    [self setRequest: @"volume-list-info"];
	
	NAElement *root = [NAElement elementWithName:[self request]];
	
	NAApiConnection *conn = [[NAApiConnection alloc] initWithRequest:root
															toServer:server
															  target:self
															selector:@selector(responseReceived:)];
	if (!conn) {
		NSRunAlertPanel(@"Error", @"Unable to create request", @"Dismiss", nil, nil);
	}
    
}

- (void)responseReceived:(NAApiConnection*)resp
{
	NAElement *results = [resp result];
	
	if (![results resultsPassed]) {
		NSRunAlertPanel(@"Request Failed",
						[NSString stringWithFormat: @"%@ (%d)", [results resultsReason], [results resultsErrno]],
						@"Dismiss", nil, nil);
	}
	else {

        Volumeslistinfo *myvolumelist = [[Volumeslistinfo alloc]initWithElement:results];
        
        [_myarrayh  setMyarray:[myvolumelist volumeslist]];
        [_TableO reloadData];
        }
    }
    //	[response expandItem:results expandChildren:YES];
	
}


- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}


@end
