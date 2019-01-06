//
//  TrashCellViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol TrashCellViewModelType {
    var taskTitle: String { get }
    var taskImportance: String { get }
    var listTitle: String { get }
    var listImageName: String { get }
    var listColorIndex: Int { get }
}
