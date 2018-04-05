//
//  ViewController.swift
//  MVVM_Test
//
//  Created by Dzmitry Kopats on 3/12/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    var coordinatorModel: ViewControllerCoordinatorModel
    var appearanceModel: AppearanceModelType {
        didSet {
            titleLabel.textColor = appearanceModel.titleColor
            view.backgroundColor = appearanceModel.backgroundColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinatorModel = ViewControllerCoordinatorModel(coordinatorDidUpdateAppearanceModelBlock: { (model) in
            self.appearanceModel = model
        })
        coordinatorModel.selectSegment(index: 0)
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        coordinatorModel.selectSegment(index: sender.selectedSegmentIndex)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.coordinatorModel = ViewControllerCoordinatorModel(coordinatorDidUpdateAppearanceModelBlock: { (model) in
        })
        self.appearanceModel = GrassModel()

        super.init(coder: aDecoder)
    }
    
}

