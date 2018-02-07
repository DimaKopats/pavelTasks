//
//  ViewController.swift
//  RateButtonsTest
//
//  Created by Dzmitry Kopats on 2/6/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonPoints: IHGRatesCellButtonPoints!
    @IBOutlet weak var buttonPointAndCash: IHGRatesCellButtonPointsAndCash!
    @IBOutlet weak var buttonMemberDiscount: IHGRatesCellButtonMemberDiscount!
    @IBOutlet weak var buttonCash: IHGRatesCellButtonCash!
    @IBOutlet weak var buttonFree: IHGRatesCellButtonFree!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonFree.configureWith(item: IHGRatesCellButtonItem(type: .free, color: UIColor.blue, cash: "100", currency: "USD"))
        self.buttonMemberDiscount.configureWith(item: IHGRatesCellButtonItem(type: .free, color: UIColor.blue, cash: "100", currency: "USD"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

