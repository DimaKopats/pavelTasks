//
//  SecondaryViewController.m
//  ModalVCTest
//
//  Created by Dzmitry Kopats on 6/15/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import "SecondaryViewController.h"

@interface SecondaryViewController ()

@end

@implementation SecondaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil parent:(BaseVCViewController *)parent {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"dismiss"
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:parent
                                                                  action:@selector(dismissModalVC)];
    self.navigationItem.rightBarButtonItem = rightButton;
    return self;
}

@end
