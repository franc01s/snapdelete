#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    //
    
    for ( int i = 1 ; i < 5000 ; i++ ) { 
        if (i % 5 == 0) {
            continue;  // jump back to the top.
        }
        NSLog(@"The value of the index is %i", i);
    }

    [pool drain];
    return 0;
}

