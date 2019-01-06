//
//  TrashScreenViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

class TrashScreenViewModel {
    private var tasksArray: [Task]
    private var currentIndex: Int?
    init() {
        self.tasksArray = MainDatabaseManager.shared.getPredeletedTasksFromDataBase()
    }
}

extension TrashScreenViewModel: TrashScreenViewModelType {
    var tasksCount: Int {
        return tasksArray.count
    }
    
    func updateTasks() {
        tasksArray = MainDatabaseManager.shared.getPredeletedTasksFromDataBase()
    }
    
    func updateCurrentIndex(withIndex _index_: Int) {
        currentIndex = _index_
    }
    
    func getTrashCellViewModel(forIndex _index_: Int) -> TrashCellViewModelType? {
        return TrashCellViewModel(forTask: tasksArray[_index_])
        
    }
    
    func removeTaskFromDatabase() {
        guard let _currentIndex_ = currentIndex else { return }
        let taskToDelete = tasksArray[_currentIndex_]
        let taskList = taskToDelete.listRelationship
        MainDatabaseManager.shared.removeTaskRecordFromDatabase(forObject: taskToDelete)
        updateTasks()
        if MainDatabaseManager.shared.getTasks(forList: taskList).isEmpty {
            MainDatabaseManager.shared.removeListRecordFromDatabase(forObject: taskList)
        }
    }
    func putTaskBack() {
        guard let _currentIndex_ = currentIndex else { return }
        let task = tasksArray[_currentIndex_]
        if task.listRelationship.predeletionState {
            let list = task.listRelationship
            let listDemands = ListDemands(forList: list, withTitle: list.title, withImageName: list.imageName, colorIndex: Int(list.colorIndex), preferredFlag: list.preferred, predeletionState: false, order: Int(list.order))
            let _ = ListDatabaseManager.shared.performARecordForAList(withDemands: listDemands)
            
        }
        let demands = TaskDemands(forList: task.listRelationship, forTask: task, withTitle: task.taskTitle, withDescription: task.taskDescription, taskCompleted: task.completed, completionDate: task.completionDate as Date?, importance: Int(task.importance), predeletionState: false, dueDate: task.dueDate as Date?)
        MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
        updateTasks()
    }
}
