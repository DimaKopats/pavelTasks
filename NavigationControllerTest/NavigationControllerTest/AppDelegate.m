//
//  AppDelegate.m
//  NavigationControllerTest
//
//  Created by Dzmitry Kopats on 6/15/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    _level1 = [[ViewController alloc] initWithNibName:nil bundle:nil];
    _level1.title = LEVEL1;
    _naviController = [[UINavigationController alloc]initWithRootViewController:_level1];
    [_window addSubview:_naviController.view];
    
    [_window makeKeyAndVisible];
    _window.rootViewController = _naviController;
    
    return YES;
}


- (void)showNextLevel:(NSString *)level {
    if ([level isEqualToString:LEVEL1]) {
        _level2 = [[ViewController alloc] initWithNibName:nil bundle:nil];
        _level2.title = LEVEL2;
        _level2.navigationItem.prompt = @"Prompt here";
        [_naviController pushViewController:_level2 animated:true];
    } else if ([level isEqualToString: LEVEL2]) {
        _level3 = [[ViewController alloc] initWithNibName:nil bundle:nil];
        _level3.title = LEVEL3;
        [_naviController pushViewController:_level3 animated:true];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
