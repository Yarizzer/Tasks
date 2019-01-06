//
//  TaskDetailDescriptionScreenViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 17/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol TaskDetailDescriptionScreenViewModelType {
    var description: String { get }
    func updateTaskRecord(withDescription _description_: String)
}
