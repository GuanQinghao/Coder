//
//  AppDelegate.m
//  Coder
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "AppDelegate.h"


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
