//
//  Model.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/23/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class Model: NSObject {
    let post: ContentModel
    let group: GroupModel
    
    init(post: ContentModel, group: GroupModel) {
        self.post = post
        self.group = group
    }
}
