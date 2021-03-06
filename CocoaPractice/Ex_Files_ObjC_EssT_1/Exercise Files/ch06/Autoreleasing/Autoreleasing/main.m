#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // let's get some objects!
    NSString *message = @"Hello";
    NSString *nextMessage = 
        [NSString stringWithFormat:@"The word is: %@",message];
    NSString *anotherMessage = 
        [[NSString alloc] initWithFormat:@"The word is: %@",message];
    
    NSDate *myDate = [NSDate date];
    NSDate *nextDate = [NSDate dateWithTimeIntervalSince1970:23234544];
    NSDate *anotherDate = [myDate copy];
    
    NSLog(@"The results are %@, %@, %@, %@, %@, %@", 
          message, nextMessage, anotherMessage,
          myDate, nextDate, anotherDate);
    
    [pool drain];
    return 0;
}

