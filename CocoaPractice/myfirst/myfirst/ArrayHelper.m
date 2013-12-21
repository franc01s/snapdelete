//
//  ArrayHelper.m
//  myfirst
//
//  Created by francois on 3/5/13.
//  Copyright (c) 2013 francois. All rights reserved.
//

#import "ArrayHelper.h"
#import "Volumes.h"

@implementation ArrayHelper 



- (id)initWithData:(NSMutableArray*)newData
{
	self = [super init];
    if (self){
      
	_myarray = newData;
        
    }
	return self;
}

- (void)awakeFromNib
{
	_myarray = [[NSMutableArray alloc] init];
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView{
    
  //  NSLog(@"%@", self.myarray);
    return [[self myarray] count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex{
    
    if ([aTableColumn.identifier isEqualToString:@"name"]) {
        
        vol *vol = [[volClass alloc] init];
        vol = [self.myarray objectAtIndex:rowIndex];
        return [vol name];
        
    }
    
    if ([aTableColumn.identifier isEqualToString:@"size"]) {
        
        Volumeinfo *vol = [[Volumeinfo alloc] init];
        vol = [self.myarray objectAtIndex:rowIndex];
        return [vol size];
    }
    return nil;
}



@end
