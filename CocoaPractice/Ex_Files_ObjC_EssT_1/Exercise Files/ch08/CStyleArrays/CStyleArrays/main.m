#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    int multipleValues[5]; 
    multipleValues[0] = 50;
    multipleValues[1] = 90;

    
    [pool drain];
    return 0;
}

