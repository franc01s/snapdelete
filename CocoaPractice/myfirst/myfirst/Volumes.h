//
//  Volumes.h
//  myfirst
//
//  Created by francois on 3/24/13.
//  Copyright (c) 2013 francois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ManageONTAP/ManageONTAP.h>

@interface Volumeinfo : NSObject
    

@property (weak) NSString  *name;
@property (weak) NSString  *staTe;
@property  NSInteger sizetotal;
@property  NSInteger sizeused;


@end

@interface Volumeslistinfo : NSObject

@property (strong) NSMutableArray *volumeslist;

- (id) initWithElement:(NAElement*)newData;

@end
