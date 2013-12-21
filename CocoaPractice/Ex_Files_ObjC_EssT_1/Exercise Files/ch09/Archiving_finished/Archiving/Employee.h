#import <Foundation/Foundation.h>


@interface Employee : NSObject {
@private
    NSString *name;
    int grade;
}

@property (retain) NSString *name;
@property int grade;


@end
