//
//  PreferredButtonViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 12/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class PreferredButtonViewModel {
    private var list: List
    private var preferred: Bool
    init(withList _list_: List) {
        self.list = _list_
        self.preferred = _list_.preferred
    }
}

extension PreferredButtonViewModel: PreferredButtonViewModelType {
    var listIsPreferred: Bool {
        return list.preferred
    }
    
    func changePreferredState() {
        MainDatabaseManager.shared.changePreferredList(forList: list)
    }
}
