//
//  AppDelegate.m
//  SandboxExample
//
//  Created by Simon on 6/5/12.
//  Copyright (c) 2012 Simon. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize myWebView;

-(void) awakeFromNib {
    NSURLRequest *firstRequest =
    [NSURLRequest requestWithURL:[NSURL URLWithString: @"http://www.lynda.com"]];
    
    [self.myWebView.mainFrame loadRequest:firstRequest];
}

@end
