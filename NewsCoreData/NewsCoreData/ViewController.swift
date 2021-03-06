//
//  ViewController.swift
//  NewsCoreData
//
//  Created by Kopats, Dzmitry(AWF) on 11/3/18.
//  Copyright © 2018 Kopats, Dzmitry(AWF). All rights reserved.
//
import Darwin
import CoreData
import UIKit


struct Constants {
    static let identifier = "NewsTableViewCell"
    
    static let keyForShortPost = "ShortPost"
    static let keyForFullPost = "FullPost"
    static let keyForTitle = "title"
    static let keyForId = "id"
    static let keyForText = "text"
    static let keyForPreviewText = "PreviewText"
    static let keyForViewCount = "viewCount"
    static let keyForDate = "Date"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var news: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Hot news"
        tableView.register(UINib(nibName: Constants.identifier, bundle: nil), forCellReuseIdentifier: Constants.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Constants.keyForShortPost)
        // Use Fetch Result Controller
        do {
            news = try managedContext.fetch(fetchRequest)
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifier, for: indexPath) as! NewsTableViewCell
        if let post = getShortPostFor(row: indexPath.row) {
            cell.configureWith(post: post)
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let fullController = FullNewsViewController.init(nibName: "FullNewsViewController", bundle: nil)
        navigationController?.pushViewController(fullController, animated: true)
        
        if let post = getShortPostFor(row: indexPath.row), let id = post.fullPost?.id {
//            fullController.configure(post: post)
            fullController.configureWith(id: id)
        }
    }
}

private extension ViewController {
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add news", message: "Type new entity", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [weak self] action in
            
            guard let count = alert.textFields?.count, count == 5 else { return }
            // Get TextFields text
            // 0 = title
            // 1 = date
            // 2 = previewText
            // 3 = fullText
            // 4 = id
            let title = alert.textFields![0].text ?? ""
            let date = alert.textFields![1].text ?? ""
            let previewText = alert.textFields![2].text ?? ""
            let fullText = alert.textFields![3].text ?? ""
            let postId = alert.textFields![4].text ?? ""
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let convertedDate = dateFormatter.date(from: date) ?? Date()
            
            let newsPost = NewsPost(viewCount: 0,
                                    title: title,
                                    date: convertedDate,
                                    previewText: previewText,
                                    fullText: fullText,
                                    id: Int(postId) ?? Int(arc4random_uniform(1000000) + 1))
            
            print("title: \(title)\ndate: \(date)\npreviewText: \(previewText)\nfullText: \(fullText)\nid: \(Int(postId) ?? 0)")
            
            self?.save(post: newsPost)
            self?.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        // 0 = title
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.placeholder = "Type news title"
        }
        // 1 = date
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = UIKeyboardType.decimalPad
            textField.placeholder = "Type news date dd.MM.yyyy"
        }
        // 2 = previewText
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.placeholder = "Type news previewText"
        }
        // 3 = fullText
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.placeholder = "Type news fullText"
        }
        // 4 = id
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.placeholder = "Type news id"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func save(post: NewsPost) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        appDelegate.persistentContainer.performBackgroundTask {[weak self] (context) in
            
            let shortPost = NSEntityDescription.insertNewObject(forEntityName: Constants.keyForShortPost, into: context) as! ShortPost
            shortPost.date = post.date
            shortPost.previewText = post.previewText
            shortPost.title = post.title
            shortPost.viewCount = 0
            
            let fullPost = NSEntityDescription.insertNewObject(forEntityName: Constants.keyForFullPost, into: context) as! FullPost
            fullPost.text = post.fullText
            fullPost.id = Int16(post.id)
            shortPost.fullPost = fullPost
            
            do {
                try context.save()
                self?.news.append(shortPost)
                self?.tableView.reloadData()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    func getShortPostFor(row: Int) -> ShortPost? {
        guard row < news.count else { return nil }
        
        let post = news[row] as? ShortPost
        return post
    }
}

