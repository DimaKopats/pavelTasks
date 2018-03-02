//
//  IHGRatesCellButtonCash.swift
//  IHGBranded-PCR-Universal
//
//  Created by Dzmitry Kopats on 2/6/18.
//  Copyright © 2018 Intercontinental Hotels Group. All rights reserved.
//

import UIKit

class IHGRatesCellButtonCash: IHGRatesCellButton {
    @IBOutlet weak var basicView: UIView!
    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    
    override func configureWith(item: IHGRatesCellButtonItem) {
        self.basicView.layer.borderColor = item.primaryBrandColor.cgColor
        self.basicView.layer.borderWidth = 1
        self.cashLabel.textColor = item.primaryBrandColor
        self.cashLabel.text = item.cash
        self.currencyLabel.textColor = item.primaryBrandColor
        self.currencyLabel.text = item.currency
    }
}
