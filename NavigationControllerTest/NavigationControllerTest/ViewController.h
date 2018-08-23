//
//  ViewController.h
//  NavigationControllerTest
//
//  Created by Dzmitry Kopats on 6/15/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LEVEL1 @"Level I"
#define LEVEL2 @"Level II"
#define LEVEL3 @"Level III"

@interface ViewController : UIViewController

@property (copy) NSString* message;

- (void)showNextLevel;

@end

