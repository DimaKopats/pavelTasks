//
//  CDBViewController.h
//  NaviControllerTest
//
//  Created by Dzmitry Kopats on 6/14/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDBViewController : UIViewController

@property (nonatomic, strong) NSString* message;

- (instancetype) initWithMessage: (NSString*) theMessage andImage: (UIImage*) image;

@end
