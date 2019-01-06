//
//  TaskDetailViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 12/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

class TaskDetailViewModel {
    
    var task: Task?
    init(forTask _task_: Task?) {
        self.task = _task_
    }
}

extension TaskDetailViewModel: TaskDetailViewModelType {
    var numberOfSections: Int {
        return Constants.numberOfSections
    }
    
    var taskTitle: String {
        guard let _taskTitle_ = task?.taskTitle else { return "" }
        return _taskTitle_
    }
    
    var sectionHeight: Float {
        return Constants.sectionHeight
    }
    
    func getSectionTitle(forSection _section_: Int) -> String {
        return Constants.ArrayOfSectionTitles[_section_]
    }
    
    func getTaskDetailTitleCellViewModel() -> TaskDetailTitleCellViewModelType? {
        guard let _task_ = task else { return nil }
        return TaskDetailTitleCellViewModel(forTask: _task_)
    }
    
    func getTaskDetailImportanceCellViewModel() -> TaskDetailImportanceCellViewModelType? {
        guard let _task_ = task else { return nil }
        return TaskDetailImportanceCellViewModel(fortask: _task_)
    }
    
    func getTaskDetailDescriptionCellViewModel() -> TaskDetailDescriptionCellViewModelType? {
        guard let _task_ = task else { return nil }
        return TaskDetailDescriptionCellViewModel(forTask: _task_)
    }
    
    func getTaskDetailDescriptionScreenViewModel() -> TaskDetailDescriptionScreenViewModelType? {
        guard let _task_ = task else { return nil }
        return TaskDetailDescriptionScreenViewModel(forTask: _task_)
    }
    
    func getTaskDetailDueDateCellViewModel() -> TaskDetailDueDateViewModelType? {
        guard let _task_ = task else { return nil }
        return TaskDetailDueDateViewModel(withTask: _task_)
    }
    
    func getTaskDetailDueDateSetupScreenViewModel() -> TaskDetailDueDateSetupViewModelType? {
        guard let _task_ = task else { return nil }
        return TaskDetailDueDateSetupViewModel(withTask: _task_)
    }
    
    func getTaskDetailListCellViewModel() -> TaskDetailListCellViewModelType? {
        guard let _task_ = task else { return nil }
        return TaskDetailListCellViewModel(forTask: _task_)
    }
    
    func updateTaskRecord(withTitle _title_: String) {
        guard let _task_ = task else { return }
        let demands = TaskDemands(forList: _task_.listRelationship, forTask: _task_, withTitle: _title_, withDescription: _task_.taskDescription, taskCompleted: _task_.completed, completionDate: _task_.completionDate as Date?, importance: Int(_task_.importance), predeletionState: _task_.predeletionState, dueDate: _task_.dueDate as Date?)
        MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
    }
    
    func getTaskDetailListsViewModel() -> TaskDetailListsViewModelType? {
        guard let _task_ = task else { return nil }
        return TaskDetailListsViewModel(forTask: _task_)
    }
}

extension TaskDetailViewModel {
    private struct Constants {
        static let numberOfSections: Int = 5
        static let sectionHeight: Float = 40
        static let ArrayOfSectionTitles = [NSLocalizedString("Task title", comment: "Task title"),
                                           NSLocalizedString("Task importance", comment: "Task importance"),
                                           NSLocalizedString("Detail description", comment: "Detail description"),
                                           NSLocalizedString("Due date setup", comment: "Due date setup"),
                                           NSLocalizedString("List", comment: "List")]
    }
}
