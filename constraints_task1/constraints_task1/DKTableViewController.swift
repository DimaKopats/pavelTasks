//
//  DKTableViewController.swift
//  constraints_task1
//
//  Created by Dmitry on 13.10.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

let cellIdentifier1 = "DKCellIdentifier1"
let cellIdentifier2 = "DKCellIdentifier2"
let cellIdentifier3 = "DKCellIdentifier3"
let cellIdentifier4 = "DKCellIdentifier4"

class DKTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Some cool title"
        
        let cellNib1 = UINib.init(nibName: "DKCustomCell", bundle: nil)
        let cellNib2 = UINib.init(nibName: "DKCustomCell2", bundle: nil)
        let cellNib3 = UINib.init(nibName: "DKCustomCell3", bundle: nil)
        let cellNib4 = UINib.init(nibName: "DKCustomCell4", bundle: nil)
        self.tableView.register(cellNib1, forCellReuseIdentifier: cellIdentifier1)
        self.tableView.register(cellNib2, forCellReuseIdentifier: cellIdentifier2)
        self.tableView.register(cellNib3, forCellReuseIdentifier: cellIdentifier3)
        self.tableView.register(cellNib4, forCellReuseIdentifier: cellIdentifier4)
        
        self.tableView.separatorStyle = .none

        // self.clearsSelectionOnViewWillAppear = false
        
        //         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier: String
        switch indexPath.row % 4 {
        case 0:
            cellIdentifier = cellIdentifier1
        case 1:
            cellIdentifier = cellIdentifier2
        case 2:
            cellIdentifier = cellIdentifier3
        case 3:
            cellIdentifier = cellIdentifier4
        default:
            print("smth went wrong")
            cellIdentifier = cellIdentifier1
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
//        if let cell = cell as? DKCustomCell {
//        }
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // use for preliminary calculating number of rows
        return 90;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
  
    
}
