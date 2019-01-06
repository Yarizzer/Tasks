//
//  MainScreenViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 08/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

class MainScreenViewModel {
    private var arrayOfTasks: [Task]
    private var filteredTasks: [Task]
    private var currentIndex: Int?
    private var currentIndexForFilteredItems: Int?
    init() {
        self.arrayOfTasks = MainDatabaseManager.shared.getTasksFromDatabase()
        self.filteredTasks = arrayOfTasks
    }
}

extension MainScreenViewModel: MainScreenViewModelType {
    
    func updateCurrentIndex(withIndex _index_: Int?) {
        currentIndex = _index_
    }
    
    func updateCurrentIndexForFilteredItems(withIndex _index_: Int?) {
        currentIndexForFilteredItems = _index_
    }
    
    var tasksCount: Int {
        return arrayOfTasks.count
    }
    
    var filteredTasksCount: Int {
        return filteredTasks.count
    }
    
    func updateFilteredTasks(withText _text_: String, scope _scope_: String) {
        filteredTasks = arrayOfTasks.filter({(task : Task) -> Bool in
            let doesCategoryMatch = (_scope_ == "All") || (_scope_ == "In progress" && !task.completed)
            let adoptToSearchTagsText = ("\(_text_)").replacingOccurrences(of: " ", with: "#")
            return doesCategoryMatch && task.searchTags.lowercased().contains(adoptToSearchTagsText.lowercased())
//            return doesCategoryMatch && task.searchTags.lowercased().contains(_text_.lowercased())
        })
    }
    
    func getScopeNames() -> [String] {
        return Constants.scopeNames
    }
    
    func getTasksCellModel(forIndex _index_: Int) -> TasksCellViewModelType {
        return TasksCellViewModel(forTask: arrayOfTasks[_index_])
    }
    
    func getFilteredTasksCellModel(forIndex _index_: Int) -> TasksCellViewModelType {
        return TasksCellViewModel(forTask: filteredTasks[_index_])
    }
    
    func getTaskDetailViewModel() -> TaskDetailViewModelType? {
        if let _index_ = currentIndex {
            return TaskDetailViewModel(forTask: arrayOfTasks[_index_])
        } else {
            guard let preferredList = MainDatabaseManager.shared.getPreferredList() else { return nil }
            let demands = TaskDemands(forList: preferredList, forTask: nil, withTitle: "<Untitled task>", withDescription: "", taskCompleted: false, completionDate: nil, importance: 0, predeletionState: false, dueDate: nil)
            MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
            updateTasks()

            return TaskDetailViewModel(forTask: arrayOfTasks.last)
        }
    }
    
    func getTaskDetailViewModelForFilteredItems() -> TaskDetailViewModelType? {
        if let _index_ = currentIndexForFilteredItems {
            return TaskDetailViewModel(forTask: filteredTasks[_index_])
        } else {
            guard let preferredList = MainDatabaseManager.shared.getPreferredList() else { return nil }
            let demands = TaskDemands(forList: preferredList, forTask: nil, withTitle: "<Untitled task>", withDescription: "", taskCompleted: false, completionDate: nil, importance: 0, predeletionState: false, dueDate: nil)
            MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
            updateTasks()
            
            return TaskDetailViewModel(forTask: arrayOfTasks.last)
        }
    }
    
    func updateTasks() {
        arrayOfTasks = MainDatabaseManager.shared.getTasksFromDatabase()
    }
    
    func moveTaskRecordToTrash() {
        guard let _currentIndex_ = currentIndex else { return }
        let taskObject = arrayOfTasks[_currentIndex_]
        let demands = TaskDemands(forList: taskObject.listRelationship, forTask: taskObject, withTitle: taskObject.taskTitle, withDescription: taskObject.taskDescription, taskCompleted: taskObject.completed, completionDate: taskObject.completionDate as Date?, importance: Int(taskObject.importance), predeletionState: true, dueDate: taskObject.dueDate as Date?)
        MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
        updateTasks()
    }
    
}

extension MainScreenViewModel {
    private struct Constants {
        static let scopeNames = ["All", "In progress"]
    }
}
