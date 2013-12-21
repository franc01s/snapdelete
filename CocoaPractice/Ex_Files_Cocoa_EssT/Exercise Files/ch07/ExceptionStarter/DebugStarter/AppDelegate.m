//
//  AppDelegate.m
//  DebugStarter
//
//  Created by Simon on 6/4/12.
//  Copyright (c) 2012 Simon. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize myLabel;

- (int) calculateFirstValue {
    
    return 10000;
}

- (int) calculateSecondValue {
    
	// imagine a lot of complex code here!
    
    int a = 0;
    int b = [self calculateFirstValue];
    
    for (int i = 0; i < 5000; i++) {
        b--;
    }
    
	return a;
}

- (IBAction)doSomething:(id)sender {
    
    int firstVal = [self calculateFirstValue];
	int secondVal = [self calculateSecondValue];
	
	int result = firstVal / secondVal;
	
	NSString *msg = [[NSString alloc] initWithFormat:@"The result is %d", result];
	
    [myLabel setStringValue:msg];
    
    NSArray *myArray = [NSArray arrayWithObjects:@"one",@"two",@"three",nil];
    NSString *thirdEntry = [myArray objectAtIndex:3];
    NSLog(@"The third object is %@", thirdEntry);
	
}
@end
