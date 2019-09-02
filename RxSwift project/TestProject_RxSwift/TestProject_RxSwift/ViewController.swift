//
//  ViewController.swift
//  TestProject_RxSwift
//
//  Created by Dzmitry Kopats on 8/24/19.
//  Copyright © 2019 Dzmitry Kopats. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    private var count: Int = 0
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label.text = "You have tapped that button \(count) times"
        
        self.button.rx.tap
            .debug("button tap")
            .subscribe(onNext: { _ in
                self.count += 1
                self.label.text = "You have tapped that button \(self.count) times"
            }).disposed(by: self.disposeBag)
    }    
}
