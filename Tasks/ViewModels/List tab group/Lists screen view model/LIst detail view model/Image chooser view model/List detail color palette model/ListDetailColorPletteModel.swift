//
//  ColorChooserViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 09/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation

class ListDetailColorPletteModel {
    private var list: List
    
    init(forList _list_: List) {
        self.list = _list_
    }
}

extension ListDetailColorPletteModel: ListDetailColorPletteModelType {
    
    var numberOfColors: Int {
        return Constants.colorArray.count
    }
    
    func setNewColorIndex(withValue _newIndex_: Int) {
        if _newIndex_ >= 0 && _newIndex_ <= Constants.colorArray.count {
            let demands = ListDemands(forList: list, withTitle: list.title, withImageName: list.imageName, colorIndex: _newIndex_, preferredFlag: list.preferred, predeletionState: list.predeletionState, order: Int(list.order))

            MainDatabaseManager.shared.performAListRecord(withDemends: demands)
        } else {
            print("New value is out of a range")
        }
    }
    
    func getColorPaletteCellModel(forIndex _index_: Int) -> ListDetailColorPaletteCellViewModelType {
        return ListDetailColorPaletteCellViewModel(withColorTitle: Constants.colorArray[_index_], colorIndex: _index_)
    }

}

extension ListDetailColorPletteModel {
    private struct Constants {
        static let colorArray = [NSLocalizedString("White", comment: "White"),
                                 NSLocalizedString("Green", comment: "Green"),
                                 NSLocalizedString("Yellow", comment: "Yellow"),
                                 NSLocalizedString("Blue", comment: "Blue"),
                                 NSLocalizedString("Red", comment: "Red"),
                                 NSLocalizedString("Magenta", comment: "Magenta"),
                                 NSLocalizedString("Orange", comment: "Orange"),
                                 NSLocalizedString("Black", comment: "Black")]
    }
    
}

