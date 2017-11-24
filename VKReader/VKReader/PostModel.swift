//
//  PostModel.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/21/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class PostModel: NSObject {
    let sourceID: Int
    let postDate: Int
    let postTitle: String
    let postImageURLs: [String]
    let postID: Int
    
//    init(dataDictionary: [String: Any]) {
//        if let source = dataDictionary["source_id"] as? Int,
//            let date = dataDictionary["date"] as? Int,
//            let title = dataDictionary["text"] as? String,
//            let imageArray = dataDictionary["photoArray"] as? [String],
//            let id = dataDictionary["post_id"] as? Int {
//            self.sourceID = source
//            self.postDate = date
//            self.postTitle = title
//            self.postImageURLs = imageArray
//            self.postID = id
//        } else {
//            print("error - insufficient data to initialize the PostModel")
//            self.sourceID = 0
//            self.postDate = 0
//            self.postTitle = ""
//            self.postImageURLs = [String]()
//            self.postID = 0
//        }
//    }
    
    init(sourceID: Int, date: Int, title: String, images: [String], id: Int) {
        self.sourceID = sourceID
        self.postDate = date
        self.postTitle = title
        self.postImageURLs = images
        self.postID = id
    }
}
