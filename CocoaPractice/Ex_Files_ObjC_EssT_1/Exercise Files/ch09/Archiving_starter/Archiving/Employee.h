//
//  Employee.h
//  Archiving
//
//  Created by Simon Allardice on 2/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Employee : NSObject {
@private
    NSString *name;
    int grade;
}

@property (retain) NSString *name;
@property int grade;


@end
