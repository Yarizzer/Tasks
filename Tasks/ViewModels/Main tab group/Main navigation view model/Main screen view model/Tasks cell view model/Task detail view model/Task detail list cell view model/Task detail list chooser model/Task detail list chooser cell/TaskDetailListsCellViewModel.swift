//
//  TaskDetailListsCellViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 25/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class TaskDetailListsCellViewModel {
    private var list: List
    init(forList _list_: List) {
        self.list = _list_
    }
}

extension TaskDetailListsCellViewModel: TaskDetailListsCellViewModelType {
    var listName: String {
        return list.title
    }
    
    var listImageName: String {
        return list.imageName
    }
    
    var listColorIndex: Int {
        return Int(list.colorIndex)
    }
    
    var isPreffered: Bool {
        return list.preferred
    }
}
