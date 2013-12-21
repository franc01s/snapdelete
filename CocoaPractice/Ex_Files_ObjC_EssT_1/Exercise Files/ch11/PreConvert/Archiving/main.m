#import <Foundation/Foundation.h>
#import "Employee.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    Employee *bob = [[Employee alloc] init];
    [bob setName:@"Bob Jones"];
    [bob setGrade:21];
    
    NSLog(@"Details are %@", bob);
    
// ***** change the path to point to your own directory! *****
    [NSKeyedArchiver archiveRootObject:bob toFile:@"/Users/YOURDIRECTORY/bob.plist"];
    
// ***** change the path to point to your own directory! *****
    Employee *fred = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/YOURDIRECTORY/bob.plist"];
    NSLog(@"The new object is %@",fred);
    
    [bob release];

    [pool drain];
    return 0;
}

