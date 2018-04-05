//
//  ViewController.m
//  KVO_objC_test
//
//  Created by Dzmitry Kopats on 3/19/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

#import "ViewController.h"

NSString *keyNumber = @"number";
NSString *keySumNumber = @"sumNumber";

@interface ViewController ()

@property NSInteger number;
@property NSInteger sumNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addObserver:self
           forKeyPath:keyNumber
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:nil];
    [self addObserver:self
           forKeyPath:keySumNumber
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:nil];
}


- (IBAction)incNumber:(id)sender {
    self.number += 1;
    self.sumNumber += self.number;
    //    NSLog(@"%ld", (long)self.number);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:keyNumber]) {
        id oldC = [change objectForKey:NSKeyValueChangeOldKey];
        id newC = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"number = %@ %@", oldC, newC);
        
        NSLog(@"count = %lu", (unsigned long)change.count);
        NSLog(@"%@", change);
    } else if ([keyPath isEqualToString:keySumNumber]) {
                id oldC1 = [change objectForKey:NSKeyValueChangeOldKey];
                id newC1 = [change objectForKey:NSKeyValueChangeNewKey];
                NSLog(@"sumNumber = %@ %@", oldC1, newC1);
        
        NSLog(@"count = %lu", (unsigned long)change.count);
        NSLog(@"%@", change);
    } else {
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
