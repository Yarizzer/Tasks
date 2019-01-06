//
//  TimeLeftProgressViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 19/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

class TimeLeftProgressViewModel {
    private var task: Task
    init(forTask _task_: Task) {
        self.task = _task_
    }
}

extension TimeLeftProgressViewModel: TimeLeftProgressViewModelType {
    var taskCompleted: Bool {
        return task.completed
    }
    
    var currentProgressValue: Float {
        guard let _dueDate_ = task.dueDate else { return 0 }
        let creationMoment = task.creationDate as Date
        let timeInterval = creationMoment.timeIntervalSince(_dueDate_ as Date)
        let interavalSinceCreation = creationMoment.timeIntervalSinceNow
        let valToReturn = interavalSinceCreation / timeInterval
        return Float(valToReturn)
    }
}
