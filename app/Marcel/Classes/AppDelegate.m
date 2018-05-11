//  Copyright (c) 2014-present Ryan Gomba. All rights reserved.

#import "AppDelegate.h"

#import "IntroViewController.h"

#import "SoundManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [SoundManager configureAudioSession];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    IntroViewController *vc = [[IntroViewController alloc] init];
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    //
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    //
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    //
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    //
}

- (void)applicationWillTerminate:(UIApplication *)application {
    //
}

@end
