//
//  ListDemands.swift
//  Tasks
//
//  Created by Yarr!zzeR on 04/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class ListDemands {
    let list: List?
    let title: String
    let imageName: String
    let colorIndex: Int
    let preferred: Bool
    let predeletionState: Bool
    let order: Int
    
    init(forList _list_: List?, withTitle _title_: String, withImageName _imageName_: String, colorIndex _colorindex_: Int, preferredFlag _preferred_: Bool, predeletionState _predeletionState_: Bool, order _order_: Int) {
        self.list = _list_
        self.title = _title_
        self.imageName = _imageName_
        self.colorIndex = _colorindex_
        self.preferred = _preferred_
        self.predeletionState = _predeletionState_
        self.order = _order_
    }
}
