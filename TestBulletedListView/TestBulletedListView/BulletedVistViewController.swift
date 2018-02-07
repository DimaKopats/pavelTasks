//
//  BulletedVistViewController.swift
//  TestBulletedListView
//
//  Created by Dzmitry Kopats on 1/26/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import UIKit

class BulletedVistViewController: UIViewController {

    @IBOutlet weak var bulletedList: BulletedListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bulletedList.configureWith(list: ["string 11111111string 11111111", "string 22222stringststringstringring2222222222222222", "string 3stringstring3333", "string 44stringstring444", "string 5555", "string 666666"])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
