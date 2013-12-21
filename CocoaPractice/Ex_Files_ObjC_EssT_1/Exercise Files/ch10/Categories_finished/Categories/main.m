#import <Foundation/Foundation.h>
#import "NSString+ConvertWhitespace.h"

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    NSString *sentence = @"The quick brown fox jumped over the lazy dog";
    
    NSLog(@"The sentence is %@", [sentence convertWhitespace]);

    [pool drain];
    return 0;
}

