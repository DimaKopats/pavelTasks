//
//  IHGRatesCellButtonFree.swift
//  IHGBranded-PCR-Universal
//
//  Created by Dzmitry Kopats on 2/6/18.
//  Copyright © 2018 Intercontinental Hotels Group. All rights reserved.
//

import UIKit



class IHGRatesCellButtonFree: IHGRatesCellButton {
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var buttonView: UIView!
    
    override func configureWith(item: IHGRatesCellButtonItem) {
//        Bundle.main.loadNibNamed("IHGRatesCellButtonFree", owner: self, options: nil)
        
        self.buttonView.layer.borderWidth = 1
        self.buttonView.layer.borderColor = item.primaryBrandColor.cgColor
        self.detailLabel.textColor = item.primaryBrandColor
    }
    
}
