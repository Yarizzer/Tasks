//
//  AppViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 03/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol AppViewModelType {
    func getModelForMainNavigationVC() -> MainNavigationViewModelType?
    func getModelForListsNavigationVC() -> ListsNavigationViewModelType?
    func getModelForTrashNavigationVC() -> TrashNavigationViewModelType?
}
