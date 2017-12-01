//
//  DKTableViewCell.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/20/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class DKTableViewCell: UITableViewCell, URLSessionDelegate {
    
    let imageWidth = UIScreen.main.bounds.size.width - 40
    var postID = 0
    var sourceID = 0

    @IBOutlet weak var groupLogo: UIImageView!
    @IBOutlet weak var groupTitle: UILabel!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var bigPhoto: UIImageView!
    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBAction func shareButtonTaped(_ sender: Any) {
        let token = UserDefaults.standard.string(forKey: "token")
        let url = URLBuilder.createURLRepost(token: token!, sourceID: self.sourceID, postId: self.postID)
        let request = URLRequest(url: url)
        let queue = OperationQueue()
        queue.name = "repost"
        queue.qualityOfService = .background
        let session = URLSession(configuration:.background(withIdentifier: "back"), delegate:self, delegateQueue:queue)

        let task = session.dataTask(with: request)
        print("repost after 5 sec")
        sleep(5)
        task.resume()
        print("repost done, ID = \(self.postID)")
    }
    
    // URLSessionDelegate
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        print("urlSessionDidFinishEvents")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bigPhoto.backgroundColor = UIColor.black
    }
    
    func initWith(model: Model) {
        self.postID = model.post.postID
        self.sourceID = model.post.sourceID
        self.groupTitle.text = model.group.groupTitle
        self.postTime.text = convert(timeInterval: model.post.postDate)
        self.postTitle.text = model.post.postTitle
        self.groupLogo.image = imageFrom(urlString: model.group.groupLogoURL)
        if !model.post.postImages.isEmpty {
            let imageModel = model.post.postImages[0]
            bigPhoto.image =  getPostImageFrom(model: imageModel)
        } else {
            bigPhoto.image = #imageLiteral(resourceName: "placeholder")
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        self.imageView?.image = nil
//        print("prepareForReuse")
    }
    
    func convert(timeInterval: Int) -> String {
        let formatter = DateFormatter()
//        formatter.dateStyle = .full
        formatter.dateFormat = "dd MMMyyyy HH:mm:ss"
        formatter.locale = Locale(identifier: "ru_RU")
        let date = Date.init(timeIntervalSince1970: Double.init(timeInterval))
        let resultString = formatter.string(from: date)
        return resultString
    }
    
//    func getDateFromString(string: String) -> Date? {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"  //incorrect time
//        return formatter.date(from: string)
//
//    }
    
    // download from internet using URLSession
//    func imageFrom(urlString: String, completion: @escaping (_ image: UIImage) -> ()) {
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
    func imageFrom(urlString: String) -> UIImage {
        if let imgURL = URL(string: urlString),
            let imageData = try? Data.init(contentsOf: imgURL) {
            var image = UIImage.init(data: imageData)
            let scale = image!.size.width/imageWidth
            image = UIImage.init(data: imageData, scale: scale)
            return image!
        } else {
            print("error download image from internet")
            return #imageLiteral(resourceName: "placeholder")
        }
    }
    
    // dave image to local storage
    func saveImage(image: UIImage, name: String) -> Bool {
        guard let data = UIImageJPEGRepresentation(image, 1) ?? UIImagePNGRepresentation(image) else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent(name)!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    // load image from local storage
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
    // load image to cell
    func getPostImageFrom(model: PostPhotoModel) -> UIImage {
        if let localName = model.localName,
            let image = getSavedImage(named: localName) {
            print("load image from folder")
            return image
        } else {
            // using URLSession
            //            imageFrom(urlString: model.post.postImageURLs[0].url, completion: { (image) in
            //                self.bigPhoto.image = image
            //            })
            // withoutURLSession
            
            let imageLink = model.url
            let loadedImage = imageFrom(urlString: imageLink)
            print("load image from internet \(model.url)")
            
            let imageName = String.init(describing: imageLink.split(separator: "/").last)
            if saveImage(image: loadedImage, name: imageName) {
                model.localName = imageName
            } else {
                print("trouble with save photo")
            }
            return loadedImage
        }
    }
}

