/*
 *  $Id: NAApiConnection.h 193 2009-01-06 14:38:24Z sunday $
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

@class NAElement;
@class NAServer;


/*!
 * @class NAApiConnection
 * An NAApiConnection object provides support to perform the loading
 * of an ONTAPI request.
 *
 * @namespace ManageONTAP
 */
@interface NAApiConnection : NSObject  <NSXMLParserDelegate>{
	NSURLConnection *urlConnection;
	NSMutableData* receivedData;
	id delegate;
	SEL delegateSelector;
	
	NAElement* root;
	NAElement* current;
	NSMutableArray* stack;
}

/*!
 * @abstract Invoke an ONTAPI request against a filer
 * Synchronously invoke an ONTAPI request and return the result.
 * @param request ONTAPI api request
 * @seealso initWithRequest:toServer:target:selector:
 */
+ (NAElement*)sendSynchronousRequest:(NAElement*)request toServer:(NAServer*)server;

/*!
 * @abstract Invoke an ONTAPI request against a filer
 * Asynchronously invoke an ONTAPI request or nil if the request could not be sent.
 * When the request is complete, the specified delegate and selector will
 * be invoked with the this object and the result.
 * @param aRequest ONTAPI api request
 * @param aServer ONTAPI server
 * @param aTarget object to be notified when the request completes
 * @param aSelector method on aTarget to be invoked when the request completes
 * method must be of the form ontapiRequestComplete:(NAApiConnection*)response
 */
- (id) initWithRequest:(NAElement*)aRequest
							toServer:(NAServer*)aServer 
							 target:(id)aTarget 
						   selector:(SEL)aSelector;
/*!
 * @abstract Retrieve the result of an ONTAPI request
 */
- (NAElement*)result;

/*!
 * @abstract Cancel an outstanding ONTAPI request. If invoked, the target will
 * receive no further messages from this request.
 */
- (void)cancel;

// Private NSURLConnection delegate messages
- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response;
- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data;
- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error;
- (void)connectionDidFinishLoading:(NSURLConnection*)connection;

// Private NSXMLParser delegate messages
- (void)parser:(NSXMLParser*)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;

- (void)parse:(NSData*)response;
- (void)setFailure:(int)err reason:(NSString*)reason;
@end
