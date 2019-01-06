//
//  PreferredButtonViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 12/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol PreferredButtonViewModelType: class {
    var listIsPreferred: Bool { get }
    func changePreferredState()
}
