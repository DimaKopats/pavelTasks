//
//  CoreDataManager.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 1/5/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager()
    
    var entityArray = [NSManagedObject]()
    var managedContext: NSManagedObjectContext?
    
    private init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    func save(models: [Model]) {
        // save input models to core data
        for model in models {
            
            // contentEntity.images
            var images = Set<NSManagedObject>()
            for image in model.post.images {
                let entity = NSEntityDescription.entity(forEntityName: "PhotoModelEntity", in: self.managedContext!)!
                let photoEntity = NSManagedObject.init(entity: entity, insertInto: self.managedContext)
                photoEntity.setValue(image.localName, forKey: "localName")
                photoEntity.setValue(image.url, forKey: "url")
                images.insert(photoEntity)
            }
            
            // contentEntity
            let entity = NSEntityDescription.entity(forEntityName: "ContentEntity", in: self.managedContext!)!
            let contentEntity = NSManagedObject(entity: entity, insertInto: self.managedContext)
            contentEntity.setValue(model.post.ID, forKey: "id")
            contentEntity.setValue(model.post.sourceID, forKey: "sourceID")
            contentEntity.setValue(model.post.postTitle, forKey: "postTitle")
            contentEntity.setValue(model.post.date, forKey: "date")
            contentEntity.setValue(images, forKey: "images")
            
            // groupEntity.logo
            let entityForLogo = NSEntityDescription.entity(forEntityName: "PhotoModelEntity", in: self.managedContext!)!
            let logoEntity = NSManagedObject.init(entity: entityForLogo, insertInto: self.managedContext)
            logoEntity.setValue(model.group.groupLogo.localName, forKey: "localName")
            logoEntity.setValue(model.group.groupLogo.url, forKey: "url")
            
            // groupEntity
            let entityGroup = NSEntityDescription.entity(forEntityName: "GroupEntity", in: self.managedContext!)!
            let groupEntity = NSManagedObject.init(entity: entityGroup, insertInto: self.managedContext)
            groupEntity.setValue(model.group.groupTitle, forKey: "groupTitle")
            groupEntity.setValue(model.group.id, forKey: "id")
            groupEntity.setValue(logoEntity, forKey: "logo")
            
            // modelEntity
            
            let entityForModel = NSEntityDescription.entity(forEntityName: "ModelEntity", in: self.managedContext!)!
            let modelEntity = NSManagedObject.init(entity: entityForModel, insertInto: self.managedContext)
            modelEntity.setValue(contentEntity, forKey: "content")
            modelEntity.setValue(groupEntity, forKey: "group")
            
            do {
                print("save entity in context")
                try self.managedContext!.save()
                self.entityArray.append(modelEntity)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
//            print("id = \(contentEntity.value(forKey: "id")!)")
//            print("sourceID = \(contentEntity.value(forKey: "sourceID")!)")
//            print("postTitle = \(contentEntity.value(forKey: "postTitle")!)")
//            print("date = \(contentEntity.value(forKey: "date")!)")
        }
    }
    
    func getModelsFromCoreData() -> [Model] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ModelEntity")
        do {
            entityArray = try managedContext!.fetch(fetchRequest)
            return convert(entityArray: entityArray)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return [Model]()
    }
    
    func convert(entityArray: [NSManagedObject]) -> [Model] {
        var result = [Model]()
        for modelEntity in entityArray {
            // modelEntity
            let contentEntity = modelEntity.value(forKey: "content") as! NSManagedObject
            let contentModel = contentModelFrom(entity: contentEntity)
            
            // groupEntity
            let groupEntity = modelEntity.value(forKey: "group") as! NSManagedObject
            let groupModel = groupModelFrom(entity: groupEntity)
            
            let model = Model.init(post: contentModel, group: groupModel)
            result.append(model)
            //            print("id = \(id)\t sourceID = \(sourceID)\t date = \(date)\t title = \(postTitle)")
        }
        return result
    }
    
    func contentModelFrom(entity:NSManagedObject) -> ContentModel {
        let id = entity.value(forKey: "id") as! Int
        let sourceID = entity.value(forKey: "sourceID") as! Int
        let postTitle = entity.value(forKey: "postTitle") as! String
        let date = entity.value(forKey: "date") as! Int
        let imageSet = entity.value(forKey: "images") as! Set<NSManagedObject>
        // imageArray
        var photoModelArray = [PhotoModel]()
        for imageEntity in imageSet {
            let url = imageEntity.value(forKey: "url") as! URL
            let image = PhotoModel.init(url: url)
            photoModelArray.append(image)
        }
        let contentModel = ContentModel.init(sourceID: sourceID, date: date, title: postTitle, images: photoModelArray, id: id)
        return contentModel
    }
    
    func groupModelFrom(entity: NSManagedObject) -> GroupModel {
        let groupTitle = entity.value(forKey: "groupTitle") as! String
        let groupID = entity.value(forKey: "id") as! Int
        let logoEntity = entity.value(forKey: "logo") as! NSManagedObject
        let logoURL = logoEntity.value(forKey: "url") as! URL
        let logo = PhotoModel.init(url: logoURL)
        let groupModel = GroupModel.init(logo: logo, title: groupTitle, id: groupID)
        return groupModel
    }
    
    //    func convert(models: [Model]) -> [NSManagedObject] {
    //        return [NSManagedObject]()
    //    }
}
