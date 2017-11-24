//
//  GroupModel.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/23/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class GroupModel: NSObject {
    let groupLogoURL: String
    let groupTitle: String
    let id: Int
    
    init(logoUrl: String, title: String, id: Int) {
        self.groupLogoURL = logoUrl
        self.groupTitle = title
        self.id = id
    }
}
