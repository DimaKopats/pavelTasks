//: Playground - noun: a place where people can play

import UIKit

//"1️⃣2️⃣3️⃣4️⃣5️⃣"

class TestSwizzling : NSObject {
    @objc dynamic func methodOne() {
        print("methodOne")
    }
}

extension TestSwizzling {
    
    //In Objective-C you'd perform the swizzling in load(),
    //but this method is not permitted in Swift
    func initialize1() {
        let i: () -> () = {
            let originalSelector = #selector(TestSwizzling.methodOne)
            let swizzledSelector = #selector(TestSwizzling.methodTwo)
            let originalMethod = class_getInstanceMethod(TestSwizzling.self, originalSelector);
            let swizzledMethod = class_getInstanceMethod(TestSwizzling.self, swizzledSelector)
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
            print("swizzled ok")
            
        }
        i()
    }
    
    @objc func methodTwo() {
        // It will not be a recursive call anymore after the swizzling
        print("methodTwo")
    }
}

var c = TestSwizzling()
c.initialize1()
print(c.methodOne())
print(c.methodTwo())

