/*
 *  $Id: NAElement.h 196 2009-01-06 15:52:46Z sunday $
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
 * Operations on ONTAPI elements
 * @copyright 2008 NetApp., Inc.
 */
#import <Foundation/Foundation.h>

/*!
 * @class NAElement
 * @abstract Class encapsulating NetApp XML request elements
 * An NAElement encapsulates one level of an XML element.
 * Elements can be arbitrarily nested. They have names
 * corresponding to XML tags, values (always strings) and
 * possibly children corresponding to nested tagged items. See NAServer
 * for instructions on using NAElements to invoke ONTAPI API calls.
 */
@interface NAElement : NSObject {
	NSString *name;
	NSString *content;
	
	NSMutableArray *children;
	NSMutableDictionary *attributes;
}

/*!
 * @abstract Returns an element with the given name
 * @param aName XML name of the new element
 * @return  an NAElement object with the given name
 * @seealso initWithName: - initWithName:
 */
+ (NAElement*)elementWithName:(NSString*)aName;

/*!
 * @abstract Returns an element with the given name and content
 * @param aName XML name of the new element
 * @param aContent content of the new element
 * @return  an NAElement object with the given name and content
 * @seealso initWithName:content: - initWithName:content:
 */
+ (NAElement*)elementWithName:(NSString*)aName content:(NSString*)aContent;

/*!
 * @abstract Returns an element with the given name and children
 * @param aName XML name of the new element
 * @param firstChild A comma separated list of NAElement children ending with nil
 * @return an NAElement object with the given name and children
 */
+ (NAElement*) elementWithName:(NSString*)aName children:(NAElement*)firstChild, ...;

/*!
 * @abstract Returns an initialized element with the given name
 * @param aName XML name of the new element
 * @return  an initialized NAElement object with the given name
 * @seealso elementWithName: - elementWithName:
 */
- (id)initWithName:(NSString*)aName;

/*!
 * @abstract Returns an initialized element with the given name and content
 * @param aName XML name of the new element
 * @param aContent content of the new element
 * @return  an initialized NAElement object with the given name and content
 * @seealso initWithName:content: - initWithName:Content
 */
- (id)initWithName:(NSString*)aName content:(NSString*)aContent;

- (void)setName:(NSString*)aName;
/*!
 * @abstract Returns the XML name of this element
 * @return XML name of this element
 */
- (NSString*)name;

/*!
 * @abstract Add a child to the end of this element's children
 * @param aChild child to add to this element
 */
- (void)addChild:(NAElement*)aChild;

- (void)removeChild:(NAElement*)aChild;

/*!
 * @abstract Add a new child to the end of this element's children.
 * This is equivilent to [[element addChild [NAElement elementWithName:aName content:aContent]]
 * @param aName XML name of the new element
 * @param aContent content of the new element
 */
- (void)addChildWithName:(NSString*)aName content:(NSString*)aContent;

/*!
 * @abstract Returns if this element has children or not
 * @return YES if this element has children, no if not
 */
- (BOOL)hasChildren;

/*!
 * @abstract Returns success or failure of an API call.
 * This method is only valid on the root node returned by a call
 * to - [NAServer invoke:] or - [NAServer invoke:andNotify:withSelector:].
 * The result on any other element is undefined.
 * @return YES if the ONTAPI invocation was successful, NO otherwiese
 */
- (BOOL)resultsPassed;

/*!
 * @abstract Returns a human-readable string describing a failure
 * Only present if @link resultsPassed - resultsPassed @/link returns NO
 * @return human-readable string describing API invocation failure
 */
- (NSString*)resultsReason;

/*!
 * @abstract Returns the error number for an API call failure
 * @return ONTAPI-defined error number or 0 on success
 */
- (int)resultsErrno;

/*!
 * @abstract Returns a named child of an element
 * Elements can be nested arbitrarily, so the element returned could also 
 * have children. If more than one child exists with the name aName, only one
 * will be returned.
 * @return a child element of this element with the name aName, or nil if no
 * such child exists.
 */
- (NAElement*)child:(NSString*)aName;

/*!
 * @abstract Returns all children of this element
 * @return an NSArray of NAElements with the children of this element
 */
- (NSArray*)children;

/*!
 * @abstract Returns a string of this element and all its children
 * @return formatted XML representation of element
 */
- (NSString*)description;

- (NSString*)toEncodedString;
- (void)setContent:(NSString*)newContent;
- (NSString*)content;
- (void)setAttributes:(NSDictionary*)newAttributes;
- (NSDictionary*)attributes;
- (void)appendContent:(NSMutableString*)output indent:(NSString*)indent;
- (void)dealloc;
@end
