#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // this code would by itself throw an error - unrecognized selector.
    //id today = [[NSDate alloc] init];
    //[today uppercaseString];
    
    // slight difference from the movie - I'm declaring outside
    // the try/catch, so the variable will have wider scope and I
    // can release it later
    id today = [[NSDate alloc] init];
    
    // but in a try / catch, it's fine
    @try {
        [today uppercaseString];
    }
    @catch (NSException *exception) {
        NSLog(@"There was an error: %@", exception);
    }
    @finally {
        NSLog(@"I'm in the finally block");
        // and always release
        [today release];
    }
    
    [pool drain];
    return 0;
}

