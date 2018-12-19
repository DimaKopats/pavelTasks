//: Playground - noun: a place where people can play

import UIKit

print(try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL)


let sign1 = NSNumber(booleanLiteral: true)
let sign2 = NSNumber(booleanLiteral: false)

