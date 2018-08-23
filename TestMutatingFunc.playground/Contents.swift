//: Playground - noun: a place where people can play

import UIKit

protocol protocol1 {
    func testFunc(inputString: String)
}

struct classA {
    var property1 = "prop1"
    
    mutating func func2(inputString: String) {
        property1 = inputString
    }
}

extension classA: protocol1 {
    
    func testFunc(inputString: String) {
        func2(inputString: inputString)
    }
    
    
}


