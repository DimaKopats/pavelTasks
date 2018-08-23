//
//  BaseVCViewController.m
//  ModalVCTest
//
//  Created by Dzmitry Kopats on 6/15/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import "BaseVCViewController.h"
#import "SecondaryViewController.h"
#import "BaseView.h"

@interface BaseVCViewController ()

@end

@implementation BaseVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = [[UIScreen mainScreen] bounds];
    BaseView *theView = [[BaseView alloc] initWithFrame: rect];
    theView.backgroundColor = [UIColor grayColor];
    theView.myController = self;
    self.view = theView;
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"ModalVC"
//                                                                              style:UIBarButtonItemStyleDone
//                                                                             target:self
//                                                                             action:@selector(showModalVC)];
}

- (void)showModalVC {
    SecondaryViewController *secondaryVC = [[SecondaryViewController alloc]initWithNibName:nil bundle:nil parent:self];
    UINavigationController *secondaryNavi = [[UINavigationController alloc] initWithRootViewController:secondaryVC];
    [self presentModalViewController:secondaryNavi animated:true];
}

- (void) dismissModalVC {
    [self dismissModalViewControllerAnimated:true];
}

@end
