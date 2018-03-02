//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

//: Определяем бесконечное выполнение, чтобы предотвратить "выбрасывание" background tasks, когда "main" thread будет закончена.
PlaygroundPage.current.needsIndefiniteExecution = true

let mySerialQueue = DispatchQueue(label: "com.dimaKopat.mySerial")


func changeValue(variant: Int) {
    sleep(1)
    value = value + "👿"
    print("\(value) - \(variant)")
}

var value = "😇"
mySerialQueue.sync {
    changeValue(variant: 1)
}
value

value = "🦊"
mySerialQueue.sync {
    changeValue(variant: 2)
}
value


