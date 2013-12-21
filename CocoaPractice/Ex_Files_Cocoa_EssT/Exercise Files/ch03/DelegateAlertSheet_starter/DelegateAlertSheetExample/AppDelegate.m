#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)createAlertSheet:(id)sender {
    // Create NSAlert object
    NSAlert *myAlert = [NSAlert alertWithMessageText:@"Alert Message"
                                       defaultButton:@"OK"
                                     alternateButton:@"Alernate"
                                         otherButton:@"Other"
                           informativeTextWithFormat:@"Informative text"];
    
    // show it as a sheet - this will immediately return
    [myAlert beginSheetModalForWindow:_window
                        modalDelegate:nil
                       didEndSelector:nil
                          contextInfo:nil];
    
    [_window setBackgroundColor:[NSColor purpleColor]];
    
}
@end
