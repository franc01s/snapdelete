#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    for ( int i = 1 ; i < 10 ; i++ ) { 
        // all sorts of stuff
        int foo = 55;
        NSLog(@"The value of foo is %i", i);
    }
    

    [pool drain];
    return 0;
}
