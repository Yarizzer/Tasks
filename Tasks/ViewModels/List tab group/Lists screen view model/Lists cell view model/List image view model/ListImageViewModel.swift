//
//  ListImageViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 20/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class ListImageViewModel {
    var list: List
    init(withList _list_: List) {
        self.list = _list_
    }
}

extension ListImageViewModel: ListImageViewModelType {
    var imageName: String {
        return list.imageName
    }
    var colorIndex: Int {
        return Int(list.colorIndex)
    }
}
