//
//  ViewController.swift
//  16.Room and character
//
//  Created by Dzmitry Kopats on 4/3/19.
//  Copyright © 2019 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    var room = Room()
    var humster = Humster()
    var printer = Printer()
    var hamburger = Hamburger()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        printRoom()
    }

    @IBAction func topButtonTapped(_ sender: Any) {
        humster.position.y -= 1
        printRoom()
    }
    
    @IBAction func bottomButtonTapped(_ sender: Any) {
        humster.position.y += 1
        printRoom()
    }
    
    @IBAction func leftButtonTapped(_ sender: Any) {
        humster.position.x -= 1
        printRoom()
    }
    
    @IBAction func rightButtonTapped(_ sender: Any) {
        humster.position.x += 1
        printRoom()
    }
    
    func printRoom() {
        printer.printToConsole(room: room, humster: humster, hamburger: hamburger)
    }
    
}

