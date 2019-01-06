//
//  TaskDetailImportanceCellViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 16/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol TaskDetailImportanceCellViewModelType {
    var taskImportance: Int { get }
    func changeImportance(withValue _newValue_: Int)

}
