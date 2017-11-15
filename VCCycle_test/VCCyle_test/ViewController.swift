//
//  ViewController.swift
//  VCCyle_test
//
//  Created by Dzmitry Kopats on 11/14/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var color: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = color
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

