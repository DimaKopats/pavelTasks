//
//  PostPhotoModel.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/29/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class PostPhotoModel {
    let url: String
    var localName: String?
    
    convenience init() {
        self.init(url: "")
    }
    
    init(url: String) {
        self.url = url
    }
}
