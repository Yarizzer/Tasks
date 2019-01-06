//
//  TaskDetailListsViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol TaskDetailListsViewModelType {
    var numberOfLists: Int { get }
    func getTaskDetailListChooserCellModel(forIndex _index_: Int) -> TaskDetailListsCellViewModelType?
    func updateCurrentIndex(withIndex _index_: Int)
    func changeTaskList()
}
