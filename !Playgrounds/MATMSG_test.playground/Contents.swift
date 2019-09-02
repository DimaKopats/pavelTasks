//: Playground - noun: a place where people can play

import Foundation

var inputString = "MATMSG:TO:example@example.com;SUB:Subject;BODY:Body;;;;;\n"

if let toRange = inputString.range(of: "TO:"),
    let subRange = inputString.range(of: ";SUB:"),
    let bodyRange = inputString.range(of: ";BODY:"),
    let endRange = inputString.range(of: ";;\n"){

    let email = inputString[toRange.upperBound..<subRange.lowerBound]
    let subject = inputString[subRange.upperBound..<bodyRange.lowerBound]
    let body = inputString[bodyRange.upperBound..<endRange.lowerBound]
    
    print(email)
    print(subject)
    print(body)
}

print("---------")

//let outputArray = inputString.split(separator: ";").flatMap { subStr in
//    for item in subStr.split(separator: ":") {
//        print(item)
//        if !item.contains("MATMSG") &&
//            !item.contains("TO") &&
//            !item.contains("SUB") &&
//            !item.contains("BODY") {
//            return String(item)
//        }
//    }
//    return ""
//}
//print(outputArray)
