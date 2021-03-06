//
//  AppDelegate.m
//  UsingFormatter
//
//  Created by Simon on 6/1/12.
//  Copyright (c) 2012 Simon. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize myDateField;
@synthesize numberLabel;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // This is the data I want in the UI elements
    
    NSDate *today = [NSDate date];
    float foo = 1234.56;
    
    // Method one (not recommended): convert to strings
    
    NSString *dateString = [today description];
    [myDateField setStringValue:dateString];
    
    NSString *floatString = [NSString stringWithFormat:@"%f",foo];
    [numberLabel setStringValue:floatString];
    
   
}

@end
