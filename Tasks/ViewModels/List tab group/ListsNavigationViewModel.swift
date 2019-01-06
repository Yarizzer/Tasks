//
//  ListsNavigationViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class ListsNavigationViewModel {
    
}

extension ListsNavigationViewModel: ListsNavigationViewModelType {
    func getListsScreenViewModel() -> ListsScreenViewModelType? {
        return ListsScreenViewModel()
    }
}
