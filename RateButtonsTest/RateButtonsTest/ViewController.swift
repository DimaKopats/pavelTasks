//
//  ViewController.swift
//  RateButtonsTest
//
//  Created by Dzmitry Kopats on 2/6/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonPoints:         IHGRatesCellButtonPoints!
    @IBOutlet weak var buttonPointAndCash:   IHGRatesCellButtonPointsAndCash!
    @IBOutlet weak var buttonMemberDiscount: IHGRatesCellButtonMemberDiscount!
    @IBOutlet weak var buttonCash:           IHGRatesCellButtonCash!
    @IBOutlet weak var buttonFree:           IHGRatesCellButtonFree!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let brandColor = UIColor.blue
        let usdCount = "100"
        let currency = "USD"
        let item = IHGRatesCellButtonItem(type: .free, color: brandColor, cash: usdCount, currency: currency)
        self.buttonFree.configureWith(item: item)
        self.buttonMemberDiscount.configureWith(item: item)
        self.buttonPoints.configureWith(item: item)
        self.buttonPointAndCash.configureWith(item: item)
        self.buttonCash.configureWith(item: item)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

