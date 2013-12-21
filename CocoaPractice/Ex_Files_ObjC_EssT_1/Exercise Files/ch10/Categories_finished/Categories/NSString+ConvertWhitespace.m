//
//  NSString+ConvertWhitespace.m
//  Categories
//
//  Created by Simon Allardice on 2/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+ConvertWhitespace.h"


@implementation NSString (NSString_ConvertWhitespace)

-(NSString *) convertWhitespace {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@"_"];
}

@end
