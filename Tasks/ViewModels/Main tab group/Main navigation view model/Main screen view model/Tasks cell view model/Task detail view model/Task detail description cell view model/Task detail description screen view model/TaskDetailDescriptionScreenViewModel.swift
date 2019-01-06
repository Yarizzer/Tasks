//
//  TaskDetailDescriptionScreenViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 17/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

class TaskDetailDescriptionScreenViewModel {
    private var task: Task
    init(forTask _task_: Task) {
        self.task = _task_
    }
}

extension TaskDetailDescriptionScreenViewModel: TaskDetailDescriptionScreenViewModelType {
    
    var description: String {
        return task.taskDescription
    }
    
    func updateTaskRecord(withDescription _description_: String) {
        let demands = TaskDemands(forList: task.listRelationship, forTask: task, withTitle: task.taskTitle, withDescription: _description_, taskCompleted: task.completed, completionDate: task.completionDate as Date?, importance: Int(task.importance), predeletionState: task.predeletionState, dueDate: task.dueDate as Date?)
        MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
    }
}
