//
//  DKTableViewController.swift
//  constraints_task1
//
//  Created by Dmitry on 13.10.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

let cellIdentifier1 = "DKCellIdentifier1"
let cellIdentifier3 = "DKCellIdentifier3"
let cellIdentifier4 = "DKCellIdentifier4"

class DKTableViewController: UITableViewController {
    
    var dictionaryOfModels = [IndexPath: CellModel]()
    let numberOfRows: Int = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Some cool title"
        
        let cellNib1 = UINib.init(nibName: "DKCustomCell", bundle: nil)
        let cellNib3 = UINib.init(nibName: "DKCustomCell3", bundle: nil)
        let cellNib4 = UINib.init(nibName: "DKCustomCell4", bundle: nil)
        self.tableView.register(cellNib1, forCellReuseIdentifier: cellIdentifier1)
        self.tableView.register(cellNib3, forCellReuseIdentifier: cellIdentifier3)
        self.tableView.register(cellNib4, forCellReuseIdentifier: cellIdentifier4)
        
        self.tableView.separatorStyle = .none
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
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier: String
        switch indexPath.row % 3 {
        case 0:
            cellIdentifier = cellIdentifier1
        case 1:
            cellIdentifier = cellIdentifier3
        case 2:
            cellIdentifier = cellIdentifier4
        default:
            print("smth went wrong")
            cellIdentifier = cellIdentifier1
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        if let model = dictionaryOfModels[indexPath] {
            if let cell1 = cell as? DKCustomCell {
                cell1.loadCellUsing(model: model)
            }
            if let cell3 = cell as? DKCustomCell3 {
                cell3.loadCellUsing(model: model)
            }
            if let cell4 = cell as? DKCustomCell4 {
                cell4.loadCellUsing(model: model)
            }
        } else {
            print("saved model for (\(indexPath.section),\(indexPath.row))")
            let model1 = CellModel()

            dictionaryOfModels[indexPath] = model1
            
            if let cell1 = cell as? DKCustomCell {
                cell1.loadCellUsing(model: model1)
            }
            if let cell3 = cell as? DKCustomCell3 {
                cell3.loadCellUsing(model: model1)
            }
            if let cell4 = cell as? DKCustomCell4 {
                cell4.loadCellUsing(model: model1)
            }
        }
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // this number use for preliminary calculating number of rows
        return 90;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let isEx = dictionaryOfModels[indexPath]?.isExpanded {
            dictionaryOfModels[indexPath]?.isExpanded = !isEx
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
