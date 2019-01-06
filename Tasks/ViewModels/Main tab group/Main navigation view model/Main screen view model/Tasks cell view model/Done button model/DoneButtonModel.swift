//
//  DoneButtonModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 18/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

class DoneButtonModel {
    private let notification = Notifications()
    private var task: Task
    init(withTask _task_: Task) {
        self.task = _task_
    }
}

extension DoneButtonModel: DoneButtonModelType {
    var completedState: Bool {
        return task.completed
    }
    
    func changeCompletedState() {
        let newCompletedValue = !task.completed
        let completionDateValue = newCompletedValue ? Date() : nil
        let demands = TaskDemands(forList: task.listRelationship, forTask: task, withTitle: task.taskTitle, withDescription: task.taskDescription, taskCompleted: newCompletedValue, completionDate: completionDateValue, importance: Int(task.importance), predeletionState: task.predeletionState, dueDate: task.dueDate as Date?)
        MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
        notification.removeNotifications(forTask: task)
    }
}
