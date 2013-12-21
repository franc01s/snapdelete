#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    
    
    
    
    NSLog(@"Got to the end of the program!");
    
    [pool drain];
    return 0;
}

