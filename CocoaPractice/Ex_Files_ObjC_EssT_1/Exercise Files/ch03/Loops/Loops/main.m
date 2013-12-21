#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    
    int a = 1;
    
    while ( a < 10 ) {
        
        NSLog(@"The value of a is %i", a);
    }

    [pool drain];
    return 0;
}

