//: Playground - noun: a place where people can play

import UIKit

protocol Bird {
    var name: String { get }
    var canFly: Bool { get }
}

protocol Flyable {
    var airspeedVelocity: Double { get }
}

extension Bird where Self:Flyable {
    var canFly: Bool {
        return true
    }
}

extension Flyable {
    func distance(time: Double) -> Double {
        return time*airspeedVelocity
    }
}

struct Pinguin: Bird {
    var name: String {
        return "Pinguin"
    }
    var canFly: Bool {
        return false
    }
}

enum Parrot: String, Bird, Flyable {
    case African
    case Mexican
    
    var name: String {
        return self.rawValue
    }
    var airspeedVelocity: Double {
        switch self {
        case .African:
            return 200
        case .Mexican:
            return 400
        }
    }
}

var parrot = Parrot.Mexican
parrot.canFly
parrot.name
parrot.distance(time: 3)











