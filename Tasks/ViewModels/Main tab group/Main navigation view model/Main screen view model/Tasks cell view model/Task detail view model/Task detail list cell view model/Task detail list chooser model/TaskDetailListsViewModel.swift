//
//  TaskDetailListsViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

class TaskDetailListsViewModel {
    private var task: Task
    private var lists: [List]
    private var currentIndex: Int?
    init(forTask _task_: Task) {
        self.task = _task_
        self.lists = MainDatabaseManager.shared.getListsFromDatabase()
    }
}

extension TaskDetailListsViewModel: TaskDetailListsViewModelType {
    var numberOfLists: Int {
        return lists.count
    }
    
    func getTaskDetailListChooserCellModel(forIndex _index_: Int) -> TaskDetailListsCellViewModelType? {
        return TaskDetailListsCellViewModel(forList: lists[_index_])
    }
    
    func updateCurrentIndex(withIndex _index_: Int) {
        currentIndex = _index_
    }
    
    func changeTaskList() {
        guard let _currentIndex_ = currentIndex else { return }
        let demands = TaskDemands(forList: lists[_currentIndex_], forTask: task, withTitle: task.taskTitle, withDescription: task.taskDescription, taskCompleted: task.completed, completionDate: task.completionDate as Date?, importance: Int(task.importance), predeletionState: task.predeletionState, dueDate: task.dueDate as Date?)
        MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
    }
}
