//
//  ListsCellViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 08/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class ListsCellViewModel {
    private var list: List?
    private var listTasks: [Task]
    init(forList _list_: List) {
        self.list = _list_
        listTasks = MainDatabaseManager.shared.getTasks(forList: _list_)
    }
}
extension ListsCellViewModel: ListsCellViewModelType {
    var listTitle: String {
        guard let _listTitle_ = list?.title else { return "" }
        return _listTitle_
    }
    
    var colorIndex: Int {
        guard let _list_ = list else { return 0 } // default color
        return Int(_list_.colorIndex)
    }
    
    var preferred: Bool {
        guard let _list_ = list else { return false }
        return _list_.preferred
    }
    
    var completeRange: String {
        var complete = 0
        var allTasks = 0
        for i in listTasks {
            if i.completed{
                complete += 1
            }
            allTasks += 1
        }
        return "\(complete)/\(allTasks)"
    }
    
    
    func getPreferredButtonViewModel() -> PreferredButtonViewModelType? {
        guard let _list_ = list else { return nil}
        return PreferredButtonViewModel(withList: _list_)
    }
    
    func getListImageViewModel() -> ListImageViewModelType? {
        guard let _list_ = list else { return nil }
        return ListImageViewModel(withList: _list_)
    }
}
