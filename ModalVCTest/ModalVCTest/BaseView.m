//
//  BaseView.m
//  ModalVCTest
//
//  Created by Dzmitry Kopats on 6/15/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (void)drawRect:(CGRect)rect {
    NSString *message = [NSString stringWithFormat: @"BaseViewController"];
    
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                     [UIFont systemFontOfSize:20], NSFontAttributeName,
                                     [NSNumber numberWithFloat:1.0], NSBaselineOffsetAttributeName,
                                     [UIColor greenColor], NSStrokeColorAttributeName,
                                     nil];
    
    [message drawAtPoint:CGPointMake(100, 100) withAttributes:attrsDictionary];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_myController showModalVC];
}

@end
