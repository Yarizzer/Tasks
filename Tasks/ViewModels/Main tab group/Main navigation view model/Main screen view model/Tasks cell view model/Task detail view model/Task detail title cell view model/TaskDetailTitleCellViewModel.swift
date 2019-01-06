//
//  TaskDetailTitleCellViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 15/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class TaskDetailTitleCellViewModel {
    private var task: Task?
    init(forTask _task_: Task) {
        self.task = _task_
    }
}

extension TaskDetailTitleCellViewModel: TaskDetailTitleCellViewModelType {
    var taskTitle: String {
        guard let _taskTitle_ = task?.taskTitle else { return "" }
        return _taskTitle_
    }
}
