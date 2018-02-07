//: Playground - noun: a place where people can play

import UIKit

//func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
//    // тело функции…
//}

struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int){
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack<Element: Hashable> {
    var items = [Element]()
    mutating func push(_ item: Element){
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    func allStack() {
        print(items)
    }
}

var stackOfStrings = Stack<String>()

stackOfStrings.push("one")
stackOfStrings.push("two")
stackOfStrings.push("three")
stackOfStrings.push("four")
stackOfStrings.allStack()

stackOfStrings.pop()
stackOfStrings.allStack()



func transform(string: String) -> String {
    var outputString = "\u{2022} "
    outputString.append("string1 after marker")
    print(outputString)
    return outputString
}
