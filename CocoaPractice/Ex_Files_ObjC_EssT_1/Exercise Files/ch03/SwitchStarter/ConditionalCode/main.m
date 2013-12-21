#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // create a variable
    int category = 47;
    
    //check it
    if (category == 40) 
    {
        // do one thing
    } else {
        if ( category == 41) {
            // do something else
        } else {
            if ( category == 42 ) {
                // do something else
            } else {
                // etc.
            }
        }
    }

    [pool drain];
    return 0;
}

