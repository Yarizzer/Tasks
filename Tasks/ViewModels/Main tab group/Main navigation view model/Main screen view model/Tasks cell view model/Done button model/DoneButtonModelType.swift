//
//  DoneButtonModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 18/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol DoneButtonModelType {
    var completedState: Bool { get }
    func changeCompletedState()
    
}
