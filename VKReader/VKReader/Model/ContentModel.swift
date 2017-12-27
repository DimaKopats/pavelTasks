//
//  ContentModel.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/21/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ContentModel {
    let sourceID: Int
    let date: Int
    let postTitle: String
    let images: [PhotoModel]
    let ID: Int
    
    init(sourceID: Int, date: Int, title: String, images: [PhotoModel], id: Int) {
        self.sourceID = sourceID
        self.date = date
        self.postTitle = title
        self.images = images
        self.ID = id
    }
}
