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
    var stringColor: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(stringColor!) - viewDidLoad")
        if self.stringColor != "yellow" {
            let buttonNext = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(loadNextVC))
            self.navigationItem.rightBarButtonItem = buttonNext
        }
    }
    
    @objc func loadNextVC() {
        // neet to go to nextVC
//        let vc = ViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        print("loadNextVC count = \(self.navigationController!.viewControllers.count)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("\(stringColor!) - viewWillAppear")
        view.backgroundColor = color
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(stringColor!) - viewDidAppear\n")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("-viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("-viewDidLayoutSubviews")
    }

    

}

