//: Playground - noun: a place where people can play

import UIKit

//"1️⃣2️⃣3️⃣4️⃣5️⃣"


protocol testProtocol {
    func testFunc()
}

extension testProtocol {
    func testFunc() {
        print("testFunc")
    }
}

class classA: testProtocol {
    func testFunc() {
        print("my implementation")
    }
}

let objA = classA()
objA.testFunc()

