//
//  FullNewsViewController.swift
//  NewsCoreData
//
//  Created by Kopats, Dzmitry(AWF) on 11/3/18.
//  Copyright © 2018 Kopats, Dzmitry(AWF). All rights reserved.
//

import CoreData
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
    
    func configure(post: ShortPost) {
        //        loadViewIfNeeded()
        //
        //        dateLabel.text = post.date?.toString()
        //        titleLabel.text = post.title
        //
        //        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        //            return
        //        }
        //
        //        let managedContext = appDelegate.persistentContainer.viewContext
        //        let fetchRequestShortPosts = NSFetchRequest<NSManagedObject>(entityName: Constants.keyForShortPost)
        //        let fetchRequestFullPosts = NSFetchRequest<NSManagedObject>(entityName: Constants.keyForFullPost)
        //
        //        do {
        //            let shortNews = try managedContext.fetch(fetchRequestShortPosts)
        //            let fullNews = try managedContext.fetch(fetchRequestFullPosts)
        //
        //            fullNews.forEach { (post) in
        //                if let id = post.value(forKey: Constants.keyForId) as? Int, id == postId {
        //                    fullTextLabel.text = post.value(forKey: Constants.keyForText) as? String
        //
        //                }
        //            }
        //
        //            shortNews.forEach { (post) in
        //                if let id = post.value(forKey: Constants.keyForId) as? Int, id == postId {
        //                    if let viewCount = post.value(forKey: Constants.keyForViewCount) as? Int {
        //                        viewCountLabel.text = String(viewCount + 1)
        //                        post.setValue(viewCount + 1, forKey: Constants.keyForViewCount)
        //                    }
        //                }
        //            }
        //
        //            do {
        //                try managedContext.save()
        //            } catch let error as NSError {
        //                print("Could not save. \(error), \(error.userInfo)")
        //            }
        //
        //
        //        } catch let error as NSError {
        //            print("Could not save. \(error), \(error.userInfo)")
        //        }
    }
    
    func configureWith(id: Int16) {
        loadViewIfNeeded()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FullPost>(entityName: Constants.keyForFullPost)
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        
        do {
            let fullNews = try managedContext.fetch(fetchRequest)
            fullNews.forEach { (post) in
                if id == post.id {
                    if let currentViewCount = post.shortPost?.viewCount {
                        viewCountLabel.text = String(currentViewCount + 1)
                        post.shortPost?.viewCount = currentViewCount + 1
                    }
                    
                    fullTextLabel.text = post.text
                    dateLabel.text = post.shortPost?.date?.toString()
                    titleLabel.text = post.shortPost?.title
                }
            }
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
            
        } catch let error as NSError {
            print("Fetch fail. \(error), \(error.userInfo)")
        }
        
    }
    
}
