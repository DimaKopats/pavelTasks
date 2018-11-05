//
//  ViewController.swift
//  CustomCircle
//
//  Created by Kopats, Dzmitry(AWF) on 9/22/18.
//  Copyright © 2018 Kopats, Dzmitry(AWF). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circleView: CirclePieView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleView.setSegment(values: [0, 150, 300],
                              totals: [300, 300, 300],
                              colors: [UIColor.green, UIColor.yellow, UIColor.red])
    }
    
}

