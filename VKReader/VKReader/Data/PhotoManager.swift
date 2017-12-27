//
//  PhotoManager.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 12/14/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class PhotoManager {
    
    var directory: URL
    
    let imageWidth = UIScreen.main.bounds.size.width - 40
    
    init() {
            directory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            directory.deleteLastPathComponent()
            directory.deleteLastPathComponent()
            directory.appendPathComponent("test")
    }
    
    // download from internet using URLSession
    //    func loadImageFrom(urlString: String, completion: @escaping (_ image: UIImage) -> ()) {
    //        if let url = URL(string: urlString) {
    //            let task = URLSession.shared.dataTask(with: url) { data, response, error in
    //                guard let data = data, error == nil else { return }
    //                DispatchQueue.main.async() {
    //                    completion(UIImage(data: data)!)
    //                }
    //            }
    //            task.resume()
    //        }
    //    }
    
    // download from internet wihtout URLSession
    func loadImageUsing(photoModel: PhotoModel) -> UIImage {
        if let imgURL = photoModel.url,
            let imageData = try? Data.init(contentsOf: imgURL) {
            print("load image from internet \(imgURL)")
            var image = UIImage.init(data: imageData)
            let scale = image!.size.width/imageWidth
            image = UIImage.init(data: imageData, scale: scale)
            saveImage(image: image!, name: photoModel.localName)
            return image!
        } else {
            print("error download image from internet")
            return #imageLiteral(resourceName: "placeholder")
        }
    }
    
    
    // save image to local storage
    func saveImage(image: UIImage, name: String) {
        guard let data = UIImageJPEGRepresentation(image, 1) ?? UIImagePNGRepresentation(image) else {
            print("trouble with save photo (Representation)")
            return
        }
        
        do {
            try data.write(to: directory.appendingPathComponent(name))
        } catch {
            print(error.localizedDescription)
            print("trouble with save photo (write)")
        }
    }
    
    // load image for cell
    func getImageFrom(model: PhotoModel) -> UIImage {
        if let image = UIImage(contentsOfFile: directory.appendingPathComponent(model.localName).path) {
            print("load image from local storage")
            return image
        } else {
            // using URLSession
            //            imageFrom(urlString: model.post.postImageURLs[0].url, completion: { (image) in
            //                self.bigPhoto.image = image
            //            })
            
            // withoutURLSession
            let loadedImage = loadImageUsing(photoModel: model)
            return loadedImage
        }
    }
    
}
