//
//  ImageChooserViewModelType.swift
//  Tasks
//
//  Created by Yarr!zzeR on 22/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

protocol ImageChooserViewModelType {
    var itemsCount: Int { get }
    func getImageChooserCellViewModel(forIndex _index_: Int) -> ImageChooserCellViewModelType?
    
    func getColorPaletteModel() -> ListDetailColorPletteModelType?
    
    func changeImageForList(atIndex _index_: Int)
}
