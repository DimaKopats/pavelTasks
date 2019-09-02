import Foundation

final class ComplicatedObject {
    private var configurateion: Data
    
    init(url: URL) {
        let manager = WebManager()
        self.configurateion = manager.getData(with: url)
    }
    
    init(object: ComplicatedObject) {
        self.configurateion = object.configurateion
    }
    
    func clone() -> ComplicatedObject {
        return ComplicatedObject(object: self)
    }
}

final class WebManager {
    func getData(with url: URL) -> Data {
        return Data()
    }
}

let object = ComplicatedObject(url: URL(fileURLWithPath: ""))
let clone = object.clone()

print(object === clone)

let anotherObject = object
print(object === anotherObject)
