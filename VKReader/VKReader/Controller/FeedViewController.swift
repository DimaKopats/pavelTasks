//
//  FeedViewController.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/20/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit
import VK_ios_sdk


let reuseIdentifier = "Cell"

class FeedViewController: UITableViewController {
    
    var dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FeedViewController - viewDidLoad")
        
        dataSource.delegate = self
        self.view.backgroundColor = UIColor.lightGray
        tableView.register(UINib(nibName: "DKTableViewCell", bundle: nil) , forCellReuseIdentifier: reuseIdentifier)
        
        let leftButton = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(FeedViewController.leftButtonTap))
        self.navigationItem.leftBarButtonItem = leftButton
        self.dataSource.startDownloading {
            print("reloadData")
            self.tableView.reloadData()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func leftButtonTap() {
        print("do smth")
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.models.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DKTableViewCell
        if dataSource.models.count > indexPath.row {
            cell.initWith(model: dataSource.models[indexPath.row])
        }
        
        if dataSource.models.count == indexPath.row + 5 {
            self.dataSource.startDownloading {
                print("startDownloading more items")
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    
}


extension FeedViewController: UpdateDataSourceProtocol {
    func updateDataSource(error: Bool) {
        print("updateDataSource")
        if error {
            print(error)
        } else {
            self.tableView.reloadData()
        }
    }
}

