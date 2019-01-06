//
//  TaskDetailListCellViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 23/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class TaskDetailListCellViewModel {
    private var task: Task
    init(forTask _task_: Task) {
        self.task = _task_
    }
}

extension TaskDetailListCellViewModel: TaskDetailListCellViewModelType {
    var listName: String {
        return task.listRelationship.title
    }
    var listImageName: String {
        return task.listRelationship.imageName
    }
    
    var listColorIndex: Int {
        return Int(task.listRelationship.colorIndex)
    }
}
