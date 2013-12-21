//
//  AppDelegate.m
//  Assertions
//
//  Created by Simon on 6/4/12.
//  Copyright (c) 2012 Simon. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize myLabel;

- (int) complicatedCalculation {
    
    int foo = 10000;
    
    for (int i = 0; i < 5000; i++) {
        // complicated code here.
        foo--;
    }
    
    return foo;
}

- (IBAction)doSomething:(id)sender {
    
    int result = [self complicatedCalculation];
    
    NSString *message =
        [NSString stringWithFormat:@"The value is: %i",result];
    
    [myLabel setStringValue:message];
    
}
@end
