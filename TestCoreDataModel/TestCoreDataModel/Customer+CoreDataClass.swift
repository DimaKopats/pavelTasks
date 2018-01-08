//
//  Customer+CoreDataClass.swift
//  TestCoreDataModel
//
//  Created by Dzmitry Kopats on 1/4/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Customer)
public class Customer: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "Customer"), insertInto: CoreDataManager.instance.persistentContainer.viewContext)
    }
}
