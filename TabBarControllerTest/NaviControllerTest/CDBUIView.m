//
//  CDBUIView.m
//  NaviControllerTest
//
//  Created by Dzmitry Kopats on 6/14/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import "CDBUIView.h"

@implementation CDBUIView

- (void)drawRect:(CGRect)rect {
    UIFont *font = [UIFont systemFontOfSize:20];
    
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                     font, NSFontAttributeName,
                                     [NSNumber numberWithFloat:1.0], NSBaselineOffsetAttributeName,
                                     [UIColor greenColor], NSStrokeColorAttributeName,
                                     nil];
    
    [[_myController message] drawAtPoint:CGPointMake(120, 130) withAttributes: attrsDictionary];
}

@end
