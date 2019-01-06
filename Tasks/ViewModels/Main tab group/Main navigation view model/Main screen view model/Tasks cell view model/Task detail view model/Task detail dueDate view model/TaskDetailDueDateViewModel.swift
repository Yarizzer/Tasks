//
//  TaskDetailDueDateViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 18/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

class TaskDetailDueDateViewModel {
    private var task: Task
    init(withTask _task_: Task) {
        self.task = _task_
    }
}

extension TaskDetailDueDateViewModel: TaskDetailDueDateViewModelType {
    var currentDueDate: String {
        guard let _dueDate_ = task.dueDate as Date? else { return "No due date" }
        
        let timeZoneIdentifier = TimeZone.current.identifier
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm"
        dateFormatter.timeZone = TimeZone(identifier: timeZoneIdentifier)
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        return "Due date: \(dateFormatter.string(from: _dueDate_))"
    }
}
