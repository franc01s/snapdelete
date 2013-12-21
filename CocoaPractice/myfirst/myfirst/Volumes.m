//
//  Volumes.m
//  myfirst
//
//  Created by francois on 3/24/13.
//  Copyright (c) 2013 francois. All rights reserved.
//

#import "Volumes.h"
#import <ManageONTAP/ManageONTAP.h>

@implementation Volumeinfo

@end

@implementation Volumeslistinfo{
    Volumeinfo *volumeinfo;

}

- (id) initWithElement:(NAElement*)newData{
    self = [self init];
    if (self){
        
        _volumeslist = [[NSMutableArray alloc]init];
        NSMutableArray *arraytemp = [[newData children]mutableCopy];
        NAElement *natemp = [arraytemp objectAtIndex:0];
        arraytemp = [[natemp children]mutableCopy];
 
        
        for (NAElement *elem in arraytemp){
            
            volumeinfo = [[Volumeinfo alloc]init];
            NSMutableArray *arrayprops = [[elem children]mutableCopy];
            
            
            for (NAElement *elemprop in arrayprops){
                if ([[elemprop name] isEqual: @"name"]){
                    
                   volumeinfo.name = [elemprop content];
                    
                }
                
                if ([[elemprop name] isEqual: @"size-total"]){
                    
                    volumeinfo.sizetotal = [[elemprop content]integerValue];
                }
                

                if ([[elemprop name] isEqual: @"size-used"]){
                    
                    volumeinfo.sizeused = [[elemprop content]integerValue];
                }
                
                if ([[elemprop name] isEqual: @"state"]){
                    
                    volumeinfo.staTe = [elemprop content];
                    
                }

                
        }
        if (volumeinfo !=nil){
          [_volumeslist addObject:volumeinfo];
        }
    }
}
return self;

}
@end

