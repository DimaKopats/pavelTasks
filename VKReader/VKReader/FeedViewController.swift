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
    
    let imageWidth = UIScreen.main.bounds.size.width - 40
    var dataSource = DKDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FeedViewController - viewDidLoad")
        
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
        print("numberOfRows = \(self.dataSource.models.count)")
        return self.dataSource.models.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DKTableViewCell
        if dataSource.models.count > indexPath.row {
            cell.groupTitle.text = dataSource.models[indexPath.row].group.groupTitle
            cell.postTitle.text = dataSource.models[indexPath.row].post.postTitle
            if !dataSource.models[indexPath.row].post.postImageURLs.isEmpty {
                let imgURL: URL = URL.init(string: dataSource.models[indexPath.row].post.postImageURLs[0])!
                if let imageData = try? Data.init(contentsOf: imgURL) {
                    var image = UIImage.init(data: imageData)
                    let scale = image!.size.width/imageWidth
                    image = UIImage.init(data: imageData, scale: scale)
//                    let aspectRatio = image!.size.height/image!.size.width
//                    image?.size = CGSize(width: imageWidth, height: imageWidth*aspectRatio)
//                    print("      image = \(image!.size.height)x\(image!.size.width)")
                    cell.bigPhoto.image = image
//                    cell.bigPhoto.frame.size = CGSize(width: imageWidth, height: imageWidth*aspectRatio)
//                    print("phone image = \(cell.bigPhoto.frame.size.height)x\(cell.bigPhoto.frame.size.width)")
//                    print("\(UIScreen.main.bounds)")
                }
            } else {
                cell.bigPhoto.image = #imageLiteral(resourceName: "placeholder")
            }
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
