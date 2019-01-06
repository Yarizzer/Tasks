//
//  TrashScreenViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol TrashScreenViewModelType {
    var tasksCount: Int { get }
    func updateTasks()
    func updateCurrentIndex(withIndex _index_: Int)
    func getTrashCellViewModel(forIndex _index_: Int) -> TrashCellViewModelType?
    
    func removeTaskFromDatabase()
    func putTaskBack()
}
