//: Playground - noun: a place where people can play

import UIKit

//"1️⃣2️⃣3️⃣4️⃣5️⃣"

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
let roomCount = john.residence?.numberOfRooms
