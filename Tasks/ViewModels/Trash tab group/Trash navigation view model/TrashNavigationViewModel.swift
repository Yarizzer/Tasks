//
//  TrashNavigationViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class TrashNavigationViewModel {
    
}

extension TrashNavigationViewModel: TrashNavigationViewModelType {
    func getTrashScreenViewModel() -> TrashScreenViewModelType? {
        return TrashScreenViewModel()
    }
}
