//
//  TaskDetailViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 12/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol TaskDetailViewModelType {
    var numberOfSections: Int { get }
    var taskTitle: String { get }
    var sectionHeight: Float { get }
    
    func getSectionTitle(forSection _section_: Int) -> String
    
    func getTaskDetailTitleCellViewModel() -> TaskDetailTitleCellViewModelType?
    func getTaskDetailImportanceCellViewModel() -> TaskDetailImportanceCellViewModelType?
    func getTaskDetailDescriptionCellViewModel() -> TaskDetailDescriptionCellViewModelType?
    func getTaskDetailDescriptionScreenViewModel() -> TaskDetailDescriptionScreenViewModelType?
    func getTaskDetailDueDateCellViewModel() -> TaskDetailDueDateViewModelType?
    func getTaskDetailDueDateSetupScreenViewModel() -> TaskDetailDueDateSetupViewModelType?
    func getTaskDetailListCellViewModel() -> TaskDetailListCellViewModelType?
    func getTaskDetailListsViewModel() -> TaskDetailListsViewModelType?
    
    func updateTaskRecord(withTitle _title_: String)
}
