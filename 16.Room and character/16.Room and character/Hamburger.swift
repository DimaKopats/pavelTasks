//
//  Hamburger.swift
//  16.Room and character
//
//  Created by Dzmitry Kopats on 4/3/19.
//  Copyright © 2019 Dzmitry Kopats. All rights reserved.
//

import Foundation

class Hamburger {
    var position: Point
    
    init(posX: Int, posY: Int) {
        position = Point(x: posX, y: posY)
    }
    
    convenience init() {
        self.init(posX: 3, posY: 2)
    }
}
