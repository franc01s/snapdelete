/*
 *  $Id: NAApiConnection.m 193 2009-01-06 14:38:24Z sunday $
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

#import "NAApiConnection.h"
#import "NAElement.h"
#import "NAServer.h"

@implementation NAApiConnection

+ (NAElement*)sendSynchronousRequest:(NAElement*)request toServer:(NAServer*)server
{
	NAApiConnection *parser = [[NAApiConnection alloc] init];
	NSURLRequest *urlRequest = [server constructRequest:request];
	NSError *error;
	NSData *response = [NSURLConnection sendSynchronousRequest:urlRequest 
											 returningResponse:nil 
														 error:&error];
	if (error) {
		if ([NSURLErrorDomain isEqual:[error domain]] && [error code] == -1012) {
			[parser setFailure:13002 reason:@"Authorization failed"];
		}
		else {
			[parser setFailure:13001 reason:[error localizedDescription]];
		}
	}
	else {
		[parser parse:response];
	}
	NAElement* result = [parser result];
	return result;
}

- (id) initWithRequest:(NAElement*)aRequest
							toServer:(NAServer*)aServer
							 target:(id)aTarget 
						   selector:(SEL)aSelector
{
	self = [super init];
	if (self) {
		delegate = aTarget;
		delegateSelector = aSelector;
		urlConnection = [[NSURLConnection alloc] initWithRequest:[aServer constructRequest:aRequest] 
														delegate:self];

	}
	return self;
}

- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response
{
	if ([response isKindOfClass:[NSHTTPURLResponse class]]
		&& [(NSHTTPURLResponse*)response statusCode] == 401) {
		[self setFailure:13002 reason:@"Authorization failed"];
		return;
	}
	if (!receivedData) {
		receivedData = [NSMutableData data];
	}
	[receivedData setLength:0];
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data
{
	[receivedData appendData:data];
}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
	[self setFailure:13001 reason:[error localizedDescription]];;
	receivedData = nil;
	
	[delegate performSelector:delegateSelector withObject:self];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection
{
	if (!root) {
		[self parse:receivedData];
	}
	;
	receivedData = nil;
	
	[delegate performSelector:delegateSelector withObject:self];
}

- (void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{	
	NAElement *element = [NAElement elementWithName:elementName];
	[element setAttributes:attributeDict];
	
	if (!root) {
		root = element;
	}
	[current addChild:element];
	[stack addObject:element];
	current = element;
}		

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	[stack removeLastObject];
	current = [stack lastObject];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if (string == nil) {
		return;
	}
	NSString *content = [current content];
	if (content) {
		content = [content stringByAppendingString:string];
	}
	else {
		content = string;
	}
	[current setContent:content];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError*)parserError
{
	NSLog(@"NAElementParser error at line %ld column %ld: %@",
		(long)[parser lineNumber],
		  (long)[parser columnNumber],
		  [parserError localizedDescription]);
	NSLog(@"Current element is: %@", [current description]);
}

- (NAElement*)result
{
	return root;
}

- (void)parse:(NSData*)response
{
	
	root = nil;
	current = nil;

	stack = [[NSMutableArray alloc] initWithCapacity:10];
	
	if (!response || [response length] == 0) {
		[self setFailure:13001 reason:@"No response recieved"];
		return;
	}
	
	NSXMLParser* parser = [[NSXMLParser alloc] initWithData:response];
	[parser setDelegate:self];

	if ([parser parse]) {
		if (root == nil) {
			[self setFailure:13001 reason:@"No elements in output"];
			return;
		}
		if (![[root name] isEqualToString:@"netapp"]) {
			[self setFailure:13001 reason:
					[NSString stringWithFormat:@"Expected <netapp> element, but got %@", [root name]]];
			return;
		}
		root = [root child:@"results"];
		if (root == nil) {
			[self setFailure:13001 reason:@"No results element in output"];
			return;
		}
	}
	else {
		[self setFailure:13001 reason:[[parser parserError] localizedDescription]];
		return;
	}
}

- (void)setFailure:(int)err reason:(NSString*)reason
{
	
	root = [[NAElement alloc] initWithName:@"results"];
	[root setAttributes:[NSDictionary dictionaryWithObjectsAndKeys:@"failed", @"status",
							 reason, @"reason",
							 [NSString stringWithFormat:@"%d", err], @"errno", nil]];
}

- (void)cancel
{
	[urlConnection cancel];
	urlConnection = nil;
}

@end
