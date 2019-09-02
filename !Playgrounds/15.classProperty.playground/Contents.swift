import Foundation
import UIKit

class Human {
    static let maxAge = 100
    
    var name: String
    var age: Int {
        didSet {
            if age > Human.maxAge {
                age = oldValue
            }
        }
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

struct Cat {
    static let maxAge = 20
    static var totalCats = 0
    
    var name: String
    var age: Int {
        didSet {
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        Cat.totalCats = Cat.totalCats + 1
    }
}

let human = Human(name: "Peter", age: 20)
var cat = Cat(name: "Whiten", age: 10)

human.age = 1000
cat.age = 50

Cat.totalCats

var cat2 = Cat(name: "Johny", age: 1)
Cat.totalCats


