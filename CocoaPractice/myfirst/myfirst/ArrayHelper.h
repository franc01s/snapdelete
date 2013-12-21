//
//  ArrayHelper.h
//  myfirst
//
//  Created by francois on 3/5/13.
//  Copyright (c) 2013 francois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ManageONTAP/ManageONTAP.h>



@interface ArrayHelper : NSObject <NSTableViewDataSource>

- (void)awakeFromNib;

- (id) initWithData:(NSMutableArray*)newData;

@property (strong) NSMutableArray *myarray;

@end
