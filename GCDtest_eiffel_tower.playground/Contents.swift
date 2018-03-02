// источник - https://habrahabr.ru/post/320152/

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var view = UIView(frame: CGRect(x: 0, y: 20, width: 200, height: 250))
var eiffelImage = UIImageView(frame: CGRect(x: 0, y: 20, width: 200, height: 200))
view.backgroundColor = UIColor.green
eiffelImage.backgroundColor = UIColor.yellow
eiffelImage.contentMode = .scaleToFill
view.addSubview(eiffelImage)

PlaygroundPage.current.liveView = view
let imageURL = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!


// загрузка классическим способом
func download(imageUrl: URL) {
    let queue = DispatchQueue.global(qos: .utility)
    queue.async {
        if let data = try? Data(contentsOf: imageUrl) {
            DispatchQueue.main.async {
                eiffelImage.image = UIImage(data: data)
                print("Show image data")
            }
            print("Did download image data")
        }
    }
}
download(imageUrl: imageURL)

















// загрузка с помощью асинхронной функции URLSession
func fetchImage1() {
    let task = URLSession.shared.dataTask(with: imageURL) {
        (data, response, error) in
        if let imageData = data {
            DispatchQueue.main.async {
                print("Show image data")
                eiffelImage.image = UIImage(data: imageData)
            }
            print("Did download image data")
        }
    }
    task.resume()
}

//fetchImage1()

//загрузка изображения с помощью DispatchWorkItem
func fetchImage2() {
    var data:Data?
    let queue = DispatchQueue.global(qos: .utility)
    
    let workItem = DispatchWorkItem {
        data = try? Data(contentsOf: imageURL)
    }
    queue.async(execute: workItem)
    workItem.notify(queue: DispatchQueue.main) {
        if let imageData = data {
            eiffelImage.image = UIImage(data: imageData)
        }
    }
}

//fetchImage2()

//асинхронная обертка синхронной операции - загрузки изображения
func asyncLoadImage(imageURL: URL,
                    runQueue: DispatchQueue,
                    completionQueue: DispatchQueue,
                    completion: @escaping (UIImage?, Error?) -> ()) {
    runQueue.async {
        do {
            let data = try Data(contentsOf: imageURL)
            completionQueue.async {
                completion(UIImage(data: data), nil)
            }
        } catch let error {
            completionQueue.async {
                completion(nil, error)
            }
        }
    }
}

//Загрузка изображения с помощью асинхронной обертки синхронной операции
func fetchImage3() {
    asyncLoadImage(imageURL: imageURL,
                   runQueue: DispatchQueue.global(),
                   completionQueue: DispatchQueue.main) {
                    result, error in
                    guard let image = result else {return}
                    eiffelImage.image = image
    }
}

//fetchImage3()

