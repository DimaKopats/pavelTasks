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
    let postImages: [PostPhotoModel]
    let postID: Int
    
    init(sourceID: Int, date: Int, title: String, images: [PostPhotoModel], id: Int) {
        self.sourceID = sourceID
        self.postDate = date
        self.postTitle = title
        self.postImages = images
        self.postID = id
    }
}
