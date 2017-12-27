//
//  DKTableViewCell.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/20/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class DKTableViewCell: UITableViewCell {
    var postID = 0
    var sourceID = 0
    let photoManager = PhotoManager()

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bigPhoto.backgroundColor = UIColor.lightGray
    }
    
    func initWith(model: Model) {
        self.postID = model.post.ID
        self.sourceID = model.post.sourceID
        self.groupTitle.text = model.group.groupTitle
        self.postTime.text = convert(timeInterval: model.post.date)
        self.postTitle.text = model.post.postTitle
        self.groupLogo.image = photoManager.getImageFrom(model: model.group.groupLogo)
        
        if model.post.images.isEmpty {
            bigPhoto.image = #imageLiteral(resourceName: "placeholder")
            return
        }
        
        let photoModel = model.post.images[0]
        bigPhoto.image =  photoManager.getImageFrom(model: photoModel)
        
        if model.post.images.count == 1 {
            return
        }
        
        let photoModelArray = model.post.images.suffix(from: 1).prefix(3)
        for photoModel in photoModelArray {
            let imageView = UIImageView()
            let image = photoManager.getImageFrom(model: photoModel)
            let aspectRatio = image.size.height/image.size.width
            imageView.heightAnchor.constraint(equalToConstant: 105.0).isActive = true
            imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 105.0/aspectRatio).isActive = true
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            self.verticalStackView.addArrangedSubview(imageView)
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
    


}

