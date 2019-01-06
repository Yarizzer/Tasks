//
//  TasksCellViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 08/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

class TasksCellViewModel {
    private var task: Task
    
    init(forTask _task_: Task) {
        self.task = _task_
    }
    
}

extension TasksCellViewModel: TasksCellViewModelType {
    var taskTitle: String {
        return task.taskTitle
    }
    
    var dueDateText: String {
        guard let _dueDate_ = task.dueDate as Date? else { return "No due date" }
        
        let timeZoneIdentifier = TimeZone.current.identifier
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone(identifier: timeZoneIdentifier)
        dateFormatter.dateStyle = .medium
        //        dateFormatter.timeStyle = .medium
        
        return "Due date: \(dateFormatter.string(from: _dueDate_))"
    }
    
    var dueTimeText: String {
        guard let _dueDate_ = task.dueDate as Date? else { return "" }
        
        let timeZoneIdentifier = TimeZone.current.identifier
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        dateFormatter.timeZone = TimeZone(identifier: timeZoneIdentifier)
        //        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        return "Due time: \(dateFormatter.string(from: _dueDate_))"
    }
    
    var importance: Int {
        return Int(task.importance)
    }
    
    var listName: String {
        return task.listRelationship.title
    }
    
    var listImageName: String {
        return task.listRelationship.imageName
    }
    
    var listColorIndex: Int {
        return Int(task.listRelationship.colorIndex)
    }
    
    var listIsPreferred: Bool {
        return task.listRelationship.preferred
    }
    
    var completed: Bool {
        return task.completed
    }
    
    func getDoneButtonViewModel() -> DoneButtonModelType? {
        return DoneButtonModel(withTask: task)
    }
    
    func getTimeLeftProgressViewModel() -> TimeLeftProgressViewModelType? {
        return TimeLeftProgressViewModel(forTask: task)
    }

}
