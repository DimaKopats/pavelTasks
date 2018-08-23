//
//  SpecialUIView.m
//  NavigationControllerTest
//
//  Created by Dzmitry Kopats on 6/15/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import "SpecialUIView.h"
#import "ViewController.h"

@implementation SpecialUIView

- (void)drawRect:(CGRect)rect {
    NSString *message = [NSString stringWithFormat: @"View for level: %@", [_myController title]];
    
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                     [UIFont systemFontOfSize:20], NSFontAttributeName,
                                     [NSNumber numberWithFloat:1.0], NSBaselineOffsetAttributeName,
                                     [UIColor greenColor], NSStrokeColorAttributeName,
                                     nil];
    
    [message drawAtPoint:CGPointMake(100, 100) withAttributes:attrsDictionary];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_myController showNextLevel];
}


@end
