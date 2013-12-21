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
                                     alternateButton:@"Alternate"
                                         otherButton:@"Other"
                           informativeTextWithFormat:@"Informative text"];
    
    // show it as a sheet - this will immediately return
    [myAlert beginSheetModalForWindow:_window
                        modalDelegate:self
                       didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:)
                          contextInfo:nil];
    
    // to prove that we continue on the main thread
    [_window setBackgroundColor:[NSColor purpleColor]];
    
}

- (void) alertDidEnd:(NSAlert *)alert returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo {
    NSLog(@"The return code was %li", returnCode);
}

@end
