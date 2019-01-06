//
//  AppViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 03/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class AppViewModel {
    let mainNavigationViewModel: MainNavigationViewModelType?
    let listNavigationViewModel: ListsNavigationViewModelType?
    let trashNavigationViewModel: TrashNavigationViewModelType?
    
//    private func removePredeletedRecords() {
//        MainDatabaseManager.shared.removePredeletedRecords()
//    }
    
    init() {
        self.mainNavigationViewModel = MainNavigationViewModel()
        self.trashNavigationViewModel = TrashNavigationViewModel()
        self.listNavigationViewModel = ListsNavigationViewModel()
//        self.removePredeletedRecords()
    }
}

extension AppViewModel: AppViewModelType {
    func getModelForMainNavigationVC() -> MainNavigationViewModelType? {
        guard let _mainNavigationModel_ = mainNavigationViewModel else { return nil }
        return _mainNavigationModel_
    }
    
    func getModelForListsNavigationVC() -> ListsNavigationViewModelType? {
        guard let _listNavigationViewModel_ = listNavigationViewModel else { return nil }
        return _listNavigationViewModel_
    }
    
    func getModelForTrashNavigationVC() -> TrashNavigationViewModelType? {
        guard let _trashNavigationModel_ = trashNavigationViewModel else { return nil }
        return _trashNavigationModel_
    }
    
}
