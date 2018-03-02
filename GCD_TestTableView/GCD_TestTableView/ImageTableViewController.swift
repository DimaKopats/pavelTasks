//
//  ImageTableViewController.swift
//  GCD_TestTableView
//
//  Created by Dzmitry Kopats on 2/21/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ImageTableViewController: UITableViewController {
    
    var imageURLs: [String] =
        ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
         "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
         "http://bestkora.com/IosDeveloper/wp-content/uploads/2016/12/Screen-Shot-2017-01-17-at-9.33.52-PM.png",
         "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
         "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
         "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
         "http://bestkora.com/IosDeveloper/wp-content/uploads/2016/12/Screen-Shot-2017-01-17-at-9.33.52-PM.png",
         "http://www.picture-newsletter.com/arctic/arctic-12.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "ImageTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "imageGCD")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageURLs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageGCD", for: indexPath)

        if let tweetCell = cell as? ImageTableViewCell {
            tweetCell.imageURL = URL(string: imageURLs[indexPath.row])
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
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
