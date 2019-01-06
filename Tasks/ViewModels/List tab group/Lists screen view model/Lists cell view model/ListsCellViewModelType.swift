//
//  ListsCellViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 08/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol ListsCellViewModelType: class {
    var listTitle: String { get }
    var colorIndex: Int { get }
    var preferred: Bool { get }
    var completeRange: String { get }
    
    func getPreferredButtonViewModel() -> PreferredButtonViewModelType?
    func getListImageViewModel() -> ListImageViewModelType?
}
