//
//  ColorChooserViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 09/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol ListDetailColorPletteModelType {
    
    var numberOfColors: Int { get }
    
    func getColorPaletteCellModel(forIndex _index_: Int) -> ListDetailColorPaletteCellViewModelType
    
    func setNewColorIndex(withValue _newValue_: Int)
}
