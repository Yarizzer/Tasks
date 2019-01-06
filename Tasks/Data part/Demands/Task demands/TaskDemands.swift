//
//  TaskDemands.swift
//  Tasks
//
//  Created by Yarr!zzeR on 12/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

class TaskDemands {
    let listRelationship: List
    let task: Task?
    let taskTitle: String
    let description: String
    let completed: Bool
    let completionDate: Date?
    let importance: Int
    let predeletionState: Bool
    let dueDate: Date?
    
    init(forList _list_: List, forTask _task_: Task?, withTitle _title_: String, withDescription _description_: String, taskCompleted _completed_: Bool, completionDate _completionDate_: Date? , importance _importance_: Int,predeletionState _predeletionState_: Bool, dueDate _dueDate_: Date?) {
        self.listRelationship = _list_
        self.task = _task_
        self.taskTitle = _title_
        self.description = _description_
        self.completed = _completed_
        self.completionDate = _completionDate_
        self.importance = _importance_
        self.predeletionState = _predeletionState_
        self.dueDate = _dueDate_
    }

}
