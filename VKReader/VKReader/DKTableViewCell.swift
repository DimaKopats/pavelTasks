//
//  DKTableViewCell.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/20/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class DKTableViewCell: UITableViewCell {
    
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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
        let task = appDelegate.backgroundSession!.dataTask(with: request)
        
        DispatchQueue.global(qos: .background).async {
            print("repost after 5 sec")
            sleep(5)
            print("repost done, ID = \(self.postID)")
            task.resume()
        }
    }
    
    // URLSessionDelegate
//    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
//        print("urlSessionDidFinishEvents")
//    }
//    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
//        print("didBecomeInvalidWithError")
//    }
    
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
        
        if model.post.postImages.isEmpty {
            bigPhoto.image = #imageLiteral(resourceName: "placeholder")
            return
        }
        
        let imageModel = model.post.postImages[0]
        bigPhoto.image =  getPostImageFrom(model: imageModel)
        
        if model.post.postImages.count == 1 {
            return
        }
        
        var index = 1
        let array = model.post.postImages.suffix(from: 1).prefix(3)
        
        while index < model.post.postImages.count && index < 4 {
            let imageView = UIImageView()
            let image = getPostImageFrom(model: model.post.postImages[index])
            let aspectRatio = image.size.height/image.size.width
            imageView.heightAnchor.constraint(equalToConstant: 105.0).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 105.0/aspectRatio).isActive = true
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            self.verticalStackView.addArrangedSubview(imageView)
            index += 1
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        self.imageView?.image = nil
        let subviews = verticalStackView.arrangedSubviews
        for view in subviews {
            verticalStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
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
    
    // save image to local storage
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

