//
//  ListsViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 08/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol ListsScreenViewModelType: class {
    var headerHeight: Float { get }
    func numberOfLists() -> Int
    func updateListsCurrentIndex(withIndex _index_: Int)
    func getListCellViewModel(forIndex _index_: Int) -> ListsCellViewModelType
    func getListDetailViewModel() -> ListDetailViewModelType
    //Database section
    func updateListsArray()
    func moveListRecordToTrash()
    func addNewListInDatabase(withTitle _listTitle_: String)
    //Supporting section
    func preferredList(withIndex _index_: Int) -> Bool

}
