//
//  TrashCellViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class TrashCellViewModel {
    private var task: Task
    init(forTask _task_: Task) {
        self.task = _task_
    }
}

extension TrashCellViewModel: TrashCellViewModelType {
    var taskTitle: String {
        return task.taskTitle
    }
    
    var taskImportance: String {
        switch task.importance {
        case 0: return "--"
        case 1: return "!"
        case 2: return "!!"
        case 3: return "!!!"
        default: return ""
        }
    }
    
    var listTitle: String {
        return task.listRelationship.title
    }
    
    var listImageName: String {
        return task.listRelationship.imageName
    }
    
    var listColorIndex: Int {
        return Int(task.listRelationship.colorIndex)
    }
}
