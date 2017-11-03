//
//  CellModel.swift
//  constraints_task1
//
//  Created by Dmitry on 23.10.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class CellModel: NSObject {
    var isExpanded = false
    var title = ""
    var descriptionText = ""
    
    override init() {
        let randomNumber = arc4random() % 2
        self.title = randomNumber == 0 ? "Title 1" : "Title 1 very long long long long long long long long long"
        let randomNumber2 = arc4random() % 2
        self.descriptionText = randomNumber2 == 0 ? "Greetings!!!" : "Greetings. I am writing because I discovered a way to improve the taste of decaffeinate"
    }
    
}
