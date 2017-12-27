//
//  GroupModel.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/23/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class GroupModel: NSObject {
    let groupLogo: PhotoModel
    let groupTitle: String
    let id: Int
    
    init(logo: PhotoModel, title: String, id: Int) {
        self.groupLogo = logo
        self.groupTitle = title
        self.id = id
    }
}
