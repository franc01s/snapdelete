/*
 *  $Id: NAServer.h 193 2009-01-06 14:38:24Z sunday $
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

/*!
 * @header
 *
 * Client-side interface to ONTAPI APIs
 * @copyright 2008 NetApp., Inc.
 */
 
#import <Foundation/Foundation.h>

typedef enum {
	NAServerFiler = 0,
	NAServerDFM = 1,
	NAServerAgent = 2
} NAServerType;

typedef enum {
	NATransportHTTP = 0,
	NATransportHTTPS = 1
} NATransportType;

@class NAElement;

/*!
 * @class NAServer
 * @abstract Class for managing NetApp(r) filers using ONTAPI(tm) APIs.
 * @discussion An NAServer encapsulates an administrative connection to
 * a NetApp filer running ONTAP 6.4 or later.
 *
 * @namespace ManageONTAP
 */
@interface NAServer : NSObject {
	NATransportType transportType;
	NAServerType serverType;
	NSString *server;
	unsigned int majorVersion;
	unsigned int minorVersion;
	NSString *user;
	NSString *password;
	unsigned int port;
}

/*!
 * @abstract Initialize a new NAServer for the specified host
 * Create a new connection to a filer. Before use, you need to set the username
 * and pasword with @link setUser:password: - setUser:password: @/link.
 * @param server Hostname or IP address of the filer to connect to
 * @param majorVersion Minimum major ONTAPI version filer must understand
 * @param minorVersion Minimum minor ONTAPI version filer must understand
 */
- (id)initWithServer:(NSString*)server majorVersion:(unsigned int) majorVersion minorVersion:(unsigned int) minorVersion;

- (void)setServerType:(NAServerType)newType;

- (NAServerType)serverType;

/*!
 * @abstract Set the admin username and password
 * @param user username for the filer
 * @param password password for the filer
 */
- (void)setUser:(NSString*)user password:(NSString*)password;

/*!
 * @abstract Set the transport to use to the filer. 
 * @param newTransportType transport type for any subsequent connections.
 * Supported transports are "HTTP" or "HTTPS". The default is HTTP.
 * @seealso transportType - transportType
 */
- (void)setTransportType:(NATransportType)newTransportType;

/*!
 * @abstract Retrieve the currently set transport type
 * @seealso setTransportType: - setTransportType:
 */
- (NATransportType)transportType;

- (void)setPort:(unsigned int)port;

- (unsigned int)port;

/*!
 * @abstract Invoke an ONTAPI request against a filer
 * Synchronously invoke an ONTAPI request and return the result.
 * @param request ONTAPI api request
 */
- (NAElement*)invoke:(NAElement*)request;

- (NSURLRequest*)constructRequest:(NAElement*)request;
//- (NSURLConnection*)invoke:(NAElement*)request andNotify:(id)aDelegate withSelector:(SEL)aSelector;

@end
