//
//  CDBAppDelegate.m
//  NaviControllerTest
//
//  Created by Dzmitry Kopats on 6/14/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import "CDBAppDelegate.h"
#import "CDBViewController.h"

@implementation CDBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.vc1 = [[CDBViewController alloc] initWithMessage:@"Triangle" andImage:[UIImage imageNamed: @"triangle.png"]];
    self.vc1.title = @"Tri";
    
    self.vc2 = [[CDBViewController alloc] initWithMessage:@"Rectangle" andImage: [UIImage imageNamed: @"rect.png"]];
    self.vc2.title = @"Rec";
    self.vc2.tabBarItem.badgeValue = @"2";
    
    self.vc3 = [[CDBViewController alloc] initWithMessage:@"Ellipse" andImage: [UIImage imageNamed: @"ellipse.png"]];
    self.vc3.title = @"Elli";
    self.vc3.tabBarItem.badgeValue = @"3";
    self.vc3.tabBarItem.badgeColor = [UIColor blueColor];
    
    self.vc4 = [[CDBViewController alloc] initWithMessage:@"Rectangle+Ellipse" andImage: [UIImage imageNamed: @"R+E.png"]];
    self.vc4.title = @"R+E";
    
    self.vc5 = [[CDBViewController alloc] initWithMessage:@"Rectangle+Triangle" andImage:[UIImage imageNamed: @"R+T.png"]];
    self.vc5.title = @"R+T";
    
    self.vc6 = [[CDBViewController alloc] initWithMessage:@"Rectangle+Rectangle" andImage:[UIImage imageNamed: @"R+R.png"]];
    self.vc6.title = @"R+R";
    
    self.tabController = [[UITabBarController alloc] init];
    self.tabController.viewControllers =
    [NSArray arrayWithObjects: _vc1, _vc2, _vc3, _vc4, _vc4, _vc5, _vc6, nil];
    
    [self.window addSubview:_tabController.view];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = self.tabController;
    return YES;
}

@end
