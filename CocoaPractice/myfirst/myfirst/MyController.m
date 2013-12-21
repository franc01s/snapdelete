/*
 *  $Id: MyController.m 193 2009-01-06 14:38:24Z sunday $
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

#import "MyController.h"
#import <ManageONTAP/ManageONTAP.h>
#import "NAElementOutlineController.h"

@implementation MyController

- (void) awakeFromNib
{
	[requestController setEditable:YES];
}

- (IBAction)send:(id) obj
{
	NAServer *server = nil;
	server = [[NAServer alloc] initWithServer:[host stringValue] 
								 majorVersion:1 
								 minorVersion:0];
	if ([[hostType titleOfSelectedItem] isEqualToString:@"DFM"]) {
		[server setServerType:NAServerDFM];
	}
	[server setUser:[username stringValue] password:[password stringValue]];
	[server setTransportType:([sslCheckbox state] == NSOnState) ? NATransportHTTPS : NATransportHTTP];
	
	NAElement *root = [NAElement elementWithName:[request stringValue]];
	for (int i = 0; i < [[requestController roots] count]; i++) {
		[root addChild:[[requestController roots] objectAtIndex:i]];
	}
	
	NAApiConnection *conn = [[NAApiConnection alloc] initWithRequest:root 
															toServer:server 
															  target:self 
															selector:@selector(responseReceived:)];
	if (!conn) {
		NSRunAlertPanel(@"Error", @"Unable to create request", @"Dismiss", nil, nil);
	}

}
	
- (void) addParameter:(id)sender {
	NAElement *newElement = [NAElement elementWithName:@"parameter"];
	if ([requestParameters selectedRow] == -1) {
		[[requestController roots] addObject:newElement];
		[requestParameters reloadData];
	}
	else {
		NAElement *parent = [requestParameters itemAtRow:[requestParameters selectedRow]];
		if ([[parent content] length] != 0) {
			NSLog(@"Can't add children to %@ node with content", [parent name]);
			return;
		}
		[parent addChild:newElement];
		[requestParameters reloadItem:parent reloadChildren:YES];
		[requestParameters expandItem:parent];
	}
	NSUInteger row = [requestParameters rowForItem:newElement];
	NSLog(@"row %ld", (unsigned long)row);
	[requestParameters selectRowIndexes:[NSIndexSet indexSetWithIndex:row] byExtendingSelection:NO];
	[requestParameters editColumn:0 row:row withEvent:nil select:YES];
	
}
	
- (void) removeParameter:(id)sender {
	if ([requestParameters selectedRow] == -1) {
		return;
	}
	NAElement *item = [requestParameters itemAtRow:[requestParameters selectedRow]];
	NAElement *parent = [requestParameters parentForItem:item];
	if (parent == nil) {
		[[requestController roots] removeObject:item];
		[requestParameters reloadData];
	}
	else {
		[parent removeChild:item];
		[requestParameters reloadItem:parent reloadChildren:YES];
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
//		NSLog(@"%@",[results description]);
 //       results = [[results children]objectAtIndex:0];
        NAElement *toto = [[NAElement alloc]init];
        toto = [results child:@"volumes"];
        
        if (toto != nil){

        toto = [toto child:@"volume-info"];
        toto = [toto child:@"checksum-style"];
        }
        
		[responseController setRoots:[[results children]mutableCopy]];
        NSLog(@"%@:%@",[toto name], [toto content]);
		[response reloadData];
		for (int i = 0; i < [[responseController roots] count]; i++) {
			[response expandItem:[[responseController roots] objectAtIndex:i]  expandChildren:YES];
		}
	//	[response expandItem:results expandChildren:YES];
	}
}

@end
