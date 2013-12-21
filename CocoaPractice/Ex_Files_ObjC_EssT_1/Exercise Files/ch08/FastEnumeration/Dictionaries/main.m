#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    // create a mutable dictionary
    NSMutableDictionary *states =
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"Arizona",@"AZ",
     @"California",@"CA",
     @"Colorado",@"CO",
     @"Hawaii",@"HI",
     @"New Mexico",@"NM",
     nil];
    // add to it
    [states setObject:@"Florida" forKey:@"FL"];
    
    NSString *someState = @"FL";
    
    NSLog(@"  %@ is for %@", someState, [states objectForKey:someState]);
    
    [pool drain];
    return 0;
}
