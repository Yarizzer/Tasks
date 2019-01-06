//
//  ListDatabaseManager.swift
//  Tasks
//
//  Created by Yarr!zzeR on 02/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import CoreData
import UIKit

class ListDatabaseManager {
    static let shared = ListDatabaseManager()
    private init() {}
    
    private func reorderListsInDatabase() {
        let arrayOfLists = getLists()
        var c = 0
        for _list_ in arrayOfLists {
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let context = delegate.persistentContainer.viewContext
            
            let fetchRequest: NSFetchRequest<List> = List.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "SELF == %@", _list_.objectID)
            do {
                let listItem = try context.fetch(fetchRequest).first
                listItem?.order = Int16(c)
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
            c += 1
        }
    }
    
    func getLists() -> [List] {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<List> = List.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "predeletionState = \(false)")
        
        var arrayToReturn = [List]()
        do {
            let arrayOfListsInDataBase = try context.fetch(fetchRequest)
            if arrayOfListsInDataBase.isEmpty {
                //creation a new list needs for first app lounching or to prevent 0 count of lists
                let listDemands = ListDemands(forList: nil, withTitle: "<Untitled list>", withImageName: "DefaultListImage", colorIndex: 0, preferredFlag: true, predeletionState: false, order: 0)
                arrayToReturn.append(performARecordForAList(withDemands: listDemands))
            } else {
                arrayToReturn = arrayOfListsInDataBase.sorted {$0.order < $1.order}
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return arrayToReturn
    }
    
    func performARecordForAList(withDemands _demands_: ListDemands) -> List {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        if let list = _demands_.list {
            let fetchRequest: NSFetchRequest<List> = List.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "SELF = %@", list.objectID)
            do {
                if let list = try context.fetch(fetchRequest).first {
                    list.title = _demands_.title
                    list.imageName = _demands_.imageName
                    list.colorIndex = Int16(_demands_.colorIndex)
                    list.order = Int16(_demands_.order)
                    list.predeletionState = _demands_.predeletionState
                    if _demands_.predeletionState {
                        list.predeletionMoment = NSDate()
                    } else {
                        list.predeletionMoment = nil
                    }
                    list.preferred = _demands_.preferred
                    try context.save()
                }
            } catch {
                print(error.localizedDescription)
            }
            return list
        } else {
            let list = NSEntityDescription.entity(forEntityName: "List", in: context)
            let listObject = NSManagedObject(entity: list!, insertInto: context) as! List
            listObject.title = _demands_.title
            let defaultListImageName = "DefaultListImage"
            listObject.imageName = defaultListImageName
            listObject.colorIndex = Int16(_demands_.colorIndex)
            listObject.order = Int16(_demands_.order)
            listObject.predeletionState = _demands_.predeletionState
            listObject.predeletionMoment = nil
            listObject.creationDate = NSDate()
            listObject.preferred = _demands_.preferred
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
            return listObject
        }
        
    }
    
    func changePreferredList(forList _list_: List) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<List> = List.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "preferred == \(true)")
        
        do {
            let res = try context.fetch(fetchRequest)
            for i in res {
                i.preferred = false
                try context.save()
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        fetchRequest.predicate = NSPredicate(format: "SELF = %@", _list_)
        
        do {
            if let list = try context.fetch(fetchRequest).first {
                list.preferred = true
            }
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func removeListRecordFromDatabase(forList _listObject_: List) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<List> = List.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "SELF = %@", _listObject_.objectID)
        
        do {
            guard let list = try context.fetch(fetchRequest).first else { return }
            let arrayOfTasks = list.taskRelationship?.allObjects as! [Task]
            for _task_ in arrayOfTasks {
                TaskDatabaseManager.shared.removeTaskRecordFromDatabase(forTask: _task_)
            }
            context.delete(list)
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        reorderListsInDatabase()
    }
    
    func getPreferredList() -> List? {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<List> = List.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "preferred == \(true)")
        var listToReturn: List?
        do {
            if let preferredList = try context.fetch(fetchRequest).first {
                listToReturn = preferredList
            } else {
                let listDemands = ListDemands(forList: nil, withTitle: "<Untitled list>", withImageName: "DefaultListImage", colorIndex: 0, preferredFlag: true, predeletionState: false, order: 0)
                listToReturn = performARecordForAList(withDemands: listDemands)
            }
        } catch {
            print(error.localizedDescription)
        }
        return listToReturn
    }
}
