//
//  List+CoreDataProperties.swift
//  Tasks
//
//  Created by Yarr!zzeR on 25/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var colorIndex: Int16
    @NSManaged public var creationDate: NSDate
    @NSManaged public var imageName: String
    @NSManaged public var order: Int16
    @NSManaged public var predeletionState: Bool
    @NSManaged public var preferred: Bool
    @NSManaged public var title: String
    @NSManaged public var predeletionMoment: NSDate?
    @NSManaged public var taskRelationship: NSSet?

}

// MARK: Generated accessors for taskRelationship
extension List {

    @objc(addTaskRelationshipObject:)
    @NSManaged public func addToTaskRelationship(_ value: Task)

    @objc(removeTaskRelationshipObject:)
    @NSManaged public func removeFromTaskRelationship(_ value: Task)

    @objc(addTaskRelationship:)
    @NSManaged public func addToTaskRelationship(_ values: NSSet)

    @objc(removeTaskRelationship:)
    @NSManaged public func removeFromTaskRelationship(_ values: NSSet)

}
