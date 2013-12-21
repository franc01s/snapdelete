//
//  Employee.m
//  Archiving
//
//  Created by Simon Allardice on 2/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Employee.h"

@implementation Employee

@synthesize name, grade;

-(NSString *) description {
    NSString *desc = 
    [NSString stringWithFormat:@"Employee: %@, Grd: %i", name,grade]; 
    return desc;
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
