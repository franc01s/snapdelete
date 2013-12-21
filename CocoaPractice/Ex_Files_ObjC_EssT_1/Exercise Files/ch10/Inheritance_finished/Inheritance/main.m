#import <Foundation/Foundation.h>
#import "MyClass.h"
int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    MyClass *newObject = [[MyClass alloc] init];
    
    NSLog(@"The description is %@", newObject);

    [pool drain];
    return 0;
}

