//
//  AppDelegate.m
//  KVCBinding
//
//  Created by Simon on 6/3/12.
//  Copyright (c) 2012 Simon. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.singleBook = [[Book alloc] init];
    
    [self.singleBook setAuthor:@"Fred Smith"];
    [self.singleBook setTitle:@"On a Dark and Stormy Night"];
    [self.singleBook setPublishedDate:[NSDate dateWithString:@"2001-03-24 10:45:32 +0600"]];
    [self.singleBook setPageCount:315];
}


@end
