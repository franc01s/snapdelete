#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    int foo;
    foo = 1000;
    

    [pool drain];
    return 0;
}

