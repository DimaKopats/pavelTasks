//
//  IHGRatesCellButtonMemberDiscount.swift
//  IHGBranded-PCR-Universal
//
//  Created by Dzmitry Kopats on 2/6/18.
//  Copyright © 2018 Intercontinental Hotels Group. All rights reserved.
//

import UIKit

class IHGRatesCellButtonMemberDiscount: IHGRatesCellButton {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var additionalView: UIView!
    @IBOutlet weak var topBorderLabel: UILabel!
    @IBOutlet weak var bottomBorderLabel: UILabel!
    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var additionalInfoLabel: UILabel!
    
    override func configureWith(item: IHGRatesCellButtonItem) {
        self.mainView.layer.borderWidth = 1
        self.mainView.layer.borderColor = UIColor.init(red: 217/255, green: 105/255, blue: 50/255, alpha: 1).cgColor
        self.additionalView.isHidden = true
        
        self.cashLabel.text = item.cash
        self.currencyLabel.text = item.currency
    }
}

