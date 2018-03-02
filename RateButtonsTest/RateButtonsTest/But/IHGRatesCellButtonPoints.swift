//
//  IHGRatesCellButtonPoints.swift
//  IHGBranded-PCR-Universal
//
//  Created by Dzmitry Kopats on 2/6/18.
//  Copyright © 2018 Intercontinental Hotels Group. All rights reserved.
//

import UIKit

class IHGRatesCellButtonPoints: IHGRatesCellButton {
    @IBOutlet weak var basicView: UIView!
    @IBOutlet weak var pointsLabel: UILabel!
    
    override func configureWith(item: IHGRatesCellButtonItem) {
        self.basicView.layer.borderColor = item.primaryBrandColor.cgColor
        self.basicView.layer.borderWidth = 1
        self.pointsLabel.textColor = item.primaryBrandColor
        self.pointsLabel.text = item.points
    }
    
}
