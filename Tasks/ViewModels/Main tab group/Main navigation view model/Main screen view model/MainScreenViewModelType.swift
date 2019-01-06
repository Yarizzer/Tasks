//
//  MainScreenViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 08/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol MainScreenViewModelType: class {
    func updateCurrentIndex(withIndex _index_: Int?)
    func updateCurrentIndexForFilteredItems(withIndex _index_: Int?)
    var tasksCount: Int { get }
    var filteredTasksCount: Int { get }
    func updateFilteredTasks(withText _text_: String, scope _scope_: String)
    func getScopeNames() -> [String]
    func getTasksCellModel(forIndex _index_: Int) -> TasksCellViewModelType
    func getFilteredTasksCellModel(forIndex _index_: Int) -> TasksCellViewModelType
    func getTaskDetailViewModel() -> TaskDetailViewModelType?
    func getTaskDetailViewModelForFilteredItems() -> TaskDetailViewModelType?
    func updateTasks()
    func moveTaskRecordToTrash()
}
