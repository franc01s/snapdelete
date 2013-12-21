/*
 *  $Id: NAServer.m 193 2009-01-06 14:38:24Z sunday $
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

#import "NAServer.h"
#import "NAElement.h"
#import "NAApiConnection.h"

static const char BASE64_TABLE[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

// Category on NSURLRequest to override the HTTPS checks
@interface NSURLRequest (NAServer)
+ (void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end

@interface NAServer (Private)
- (NSString*)httpAuthHeader;
- (NSURLRequest*)constructRequest:(NAElement*)request;
@end

@implementation NAServer

- (id) initWithServer:(NSString*)aServer majorVersion:(unsigned int)aMajorVersion minorVersion:(unsigned int)aMinorVersion
{
	self = [super init];
	if (self) {
		server = [aServer copy];
		majorVersion = aMajorVersion;
		minorVersion = aMinorVersion;
		port = 0;
		[self setUser:@"root" password:@""];
		[self setTransportType:NATransportHTTP];
		[self setServerType:NAServerFiler];
	}
	return self;
}

- (void)setServerType:(NAServerType)newServerType
{
	serverType = newServerType;
}

- (NAServerType)serverType
{
	return serverType;
}

- (void)setUser:(NSString*)aUser password:(NSString*)aPassword
{
	[user release];
	user = [aUser copy];
	
	[password release];
	password = [aPassword copy];
}

- (void)setTransportType:(NATransportType)newTransportType
{
	transportType = newTransportType;
}

- (NATransportType)transportType
{
	return transportType;
}

- (void)setPort:(unsigned int)newPort
{
	port = newPort;
}

- (unsigned int)port
{
	if (port != 0) {
		return port;
	}
	switch (serverType) {
		case NAServerFiler:
			switch (transportType) {
				case NATransportHTTP:
					return 80;
				case NATransportHTTPS:
					return 443;
			}
			break;
		case NAServerDFM:
			switch (transportType) {
				case NATransportHTTP:
					return 8081;
				case NATransportHTTPS:
					return 8488;
			}
			break;
		case NAServerAgent:
			return 4092;
	}
	return 0;
}

- (NSString*)baseURL
{
	switch (serverType) {
		case NAServerFiler:
			return @"/servlets/netapp.servlets.admin.XMLrequest_filer";
		case NAServerDFM:
		case NAServerAgent:
			return @"/apis/XMLrequest";
		default:
			return nil;
	}
}
			
- (NAElement*)invoke:(NAElement*)request
{
	return [NAApiConnection sendSynchronousRequest:request toServer:self];
}
	
- (NSString*)httpAuthHeader
{
	NSString* cookie = [NSString stringWithFormat:@"%@:%@", user ? user : @"", password ? password : @""];
	NSMutableString* output = [NSMutableString stringWithCapacity:(([cookie length] / 3) * 4) + 6];
	[output appendString:@"Basic "];
	
	const char* utf = [cookie UTF8String];
	const char *p = utf;
	while (*p) {
		char buf[5] = {'=', '=', '=', '=', 0};
		buf[0] = BASE64_TABLE[(*p >> 2) &  0x3f];
		// 110000 | 001111
		buf[1] = BASE64_TABLE[((*p << 4) & 0x30) | ((*++p >> 4) & 0x0f)];
		if (*p) {
			// 111100 | 000011
			buf[2] = BASE64_TABLE[((*p << 2) &0x3c) | ((*++p >> 6) & 0x03)];
		}
		if (*p) {
			buf[3] = BASE64_TABLE[(*p & 0x3f)];
		}
		[output appendFormat:@"%s", buf];
		p++;
	}
	return output;
}

- (NSURLRequest*)constructRequest:(NAElement*)request
{
	NSString *proto = nil;
	switch (transportType) {
		case NATransportHTTP:
			proto = @"http";
			break;
		case NATransportHTTPS:
			proto = @"https";
			[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:server];
			break;
		default:
			NSLog(@"Unknown transport type %d", transportType);
			return nil;
	}
	NSString *urlString = [NSString stringWithFormat:@"%@://%@:%d%@", 
						   proto,
						   server, 
						   [self port], 
						   [self baseURL]];
	NSURL *url = [NSURL URLWithString:urlString];
	NSLog(@"NAServer URL: %@", urlString);
	NSMutableURLRequest* urlRequest = [NSMutableURLRequest requestWithURL:url 
															  cachePolicy:NSURLRequestReloadIgnoringCacheData 
														  timeoutInterval:60.0];
	
	NSString* wrapped = [NSString stringWithFormat:@"<netapp version='%d.%d' xmlns='http://www.netapp.com/filer/admin'>%@</netapp>", 
						 majorVersion, minorVersion, [request toEncodedString]];
	
	NSData* payload = [wrapped dataUsingEncoding:NSUTF8StringEncoding];
	[urlRequest setHTTPMethod:@"POST"];
	[urlRequest setValue:[NSString stringWithFormat:@"%d", [payload length]] forHTTPHeaderField:@"Content-Length"];
	[urlRequest setValue:[self httpAuthHeader] forHTTPHeaderField:@"Authorization"];
	[urlRequest setHTTPBody:payload];

	return urlRequest;
}

- (void)dealloc
{
	[server release];
	[user release];
	[password release];
	[super dealloc];
}
@end
