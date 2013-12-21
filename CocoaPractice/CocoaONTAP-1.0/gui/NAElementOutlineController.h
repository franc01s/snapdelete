/*
 *  $Id: NAElementOutlineController.h 193 2009-01-06 14:38:24Z sunday $
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
#import "ManageONTAP/ManageONTAP.h"

@interface NAElementOutlineController : NSObject {
	NSMutableArray *roots;
	BOOL editable;
}

- (NAElementOutlineController*)initWithRoots:(NSArray*)roots;
- (void)awakeFromNib;

- (void)setRoots:(NSArray*)roots;
- (NSMutableArray*)roots;

- (void)setEditable:(BOOL)newEditable;
- (BOOL)isEditable;

- (int)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item;
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item;
- (id)outlineView:(NSOutlineView *)outlineView child:(int)index ofItem:(id)item;
- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item;

- (BOOL)outlineView:(NSOutlineView *)outlineView shouldEditTableColumn:(NSTableColumn *)tableColumn item:(id)item;
- (void)outlineView:(NSOutlineView *)outlineView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn byItem:(id)item;

@end
