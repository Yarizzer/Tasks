//
//  TaskDetailDueDateSetupViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 18/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

protocol TaskDetailDueDateSetupViewModelType {
    var dueDate: Date? { get }
    func updateTaskRecord(withDueDate _dueDate_: Date?)
    func setNotification()
//    var userPermission: Bool { get }
}
