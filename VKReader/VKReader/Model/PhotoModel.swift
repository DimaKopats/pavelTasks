//
//  PhotoModel.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/29/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class PhotoModel {
    let url: URL
    let localName: String
    
    init(url: URL) {
        self.url = url
        localName = url.lastPathComponent
//        localName = String.init(describing: url.split(separator: "/").last!)
    }
}

