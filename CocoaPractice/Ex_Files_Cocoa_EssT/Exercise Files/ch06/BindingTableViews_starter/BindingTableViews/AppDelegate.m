//
//  AppDelegate.m
//  BindingTableViews
//
//  Created by Simon on 6/4/12.
//  Copyright (c) 2012 Simon. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (id) init {
    self = [super init];
    
    // create a mutable array to hold several Book objects
    self.allBooks = [[NSMutableArray alloc] init];
    
    Book *firstBook = [[Book alloc] init];
    // Objective-C setters
    [firstBook setAuthor:@"Fred Smith"];
    [firstBook setTitle:@"On a Dark and Stormy Night"];
    [firstBook setPageCount:315];
    
    [self.allBooks insertObject:firstBook atIndex:[self.allBooks count]];
    
    Book *secondBook = [[Book alloc] init];
    // dot-syntax
    secondBook.author = @"Jane Jones";
    secondBook.title = @"Under the Moonlight";
    secondBook.pageCount = 280;
    
    [self.allBooks insertObject:secondBook atIndex:[self.allBooks count]];
    
    return self;
}

- (IBAction)listBooks:(id)sender {
    for (Book *currentBook in self.allBooks) {
        NSLog(@"The book %@ by %@ has %i pages",
              currentBook.title,
              currentBook.author,
              currentBook.pageCount);
    }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    
}
@end
