//
//  AppDelegate.m
//  SeedCoder
//
//  Created by Hao on 2020/12/14.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

/// 关闭窗口，直接退出程序
/// @param sender N/A
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    
    return YES;
}

@end
