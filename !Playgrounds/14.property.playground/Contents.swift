import Foundation


let str = ""
Int(str)


//struct Student {
//    var firstName: String {
//        willSet {
//            print("will set\t" + newValue + " instead of " + firstName)
//        }
//        didSet {
//            firstName = firstName.localizedCapitalized
//            print("did set\t" + firstName + " instead of " + oldValue)
//        }
//    }
//
//    var lastName: String {
//
//        didSet {
//            lastName = lastName.localizedCapitalized
//        }
//    }
//
//    var fullName: String {
//        get {
//            return firstName + " " + lastName
//        }
//        set {
//            print("full name wants to be set to " + newValue)
//            let words = newValue.components(separatedBy: " ")
//            if words.count > 0 {
//                firstName = words[0]
//            }
//
//            if words.count > 1 {
//                lastName = words[1]
//            }
//        }
//    }
//
//    var dayAge: Int {
//        didSet {
//            print("day = \(dayAge)")
//        }
//    }
//
//    var monthAge: Int {
//        didSet {
//            print("month = \(monthAge)")
//        }
//    }
//
//    var yearAge: Int {
//        didSet {
//            print("year = \(yearAge)")
//        }
//    }
//
//    var age: Int {
//        let nowDate = Date()
//        let calendar = Calendar.current
//
//        var dateComponents = DateComponents()
//        dateComponents.year = yearAge
//        dateComponents.month = monthAge
//        dateComponents.day = dayAge
//        let birthday: Date = calendar.date(from: dateComponents) ?? Date()
//
//        let ageComponents = calendar.dateComponents([.year], from: birthday, to: nowDate)
//        let age = ageComponents.year!
//        return age
//    }
//
//    var studyYears: Int {
//        let study = age - 6
//        return (study < 0) ? 0 : study
//    }
//}
//
//var student = Student(firstName: "Alex", lastName: "Skutorenko", dayAge: 12, monthAge: 7, yearAge: 1991)
//student.firstName = "Bob"
//
//student.firstName = "sam"
//
//print(student.fullName)
//student.fullName = "Ivan Ivanov"
//print(student.age)
//print(student.studyYears)





//struct Point {
//    var xCoordinate: Double
//    var yCoordinate: Double
//}
//
//struct Line {
//    var startPoint: Point
//    var endPoint: Point
//    var middlePoint: Point {
//        get {
//            let middleX = (endPoint.xCoordinate - startPoint.xCoordinate)/2 + startPoint.xCoordinate
//            let middleY = (endPoint.yCoordinate - startPoint.yCoordinate)/2 + startPoint.yCoordinate
//            return Point(xCoordinate: middleX, yCoordinate: middleY)
//        }
//        set {
//            let deltaX = newValue.xCoordinate - middlePoint.xCoordinate
//            let deltaY = newValue.yCoordinate - middlePoint.yCoordinate
//
//            startPoint.xCoordinate = startPoint.xCoordinate + deltaX
//            startPoint.yCoordinate = startPoint.yCoordinate + deltaY
//
//            endPoint.xCoordinate = endPoint.xCoordinate + deltaX
//            endPoint.yCoordinate = endPoint.yCoordinate + deltaY
//        }
//    }
//}
//
//let pointA = Point(xCoordinate: 1, yCoordinate: 1)
//let pointB = Point(xCoordinate: 4, yCoordinate: 4)
//
//var line1 = Line(startPoint: pointA, endPoint: pointB)
//print(line1.middlePoint)
//
//line1.middlePoint = Point(xCoordinate: 3, yCoordinate: 4)
//
//print(line1.middlePoint)
//print("start = \(line1.startPoint)")
//print("finish = \(line1.endPoint)")



