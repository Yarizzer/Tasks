//
//  MainNavigationViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class MainNavigationViewModel {
    
}

extension MainNavigationViewModel: MainNavigationViewModelType {
    func getMainScreenViewModel() -> MainScreenViewModelType? {
        return MainScreenViewModel()
    }
}
