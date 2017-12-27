//: Playground - noun: a place where people can play

import UIKit

print(try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL)

