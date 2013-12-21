/*
 *  $Id: NAElement.m 196 2009-01-06 15:52:46Z sunday $
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

#import "NAElement.h"


@implementation NAElement

+ (NAElement*)elementWithName:(NSString*)aName
{
	return [[[NAElement alloc] initWithName:aName content:nil] autorelease];
}

+ (NAElement*) elementWithName:(NSString*)aName content:(NSString*)aContent
{
	return [[[NAElement alloc] initWithName:aName content:aContent] autorelease];
}

+ (NAElement*) elementWithName:(NSString*)aName children:(NAElement*)firstChild, ...
{
	NAElement *elem = [[[NAElement alloc] initWithName:aName content:nil] autorelease];
	if (firstChild != nil) {
		id child;
		va_list argumentList;
		[elem addChild:firstChild];
		va_start(argumentList, firstChild);
		while (child = va_arg(argumentList, id)) {
			[elem addChild:child];
		}
		va_end(argumentList);
	}
	return elem;
}

- (id)initWithName:(NSString*)aName
{
	return [self initWithName:aName content:nil];
}

- (id)initWithName:(NSString*)aName content:(NSString*)aContent
{
	self = [super init];
	if (self) {
		[self setName:aName];
		[self setContent:aContent];
	}
	return self;
}

- (void)setName:(NSString*)newName
{
	[name release];
	name = [newName copy];
}

- (NSString*)name
{
	return name;
}

- (void)setContent:(NSString*)newContent
{
	[content release];
	content = [newContent copy];
}

- (NSString*)content
{
	return content;
}

- (void)setAttributes:(NSDictionary*)newAttributes
{
	[attributes release];
	attributes = [newAttributes copy];
}

- (NSDictionary*)attributes {
	return [[attributes copy] autorelease];
}

- (void)addChild:(NAElement*)aChild
{
	if (!children) {
		children = [[NSMutableArray alloc] init];
	}
	[children addObject:aChild];
}

- (void)removeChild:(NAElement*)aChild
{
	[children removeObject:aChild];
}

- (void)addChildWithName:(NSString*)aName content:(NSString*)aContent
{
	NAElement* elem = [NAElement elementWithName:aName content:aContent];
	[self addChild:elem];
}

- (BOOL)hasChildren
{
	return ((children != nil) && ([children count] > 0));
}

- (BOOL)resultsPassed
{
	id statAttr = [attributes objectForKey:@"status"];
	return (statAttr != nil) && ([statAttr caseInsensitiveCompare:@"passed"] == NSOrderedSame);
}

- (NSString*)resultsReason
{
	if ([self resultsPassed]) {
		return nil;
	}
	NSString* reason = [attributes objectForKey:@"reason"];
	return (reason != nil) ? reason : @"No reason given";
}

- (int)resultsErrno
{
	if ([self resultsPassed]) {
		return 0;
	}
	NSString* err = [attributes objectForKey:@"errno"];
	return (err != nil) ? [err intValue] : -1;
}

- (NAElement*)child:(NSString*)aName
{
	NSEnumerator* enumerator = [children objectEnumerator];
	id child;
	while (child = [enumerator nextObject]) {
		if ([[child name] isEqualToString:aName]) {
			return (NAElement*)child;
		}
	}
	return nil;
}

- (NSArray*)children
{
	return children;
}

- (NSString*)toEncodedString
{
	NSMutableString* output = [NSMutableString stringWithCapacity:200];
	[self appendContent:output indent:nil];
	return output;
}

- (NSString*)description
{
	NSMutableString* output = [NSMutableString stringWithCapacity:200];
	[self appendContent:output indent:@""];
	return output;
}

// Internal implementation for -toEncodedString and -description
- (void)appendContent:(NSMutableString*)output indent:(NSString*)indent
{
	if (indent != nil) {
		[output appendString:indent];
	}
	[output appendFormat:@"<%@", name];
	if (attributes) {
		NSEnumerator* enumerator = [attributes keyEnumerator];
		id key;
		while (key = [enumerator nextObject]) {
			[output appendFormat:@" %@=\"%@\"", key, [attributes objectForKey:key]];
		}
	}
	[output appendString:@">"];
	
	if (children) {
		if (indent != nil) {
			[output appendString:@"\n"];
		}
		NSEnumerator* enumerator = [children objectEnumerator];
		id child;
		while (child = [enumerator nextObject]) {
			[child appendContent:output indent:[indent stringByAppendingString:@"    "]];
		}
	}
	
	if (content) {
		NSMutableString* escaped = [[content mutableCopy] autorelease];
		[escaped replaceOccurrencesOfString:@"&" withString:@"&amp;" 
									options:0 range:NSMakeRange(0, [escaped length])];
		[escaped replaceOccurrencesOfString:@"<" withString:@"&lt;" 
									options:0 range:NSMakeRange(0, [escaped length])];
		[escaped replaceOccurrencesOfString:@">" withString:@"&gt;" 
									options:0 range:NSMakeRange(0, [escaped length])];
		[escaped replaceOccurrencesOfString:@"'" withString:@"&apos;" 
									options:0 range:NSMakeRange(0, [escaped length])];
		[escaped replaceOccurrencesOfString:@"\"" withString:@"&quot;" 
									options:0 range:NSMakeRange(0, [escaped length])];
		[output appendString:escaped];
	}
	if (children && indent) {
		[output appendString:indent];
	}
	[output appendFormat:@"</%@>", name];
	if (indent) {
		[output appendString:@"\n"];
	}
}

- (void)dealloc
{
	[name release];
	[content release];
	[children release];
	[attributes release];
	[super dealloc];
}

@end
