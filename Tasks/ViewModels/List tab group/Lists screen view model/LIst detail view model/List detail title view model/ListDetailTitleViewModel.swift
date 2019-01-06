//
//  ListDetailTitleViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 10/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class ListDetailTitleViewModel {
    private var list: List?
    init(forList _list_: List) {
        self.list = _list_
    }
}

extension ListDetailTitleViewModel: ListDetailTitleViewModelType {
    var title: String {
        guard let _title_ = list?.title else { return "" }
        return _title_
    }
    
    var listImageName: String {
        guard let _list_ = list else { return "DefaultListImage" }
        return _list_.imageName
    }
    
    var listColorIndex: Int {
        guard let _list_ = list else { return 0 }
        return Int(_list_.colorIndex)
    }
    
    func setNewValueForTitle(newValue _title_: String) {
        guard let _list_ = list else { return }
        let demands = ListDemands(forList: _list_, withTitle: _title_, withImageName: _list_.imageName, colorIndex: Int(_list_.colorIndex), preferredFlag: _list_.preferred, predeletionState: _list_.predeletionState, order: Int(_list_.order))
        MainDatabaseManager.shared.performAListRecord(withDemends: demands)
    }
}
