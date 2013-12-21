#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // this code will throw an error - unrecognized selector.
    id today = [[NSDate alloc] init];
    [today uppercaseString];
    

    [pool drain];
    return 0;
}

