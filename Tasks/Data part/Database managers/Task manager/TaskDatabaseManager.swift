//
//  TaskDatabaseManger.swift
//  Tasks
//
//  Created by Yarr!zzeR on 02/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit
import CoreData

class TaskDatabaseManager {
    static let shared = TaskDatabaseManager()
    private init() {}
    
    //MARK: - Main group section
    func getTasks() -> [Task] {
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "predeletionState = \(false)")
        
        var arrayToReturn = [Task]()
        do {
            let arrayOfTasksInDataBase = try context.fetch(fetchRequest)
            arrayToReturn = arrayOfTasksInDataBase
        } catch {
            print(error.localizedDescription)
        }
        return arrayToReturn
        
    }
    
    func getTasks(forList _list_: List) -> [Task] {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "listRelationship = %@", _list_)
        
        var arrayToReturn = [Task]()
        do {
            let arrayOfTasks = try context.fetch(fetchRequest)
            arrayToReturn = arrayOfTasks
        } catch {
            print(error.localizedDescription)
        }
        return arrayToReturn
    }
    
    func getTask(withId _id_: String) -> Task? {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        //        fetchRequest.predicate = NSPredicate(format: "SELF = %@", arguments: pointer)
        //        fetchRequest.predicate = NSPredicate(format: "SELF = %@", context.)

        var taskToReturn: Task?
        if let objectIDURL = URL(string: _id_),
            let coordinator: NSPersistentStoreCoordinator = context.persistentStoreCoordinator,
            let managedOblectId = coordinator.managedObjectID(forURIRepresentation: objectIDURL) {
            
            fetchRequest.predicate = NSPredicate(format: "SELF = %@", managedOblectId)

            do {
                let task = try context.fetch(fetchRequest).first
                taskToReturn = task
                
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }
        return taskToReturn
    }
    
    func performARecordForATask(withDemands _demands_: TaskDemands) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        if let task = _demands_.task {
            let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "SELF = %@", task.objectID)
            do {
                if let task = try context.fetch(fetchRequest).first {

                    task.listRelationship = _demands_.listRelationship
                    task.taskTitle = _demands_.taskTitle
                    task.taskDescription = _demands_.description
                    task.importance = Int16(_demands_.importance)
                    task.completed = _demands_.completed
                    if let _completionDate_ = _demands_.completionDate {
                        task.completionDate = _completionDate_ as NSDate?
                    } else {
                        task.completionDate = nil
                    }
                    task.predeletionState = _demands_.predeletionState
                    if _demands_.predeletionState {
                        task.predeletionMoment = NSDate()
                    } else {
                        task.predeletionMoment = nil
                    }
                    task.dueDate = _demands_.dueDate as NSDate?
                    let searchTags = ("#\(_demands_.taskTitle)").replacingOccurrences(of: " ", with: "#")
                    task.searchTags = searchTags

                    try context.save()
                }
            } catch {
                print(error.localizedDescription)
            }
        } else {
            let task = NSEntityDescription.entity(forEntityName: "Task", in: context)
            let taskObject = NSManagedObject(entity: task!, insertInto: context) as! Task
            taskObject.listRelationship = _demands_.listRelationship
            taskObject.taskTitle = _demands_.taskTitle
            taskObject.taskDescription = _demands_.description
            taskObject.completed = _demands_.completed
            taskObject.completionDate = nil
            taskObject.predeletionState = _demands_.predeletionState
            taskObject.predeletionMoment = nil
            taskObject.creationDate = NSDate()
            let searchTags = ("#\(_demands_.taskTitle)").replacingOccurrences(of: " ", with: "#")
            taskObject.searchTags = searchTags
            if let dueDate = _demands_.dueDate {
                taskObject.dueDate = dueDate as NSDate
            }
            taskObject.importance = Int16(_demands_.importance)
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func removeTaskRecordFromDatabase(forTask _taskObject_: Task) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "SELF = %@", _taskObject_.objectID)
        
        do {
            guard let task = try context.fetch(fetchRequest).first else { return }
            context.delete(task)
            try context.save()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    //MARK: - Trash group section
    
    func getPredeletedTasks() -> [Task] {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "predeletionState = \(true)")
        
        var arrayToReturn = [Task]()
        do {
            let arrayOfTasksInDataBase = try context.fetch(fetchRequest)
            arrayToReturn = arrayOfTasksInDataBase
        } catch {
            print(error.localizedDescription)
        }
        return arrayToReturn
    }
    
    //MARK: - Removing predeleted records (30 days and older by default)
    
//    func removePredeletedRecordsFromDatabase() {
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        let context = delegate.persistentContainer.viewContext
//        
//        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
////        fetchRequest.predicate = NSPredicate(format: "predeletionMoment > %@", arguments: NSDate())
//        
//        do {
//            let tasks = try context.fetch(fetchRequest)
//            if !tasks.isEmpty {
//                for i in tasks {
////                    if i.predeletionMoment?.addingTimeInterval(TimeInterval(60)) as? Date > Date() {
////                        print("record to delete")
////                    }
//                }
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
}
