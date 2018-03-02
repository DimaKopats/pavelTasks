//: Playground - noun: a place where people can play
import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

let dimaTestQueue = OperationQueue()

let umbrellaOperation = BlockOperation {
    print("-------💧☂️")
    sleep(2)
}
umbrellaOperation.qualityOfService = .userInitiated

// замеряем время выполнения
duration {
    dimaTestQueue.addOperation { print("Каждый 🍎"); sleep(2) }
    dimaTestQueue.addOperation(umbrellaOperation)
}

















//Где 💎
//Сидит 🚙
//Каждый 🍎
//Охотник 🍊
//Желает 🍋
//Знать 🍏
//Фазан 🍆
//-------💧☂️








PlaygroundPage.current.finishExecution()
