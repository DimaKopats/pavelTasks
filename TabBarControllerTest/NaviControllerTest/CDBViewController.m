//
//  CDBViewController.m
//  NaviControllerTest
//
//  Created by Dzmitry Kopats on 6/14/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import "CDBViewController.h"
#import "CDBUIView.h"

@interface CDBViewController ()

@end

@implementation CDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rectFrame = [UIScreen mainScreen].bounds;
    CDBUIView* theView = [[CDBUIView alloc] initWithFrame:rectFrame];
    theView.backgroundColor = [UIColor greenColor];
    theView.myController = self;
    theView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view = theView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithMessage:(NSString *)theMessage andImage:(UIImage *)image {
    if (self = [super initWithNibName: nil bundle: nil]) {
        self.message = theMessage;
        self.tabBarItem.image = image;
    }
    return self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
