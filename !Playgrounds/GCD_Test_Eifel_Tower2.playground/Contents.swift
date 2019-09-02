//: Playground - noun: a place where people can play

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

// классический способ
func fetchImage(imageUrl: URL) {
    let queue = DispatchQueue.global(qos: .utility)
    queue.async {
        if let data = try? Data(contentsOf: imageUrl) {
            DispatchQueue.main.async {
                eiffelImage.image = UIImage(data: data)
            }
        }
    }
}



// using URLSession
func fetchImage1(imageUrl: URL) {
    let task = URLSession.shared.dataTask(with: imageUrl) {
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

func fetchImage2(imageUrl: URL) {
    var data: Data?
    let queue = DispatchQueue.global(qos: .utility)
    let workItem = DispatchWorkItem {
        data = try? Data(contentsOf: imageUrl)
    }
    
    queue.async(execute: workItem)
    workItem.notify(queue: DispatchQueue.main) {
        if let imageData = data {
            eiffelImage.image = UIImage(data: imageData)
        }
    }
    
}

fetchImage2(imageUrl: imageURL)

//download(imageUrl: imageURL)












































