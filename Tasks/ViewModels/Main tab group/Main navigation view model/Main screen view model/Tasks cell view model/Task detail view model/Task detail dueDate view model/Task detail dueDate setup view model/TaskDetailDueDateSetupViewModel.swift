//
//  TaskDetailDueDateSetupViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 18/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation
import UserNotifications

class TaskDetailDueDateSetupViewModel {
    let notification = Notifications()
    var task: Task
    init(withTask _task_: Task) {
        self.task = _task_
    }
}

extension TaskDetailDueDateSetupViewModel: TaskDetailDueDateSetupViewModelType {
    
    var dueDate: Date? {
        guard let _date_ = task.dueDate else { return nil }
        return _date_ as Date
    }
    
    func updateTaskRecord(withDueDate _dueDate_: Date?) {
        let demands = TaskDemands(forList: task.listRelationship, forTask: task, withTitle: task.taskTitle, withDescription: task.taskDescription, taskCompleted: task.completed, completionDate: task.completionDate as Date?, importance: Int(task.importance), predeletionState: task.predeletionState, dueDate: _dueDate_)
        MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
        notification.scheduleNotification(forTask: task)
    }
    
    func setNotification() {
        notification.requestAuthorization()
    }
    
}
