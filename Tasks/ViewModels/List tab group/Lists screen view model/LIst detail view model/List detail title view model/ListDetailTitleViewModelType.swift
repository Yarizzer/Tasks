//
//  ListDetailTitleViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 10/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol ListDetailTitleViewModelType {
    var title: String { get }
    var listImageName: String { get }
    var listColorIndex: Int { get }
    func setNewValueForTitle(newValue _title_: String)
}
