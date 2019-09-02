//
//  ViewController.swift
//  PinnedTableViewHeader
//
//  Created by Dzmitry Kopats on 2/18/19.
//  Copyright © 2019 Dzmitry Kopats. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchHeader: UIView!

//    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 50
        tableView.contentInset = UIEdgeInsets(top: 114, left: 0, bottom: 0, right: 0)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = UIColor(red: 153/255, green: 255/255, blue: 204/255, alpha: 1)
        
        searchHeader.translatesAutoresizingMaskIntoConstraints = false
        searchHeader.frame = CGRect(x: 0, y: 44, width: UIScreen.main.bounds.size.width, height: 114)
        view.addSubview(searchHeader)
        
//        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
//        imageView.image = UIImage(named: "headerForTableView.jpg")
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        view.addSubview(imageView)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = -scrollView.contentOffset.y
        let height = min(max(y, 51), 114)
        searchHeader.frame = CGRect(x: 0, y: -(114 - height), width: UIScreen.main.bounds.size.width, height: height)
    }
}
