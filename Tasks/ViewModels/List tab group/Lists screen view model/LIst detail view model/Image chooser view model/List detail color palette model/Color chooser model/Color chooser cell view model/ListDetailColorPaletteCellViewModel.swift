//
//  ColorChooserCellViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 09/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class ListDetailColorPaletteCellViewModel {
    private var title: String
    private var listColorIndex: Int
    init(withColorTitle _colorTitle_: String, colorIndex _colorIndex_: Int) {
        self.title = _colorTitle_
        self.listColorIndex = _colorIndex_
    }
}

extension ListDetailColorPaletteCellViewModel: ListDetailColorPaletteCellViewModelType {
    var colorTitle: String {
        return title
    }
    
    var colorIndex: Int {
        return listColorIndex
    }
}


