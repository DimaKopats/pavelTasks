//
//  ViewController.m
//  NavigationControllerTest
//
//  Created by Dzmitry Kopats on 6/15/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import "ViewController.h"
#import "SpecialUIView.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rectFrame = [[UIScreen mainScreen]bounds];
    SpecialUIView *theView = [[SpecialUIView alloc] initWithFrame:rectFrame];
    theView.backgroundColor = [UIColor grayColor];
    theView.myController = self;
    theView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view = theView;
}

- (void)showNextLevel {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate showNextLevel: self.title];
}


@end
