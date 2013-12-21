/*
 *  $Id: NAElementOutlineController.m 193 2009-01-06 14:38:24Z sunday $
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

#import "NAElementOutlineController.h"


@implementation NAElementOutlineController

@synthesize roots;
@synthesize editable;

- (NAElementOutlineController*)init
{
	self = [super init];
	if (self != nil) {
		roots = [[NSMutableArray alloc] init];
	}
	return self;
}

- (NAElementOutlineController*)initWithRoots:(NSMutableArray*)newRoots
{
	self = [self init];
	[self setRoots:newRoots];
	return self;
}

- (void)awakeFromNib
{
	roots = [[NSMutableArray alloc] init];
}
	
- (int)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item
{
	return (item == nil) ? [roots count] : [[item children] count];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
	return (item == nil) ? NO : [item hasChildren];
}

- (id)outlineView:(NSOutlineView *)outlineView child:(int)index ofItem:(id)item
{
	return (item == nil) ? [roots objectAtIndex:index] : [[item children] objectAtIndex:index];
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item
{
	return [item valueForKey:[tableColumn identifier]];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView shouldEditTableColumn:(NSTableColumn *)tableColumn item:(id)item
{
	if (editable) {
		if ([[tableColumn identifier] isEqualToString:@"name"]) {
			return true;
		}
		if ([[tableColumn identifier] isEqualToString:@"content"]) {
			return ![item hasChildren];
		}
	}
	return false;
}

- (void)outlineView:(NSOutlineView *)outlineView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn byItem:(id)item
{
	[item setValue:object forKey:[tableColumn identifier]];
}


- (BOOL)isEditable 
{
	return editable;
}

@end
