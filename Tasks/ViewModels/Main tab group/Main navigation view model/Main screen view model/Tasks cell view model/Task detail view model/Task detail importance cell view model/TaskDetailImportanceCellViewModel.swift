//
//  TaskDetailImportanceCellViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 16/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

class TaskDetailImportanceCellViewModel {
    private var task: Task?
    init(fortask _task_: Task) {
        self.task = _task_
    }
}

extension TaskDetailImportanceCellViewModel: TaskDetailImportanceCellViewModelType {
    var taskImportance: Int {
        guard let _importance_ = task?.importance else { return 0 }
        return Int(_importance_)
    }
    
    func changeImportance(withValue _newValue_: Int) {
        guard let _task_ = task else { return }
        let demands = TaskDemands(forList: _task_.listRelationship, forTask: _task_, withTitle: _task_.taskTitle, withDescription: _task_.taskDescription, taskCompleted: _task_.completed, completionDate: task?.completionDate as Date?, importance: _newValue_, predeletionState: _task_.predeletionState, dueDate: _task_.dueDate as Date?)
        MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
    }
    

}
