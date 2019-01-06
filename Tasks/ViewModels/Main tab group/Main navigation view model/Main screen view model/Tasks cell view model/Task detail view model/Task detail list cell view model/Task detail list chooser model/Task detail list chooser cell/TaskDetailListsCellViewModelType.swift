//
//  TaskDetailListsCellViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 25/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol TaskDetailListsCellViewModelType {
    var listName: String { get }
    var listImageName: String { get }
    var listColorIndex: Int { get }
    var isPreffered: Bool { get }
}
