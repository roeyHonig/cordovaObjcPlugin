/********* ObjcPlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface ObjcPlugin : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@end

@implementation ObjcPlugin

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    
    NSLog(@"hello, this time from native");
    CDVPluginResult* pluginResult = nil;
    NSArray* echo = [command.arguments objectAtIndex:0];
    NSLog(@"Here is the argument that was recived: %@", echo[0]);
    
    if (echo != nil && [echo[0] length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
}

@end
