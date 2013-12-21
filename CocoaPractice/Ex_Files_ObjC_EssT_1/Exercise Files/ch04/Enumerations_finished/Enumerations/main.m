#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    enum seatPreference { window = 99, aisle = 199, middle = 399  };
    
    enum seatPreference bobSeatPreference = aisle;
    enum seatPreference fredSeatPreference = window;
   // enum seatPreference joanSeatPreference = front;
    
    if (bobSeatPreference == window) {
        // do something
    }
    
    NSLog(@"Fred wants %i", fredSeatPreference);

    [pool drain];
    return 0;
}

