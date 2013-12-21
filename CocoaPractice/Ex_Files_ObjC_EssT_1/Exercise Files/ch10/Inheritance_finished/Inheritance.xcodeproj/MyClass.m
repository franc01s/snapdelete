//
//  MyClass.m
//  Inheritance
//
//  Created by Simon Allardice on 2/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyClass.h"


@implementation MyClass

-(NSString *) description {
    return @"Interesting message";
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

@end
