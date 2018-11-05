//
//  ViewController.swift
//  HitList
//
//  Created by Kopats, Dzmitry(AWF) on 10/29/18.
//  Copyright © 2018 Kopats, Dzmitry(AWF). All rights reserved.
//

import CoreData
import UIKit

class ViewController: UIViewController {
    
    private struct Constants {
        static let identifier = "Cell"
        static let keyForName = "name"
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private var people: [NSManagedObject] = []
    private var appDelegate = UIApplication.shared.delegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "The list"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.identifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = self.appDelegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    @IBAction func addName(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New name", message: "Add new name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [weak self] action in
            
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
            self?.save(name: nameToSave)
            self?.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func save(name: String) {
        guard let appDelegate = self.appDelegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        person.setValue(name, forKeyPath: Constants.keyForName)
        
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifier, for: indexPath)
        cell.textLabel?.text = person.value(forKeyPath: Constants.keyForName) as? String
        return cell
    }
}








