//
//  PostModel.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/21/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class PostModel: NSObject {
    let groupLogo: UIImageView
    let groupTitle: String
    let postDate: Int
    let postTitle: String
    let postImage: UIImageView
    let postId: Int
    
    init(dataDictionary: [String: Any]) {
        self.groupLogo = dataDictionary["groupLogo"] as! UIImageView
        self.groupTitle = dataDictionary["groupTitle"] as! String
        self.postDate = dataDictionary["postDate"] as! Int
        self.postTitle = dataDictionary["postTitle"] as! String
        self.postImage = dataDictionary["postImage"] as! UIImageView
        self.postId = dataDictionary["postId"] as! Int
    }

}
