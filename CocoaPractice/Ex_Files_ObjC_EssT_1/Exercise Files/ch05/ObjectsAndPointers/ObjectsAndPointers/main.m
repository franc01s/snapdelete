//
//  main.m
//  ObjectsAndPointers
//
//  Created by Allardice on 3/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    NSString *message = @"Hello";

    [pool drain];
    return 0;
}

