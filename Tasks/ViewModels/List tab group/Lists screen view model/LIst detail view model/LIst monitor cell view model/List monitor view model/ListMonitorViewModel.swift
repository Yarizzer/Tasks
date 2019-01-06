//
//  ListMonitorViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 01/11/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class ListMonitorViewModel {
    var list: List
    init(forList _list_: List) {
        self.list = _list_
    }
    
}

extension ListMonitorViewModel: ListMonitorViewModelType {
    
}
