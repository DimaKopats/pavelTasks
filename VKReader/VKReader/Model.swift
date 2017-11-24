//
//  Model.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/23/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class Model: NSObject {
    let post: PostModel
    let group: GroupModel
    
    init(post: PostModel, group: GroupModel) {
        self.post = post
        self.group = group
    }
}
