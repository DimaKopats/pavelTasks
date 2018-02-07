//
//  ViewController.swift
//  SwizzlingTest
//
//  Created by Dzmitry Kopats on 2/2/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        if let printHello = class_getInstanceMethod(ViewController.self, #selector(ViewController.printHello)),
            let printSomething = class_getInstanceMethod(ViewController.self, #selector(ViewController.printSomething)) {
            method_exchangeImplementations(printHello, printSomething)
            print("swiz ok")
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.printHello()
        
        
    }
    
    @objc func printHello() {
        print("func print hello")
    }
    
    @objc func printSomething() {
        print("func print something")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

