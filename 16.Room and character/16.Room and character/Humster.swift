//
//  Character.swift
//  16.Room and character
//
//  Created by Dzmitry Kopats on 4/3/19.
//  Copyright © 2019 Dzmitry Kopats. All rights reserved.
//

import Foundation

class Humster {
    var position: Point
    
    init(posX: Int, posY: Int) {
        position = Point(x: posX, y: posY)
    }
    
    convenience init() {
        self.init(posX: 2, posY: 2)
    }
}

struct Point {
    var x: Int
    var y: Int
}
