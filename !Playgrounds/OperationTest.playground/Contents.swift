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







