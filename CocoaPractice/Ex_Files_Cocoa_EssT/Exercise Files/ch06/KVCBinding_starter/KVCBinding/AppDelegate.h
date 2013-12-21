//
//  AppDelegate.h
//  KVCBinding
//
//  Created by Simon on 6/3/12.
//  Copyright (c) 2012 Simon. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Book.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (strong) Book *singleBook;

@end
