//
//  Printer.swift
//  16.Room and character
//
//  Created by Dzmitry Kopats on 4/3/19.
//  Copyright © 2019 Dzmitry Kopats. All rights reserved.
//

import Foundation
import UIKit

class Printer {
 
    enum Symbols {
        static let hamburger = "🍔"
        static let humster = "🐹"
        static let star = "⭐"
        static let space = "🥢"
    }
    
    func printToConsole(room: Room, humster: Humster, hamburger: Hamburger) {
        print("\n\n")
        var height = 0
        let width = room.width + 2
        while height < room.height + 2 {
            if height == 0 || height == room.height + 1 {
                printHorizontalLine(length: room.width + 2)
            } else {
                if humster.position.y == height || hamburger.position.y == height {
                    if humster.position.y == height && hamburger.position.y == height {
                        printMiddleLine(length: width, humsterPosition: humster.position.x, hamburgerPosition: hamburger.position.x)
                    } else if humster.position.y == height {
                        printMiddleLine(length: width, humsterPosition: humster.position.x)
                    } else if hamburger.position.y == height {
                        printMiddleLine(length: width, hamburgerPosition: hamburger.position.x)
                    } else {
                        print("error")
                    }
                } else {
                    printMiddleLine(length: width)
                }
            }
            height += 1
        }
        print("\n\n")
    }
    
    func printHorizontalLine(length: Int) {
        var width = 0
        var str = ""
        while width < length {
            str.append(Symbols.star)
            width += 1
        }
        print(str)
    }
    
    func printMiddleLine(length: Int, humsterPosition: Int? = nil, hamburgerPosition: Int? = nil) {
        var width = 0
        var str = ""
        while width < length  {
            if width == 0 || width == length - 1 {
                str.append(Symbols.star)
            } else {
                if let charPos = humsterPosition, width == charPos {
                    str.append(Symbols.humster)
                } else if let hambPos = hamburgerPosition, width == hambPos {
                    str.append(Symbols.hamburger)
                } else {
                    str.append(Symbols.space)
                }
            }
            width += 1
        }
        print(str)
    }
}
