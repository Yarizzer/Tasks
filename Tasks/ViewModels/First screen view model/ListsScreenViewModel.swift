//
//  ListsViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 08/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

class ListsScreenViewModel {
    private var arrayOfLists: [List]
    private var currentIndex: Int?
    init() {
        self.arrayOfLists = MainDatabaseManager.shared.getListsFromDatabase()
    }
}

extension ListsScreenViewModel: ListsScreenViewModelType {
    //MARK: - Common properties
    var headerHeight: Float {
        return Constants.headresHeight
    }
    
    func numberOfLists() -> Int {
        return arrayOfLists.count
    }
    
    func updateListsCurrentIndex(withIndex _index_: Int) {
        currentIndex = _index_
    }
    
    func getListCellViewModel(forIndex _index_: Int) -> ListsCellViewModelType {
        return ListsCellViewModel(forList: arrayOfLists[_index_])
    }
    
    func getListDetailViewModel() -> ListDetailViewModelType {
        guard let _currentIndex_ = currentIndex else { return ListDetailViewModel(forList: arrayOfLists.last!) }
        return ListDetailViewModel(forList: arrayOfLists[_currentIndex_])
    }
    
    //MARK: - Database section
    func moveListRecordToTrash() {
        guard let _currentIndex_ = currentIndex else { return }
        let listObject = arrayOfLists[_currentIndex_]
        let listTasks = MainDatabaseManager.shared.getTasks(forList: listObject)
        if !listTasks.isEmpty {
            for task in listTasks {
                let demands = TaskDemands(forList: task.listRelationship, forTask: task, withTitle: task.taskTitle, withDescription: task.taskDescription, taskCompleted: task.completed, completionDate: task.completionDate as Date?, importance: Int(task.importance), predeletionState: true, dueDate: task.dueDate as Date?)
                MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
            }
            let demands = ListDemands(forList: listObject, withTitle: listObject.title, withImageName: listObject.imageName, colorIndex: Int(listObject.colorIndex), preferredFlag: listObject.preferred, predeletionState: true, order: Int(listObject.order))
            MainDatabaseManager.shared.performAListRecord(withDemends: demands)
        } else {
            MainDatabaseManager.shared.removeListRecordFromDatabase(forObject: listObject)
        }
        
        
        updateListsArray()
    }
    
    func addNewListInDatabase(withTitle _listTitle_: String) {
        let demands = ListDemands(forList: nil, withTitle: _listTitle_, withImageName: "DefaultListImage", colorIndex: 0, preferredFlag: false, predeletionState: false, order: arrayOfLists.count)
        MainDatabaseManager.shared.performAListRecord(withDemends: demands)
        updateListsArray()
    }
    
    func updateListsArray() {
        arrayOfLists = MainDatabaseManager.shared.getListsFromDatabase()
    }
    
    //MARK: - Supporting section
    
    func preferredList(withIndex _index_: Int) -> Bool {
        return arrayOfLists[_index_].preferred
    }
}

extension ListsScreenViewModel {
    private struct Constants {
        static let headresHeight: Float = 0.0
    }
}
