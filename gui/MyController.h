/*
 *  $Id: MyController.h 193 2009-01-06 14:38:24Z sunday $
 *
 *  Copyright (c) 2009 NetApp, Inc. All rights reserved.
 *  Specifications subject to change without notice.
 *
 *  This SDK sample code is provided AS IS, with no support or
 *  warranties of any kind, including but not limited to
 *  warranties of merchantability or fitness of any kind,
 *  expressed or implied. This code is subject to the license
 *  agreement that accompanies the SDK.
 *
 */

#import <Cocoa/Cocoa.h>

@class NAApiConnection;
@class NAElementOutlineController;

@interface MyController : NSObject {
	IBOutlet NSPopUpButton *hostType;
	IBOutlet NSTextField *host;
	IBOutlet NSButton *sslCheckbox;
	IBOutlet NSTextField *username;
	IBOutlet NSTextField *password;
	
	IBOutlet NSTextField *request;
	IBOutlet NSOutlineView *requestParameters;
	
	IBOutlet NSOutlineView *response;
	
	IBOutlet NAElementOutlineController *requestController;
	IBOutlet NAElementOutlineController *responseController;
}

- (void) awakeFromNib;
- (IBAction) send:(id)obj;
- (IBAction) addParameter:(id)obj;
- (IBAction) removeParameter:(id)obj;
- (void) responseReceived:(NAApiConnection*)resp;

@end
