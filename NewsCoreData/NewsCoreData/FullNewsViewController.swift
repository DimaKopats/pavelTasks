//
//  FullNewsViewController.swift
//  NewsCoreData
//
//  Created by Kopats, Dzmitry(AWF) on 11/3/18.
//  Copyright © 2018 Kopats, Dzmitry(AWF). All rights reserved.
//

import UIKit

class FullNewsViewController: UIViewController {

    @IBOutlet weak var viewCountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fullTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configure(post: NewsPost) {
        viewCountLabel.text = "0"
        dateLabel.text = post.date.toString()
        titleLabel.text = post.title
        fullTextLabel.text = post.fullText
    }
    
    
    func configureWith(postId: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        // get post from date using postID
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Constants.keyForShortPost)
//
//        do {
//            news = try managedContext.fetch(fetchRequest)
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
    }
}
