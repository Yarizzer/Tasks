//
//  ImageChooserCellViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 22/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

class ImageChooserCellViewModel {
    private let listColorIndex: Int
    private var imageName: String
    init(withImageName _imageName_: String, colorIndex _colorIndex_: Int) {
        self.imageName = _imageName_
        self.listColorIndex = _colorIndex_
    }
}

extension ImageChooserCellViewModel: ImageChooserCellViewModelType {
    var nameOfImage: String {
        return imageName
    }
    
    var colorIndex: Int {
        return listColorIndex
    }
}
