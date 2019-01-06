//
//  ListDetailViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 09/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class ListDetailViewModel {
    private var list: List?
    init(forList _list_: List) {
        self.list = _list_
    }
}

extension ListDetailViewModel: ListDetailViewModelType {
    var listTitle: String {
        guard let _list_ = list else { return "" }
        return _list_.title
    }
    
    var headerHeight: Float {
        return Constants.headerHeight
    }
    
    var numberOfSections: Int {
        return Constants.numberOfSections
    }
    
    var numberOfRowsInSection: Int {
        return Constants.numberOfRowInSection
    }
    
    func getHeaderTitle(forSection _section_: Int) -> String {
        return Constants.arrayOfSectionTitles[_section_]
    }
    
    //MARK: - Cells models
    func getListDetailTitleViewModel() -> ListDetailTitleViewModelType? {
        guard let _list_ = list else { return nil }
        return ListDetailTitleViewModel(forList: _list_)
    }
    
    func getListMonitorCellViewModel() -> ListMonitorCellViewModelType? {
        guard let _list_ = list else { return nil }
        return ListMonitorCellViewModel(forList: _list_)
    }
    
    //MARK: - Child VC's
    func getImageChooserViewModel() -> ImageChooserViewModelType? {
        guard let _list_ = list else { return ImageChooserViewModel(forList: nil) }
        return ImageChooserViewModel(forList: _list_)
    }
    
    //MARK: - Support stuff
    
    func updateListRecord(withTitle _title_: String) {
        guard let _list_ = list else { return }
        let demands = ListDemands(forList: _list_, withTitle: _title_, withImageName: _list_.imageName, colorIndex: Int(_list_.colorIndex), preferredFlag: _list_.preferred, predeletionState: _list_.predeletionState, order: Int(_list_.order))
        MainDatabaseManager.shared.performAListRecord(withDemends: demands)
    }
}

extension ListDetailViewModel {
    private struct Constants {
        static let headerHeight: Float = 50.0
        static let numberOfSections = 2
        static let numberOfRowInSection = 1
        static let arrayOfSectionTitles = ["List title", "List monitor"]
    }
}
