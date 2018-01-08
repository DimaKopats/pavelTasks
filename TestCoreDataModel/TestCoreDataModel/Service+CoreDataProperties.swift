//
//  Service+CoreDataProperties.swift
//  TestCoreDataModel
//
//  Created by Dzmitry Kopats on 1/4/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//
//

import Foundation
import CoreData


extension Service {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Service> {
        return NSFetchRequest<Service>(entityName: "Service")
    }

    @NSManaged public var info: String?
    @NSManaged public var name: String?
    @NSManaged public var rowsOfOrder: NSSet?

}

// MARK: Generated accessors for rowsOfOrder
extension Service {

    @objc(addRowsOfOrderObject:)
    @NSManaged public func addToRowsOfOrder(_ value: RowOfOrder)

    @objc(removeRowsOfOrderObject:)
    @NSManaged public func removeFromRowsOfOrder(_ value: RowOfOrder)

    @objc(addRowsOfOrder:)
    @NSManaged public func addToRowsOfOrder(_ values: NSSet)

    @objc(removeRowsOfOrder:)
    @NSManaged public func removeFromRowsOfOrder(_ values: NSSet)

}
