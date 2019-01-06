//
//  TimeLeftProgressViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 19/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

protocol TimeLeftProgressViewModelType {
    var taskCompleted: Bool { get }
    var currentProgressValue: Float { get }
}
