//
//  CDBAppDelegate.h
//  NaviControllerTest
//
//  Created by Dzmitry Kopats on 6/14/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CDBViewController;

@interface CDBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property CDBViewController *vc1, *vc2, *vc3, *vc4, *vc5, *vc6;
@property UITabBarController* tabController;

@end
