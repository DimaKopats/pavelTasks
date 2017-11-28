//: Playground - noun: a place where people can play

import UIKit

//"1️⃣2️⃣3️⃣4️⃣5️⃣"



class Rectangle {
    
    var width: Float
    var height: Float
    init(width: Float, height: Float) {
        print("Rectangle - init(width: , height: )")
        self.width = width
        self.height = height
    }
    
    convenience init() {
        self.init(width: 5, height: 10)
        print("Rectangle - init")
    }
}

class Square : Rectangle {
    init(dimention: Float) {
        super.init(width: dimention, height: dimention)
        print("Square - init(dimention: )")
    }
}

let square = Square.init(dimention: 15)







//class Food {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//    convenience init() {
//        self.init(name: "[Unnamed]")
//    }
//}
//
//class RecipeIngredient: Food {
//    var quantity: Int
//    init(name: String, quantity: Int) {
//        self.quantity = quantity
//        super.init(name: name)
//    }
//    override convenience init(name: String) {
//        self.init(name: name, quantity: 1)
//    }
//}
//
//class ShoppingListItem: RecipeIngredient {
//    var purchased = false
//    var description: String {
//        var output = "\(quantity) x \(name) "
//        output += purchased ? "✔" : "✘"
//        return output
//    }
//}
//
//var breakfastList = [
//    ShoppingListItem(),
//    ShoppingListItem(name: "Bacon"),
//    ShoppingListItem(name: "Eggs", quantity: 6),
//]
//breakfastList[0].name = "Orange juice"
//breakfastList[0].purchased = true
//for item in breakfastList {
//    print(item.description)
//}
//// 1 x Orange juice
//// 1 x Bacon
//// 6 x Eggs
//
//
//
//

