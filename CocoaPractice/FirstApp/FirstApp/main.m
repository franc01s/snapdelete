//
//  main.m
//  FirstApp
//
//  Created by francois on 1/19/13.
//  Copyright (c) 2013 francois. All rights reserved.
//

#import <Foundation/Foundation.h>

void myFunction(NSString *foo){
    foo = @"efgh";
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *mystr = @"abcd";
        // insert code here...
        myFunction(mystr);
        NSLog(@"My String %@", mystr);
        
    }
    return 0;
}

