#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    // create file URL - CHANGE PATH! Have a simple text file there!
    NSURL *fileURL = [NSURL fileURLWithPath:@"/Users/YOURPATHHERE/text.txt"];
    
    
    
    
    [pool drain];
    return 0;
}
