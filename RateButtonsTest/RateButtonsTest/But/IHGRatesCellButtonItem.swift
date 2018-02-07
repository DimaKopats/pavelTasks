//
//  IHGRatesCellButtonItem.swift
//  RateCellButtonsTest
//
//  Created by Dzmitry Kopats on 2/6/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import UIKit

enum IHGRatesCellButtonType: Int {
    case cash = 0
    case points
    case pointsAndCash
    case memberDiscount
    case free
}

class IHGRatesCellButtonItem {
    let type: IHGRatesCellButtonType
    let primaryBrandColor: UIColor
    let cash: String
    let currency: String
    
    init(type: IHGRatesCellButtonType, color: UIColor, cash: String, currency: String) {
        self.type = type
        self.primaryBrandColor = color
        self.cash = cash
        self.currency = currency
    }
}
