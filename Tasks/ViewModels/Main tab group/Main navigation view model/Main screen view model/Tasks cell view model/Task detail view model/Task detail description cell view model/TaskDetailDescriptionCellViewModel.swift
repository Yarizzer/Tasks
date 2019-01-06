//
//  TaskDetailDescriptionCellViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 17/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class TaskDetailDescriptionCellViewModel {
    private var task: Task
    init(forTask _task_: Task) {
        self.task = _task_
    }
}

extension TaskDetailDescriptionCellViewModel: TaskDetailDescriptionCellViewModelType {
    var description: String {
        return task.taskDescription
    }
    
    func getTaskDetailDescriptionScreenViewModel() -> TaskDetailDescriptionScreenViewModelType {
        return TaskDetailDescriptionScreenViewModel(forTask: task)
    }
}
