//
//  Room.swift
//  16.Room and character
//
//  Created by Dzmitry Kopats on 4/3/19.
//  Copyright © 2019 Dzmitry Kopats. All rights reserved.
//

import Foundation

class Room {
    var height: Int
    var width: Int
    
    init(height: Int, width: Int) {
        self.height = height
        self.width = width
    }
    
    convenience init() {
        self.init(height: 10, width: 10)
    }
}
