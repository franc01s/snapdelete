//
//  AppDelegate.h
//  BindingTableViews
//
//  Created by Simon on 6/4/12.
//  Copyright (c) 2012 Simon. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Book.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (strong) NSMutableArray *allBooks;

- (IBAction)listBooks:(id)sender;

@end
