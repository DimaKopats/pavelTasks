//
//  PhotoModel.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/29/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class PhotoModel {
    let url: URL?
    let localName: String
    
    init(url: String) {
        self.url = URL.init(string: url)
        localName = String.init(describing: url.split(separator: "/").last!)
    }
}

