//
//  AppDelegate.h
//  NavigationControllerTest
//
//  Created by Dzmitry Kopats on 6/15/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *level1, *level2, *level3;
@property (strong, nonatomic) UINavigationController *naviController;

- (void)showNextLevel:(NSString *)level;

@end

