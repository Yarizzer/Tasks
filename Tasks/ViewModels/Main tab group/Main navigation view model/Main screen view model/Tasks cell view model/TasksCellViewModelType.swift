//
//  TasksCellViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 08/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol TasksCellViewModelType: class {
    var taskTitle: String { get }
    var dueDateText: String { get }
    var dueTimeText: String { get }
    var importance: Int { get }
    var listName: String { get }
    var listImageName: String { get }
    var listIsPreferred: Bool { get }
    
    var listColorIndex: Int { get }
    
    var completed: Bool { get }
    
    func getDoneButtonViewModel() -> DoneButtonModelType?
    func getTimeLeftProgressViewModel() -> TimeLeftProgressViewModelType?
}
