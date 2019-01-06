//
//  ListDetailViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 09/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol ListDetailViewModelType {
    var listTitle: String { get }
    var headerHeight: Float { get }
    var numberOfSections: Int { get }
    var numberOfRowsInSection: Int { get }
    
    func getHeaderTitle(forSection _section_: Int) -> String

    //MARK: - Cells models
    func getListDetailTitleViewModel() -> ListDetailTitleViewModelType?
    func getListMonitorCellViewModel() -> ListMonitorCellViewModelType?
    //MARK: - child VC's

    func getImageChooserViewModel() -> ImageChooserViewModelType?
    
    //MARK: - Support stuff
    func updateListRecord(withTitle _title_: String)
}
