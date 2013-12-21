#import <Foundation/Foundation.h>
#import "First.h"
#import "Second.h"
#import "Third.h"
int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    
    First  *f = [[First alloc] init];
    Second *s = [[Second alloc] init];
    Third  *t = [[Third alloc] init];
    
    [f release];
    [s release];
    [t release];
    
    [pool drain];
    return 0;
}

