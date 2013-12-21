//
//  Book.m
//  BindingTableViews
//
//  Created by Simon on 6/4/12.
//  Copyright (c) 2012 Simon. All rights reserved.
//

#import "Book.h"

@implementation Book

-(id) init  {
    self = [super init];
    
    if (self) {
        self.author = @"author";
        self.title = @"title";
        self.pageCount = 0;
    }
    return self;
}

@end
