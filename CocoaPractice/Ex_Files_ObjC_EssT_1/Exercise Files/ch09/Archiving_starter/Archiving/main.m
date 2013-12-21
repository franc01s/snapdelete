#import <Foundation/Foundation.h>
#import "Employee.h"

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    Employee *bob = [[Employee alloc] init];
    [bob setName:@"Bob Jones"];
    [bob setGrade:21];
    
    NSLog(@"Details are %@", [bob description]);

    [pool drain];
    return 0;
}

