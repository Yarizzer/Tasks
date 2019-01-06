//
//  Task+CoreDataProperties.swift
//  Tasks
//
//  Created by Yarr!zzeR on 03/11/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var creationDate: NSDate
    @NSManaged public var dueDate: NSDate?
    @NSManaged public var importance: Int16
    @NSManaged public var predeletionMoment: NSDate?
    @NSManaged public var predeletionState: Bool
    @NSManaged public var searchTags: String
    @NSManaged public var taskDescription: String
    @NSManaged public var taskTitle: String
    @NSManaged public var completionDate: NSDate?
    @NSManaged public var listRelationship: List

}
