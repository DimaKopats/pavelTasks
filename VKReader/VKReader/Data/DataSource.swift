//
//  DataSource.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/21/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit
import CoreData

class DataSource: NSObject {
    var delegate: UpdateDataSourceProtocol?
    var models = [Model]()
    let loader: DataLoader
    var coreDataModels = [NSManagedObject]()
    var managedContext: NSManagedObjectContext?
    
    override init() {
        let tokenManager = TokenManager()
        if let accessToken = tokenManager.getToken() {
            self.loader = DataLoader.init(usingToken: accessToken)
        } else {
            print("without a token does not make sense")
            self.loader = DataLoader.init(usingToken: "")
        }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    func startDownloading(completionHandler: @escaping () -> ()) {
        print("startDownloading")
        
        if Reachability.isConnectedToNetwork() {
            print("Internet connection OK")
            loader.getData{[unowned self] (models: [Model], error: Bool) in
                //вызовется после обработки результата и у нас есть массив моделей на этот момент
                print("when call completionHandler")
                self.models.append(contentsOf: models)
                DispatchQueue.main.async {
                    completionHandler()
                    // update dataSource
                    self.delegate?.updateDataSource(error: false)
                }
                
                // save input models to core data
                for model in models {
                    let entity = NSEntityDescription.entity(forEntityName: "ContentEntity", in: self.managedContext!)!
                    let contentEntity = NSManagedObject(entity: entity, insertInto: self.managedContext)
                    contentEntity.setValue(model.post.ID, forKey: "id")
                    contentEntity.setValue(model.post.sourceID, forKey: "sourceID")
                    contentEntity.setValue(model.post.postTitle, forKey: "postTitle")
                    contentEntity.setValue(model.post.date, forKey: "date")
                    do {
                        try self.managedContext!.save()
                        self.coreDataModels.append(contentEntity)
                    } catch let error as NSError {
                        print("Could not save. \(error), \(error.userInfo)")
                    }
                    //            print("id = \(contentEntity.value(forKey: "id")!)")
                    //            print("sourceID = \(contentEntity.value(forKey: "sourceID")!)")
                    //            print("postTitle = \(contentEntity.value(forKey: "postTitle")!)")
                    //            print("date = \(contentEntity.value(forKey: "date")!)")
                }
            }
        } else {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ContentEntity")
            
            do {
                coreDataModels = try managedContext!.fetch(fetchRequest)
                self.models.append(contentsOf: convert(entityArray: coreDataModels))
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
            
            
            print("Internet connection FAILED")
        }
    }
    
    func convert(entityArray: [NSManagedObject]) -> [Model] {
        for entity in entityArray {
            let id = entity.value(forKey: "id") as! Int
            let sourceID = entity.value(forKey: "sourceID") as! Int
            let postTitle = entity.value(forKey: "postTitle") as! String
            let date = entity.value(forKey: "date") as! Int
            let contentModel =
                ContentModel.init(sourceID: sourceID, date: date, title: postTitle, images: [PhotoModel](), id: id)
            
            
//            print("id = \(id)\t sourceID = \(sourceID)\t date = \(date)\t title = \(postTitle)")
            
        }
        
        return [Model]()
    }
}
