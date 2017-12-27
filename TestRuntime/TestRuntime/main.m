//
//  main.m
//  TestRuntime
//
//  Created by Dzmitry Kopats on 12/22/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "Human.h"


void printAllMethodClass(Class clazz) {
    unsigned int count;
    Method *methods = class_copyMethodList(clazz, &count);
    for (int i = 0; i < count; i++) {
        Method method = methods[i];
        SEL sel = method_getName(method);
        NSLog(@"%@", NSStringFromSelector(sel));
    }
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
        printAllMethodClass([Human class]);
    }
}
