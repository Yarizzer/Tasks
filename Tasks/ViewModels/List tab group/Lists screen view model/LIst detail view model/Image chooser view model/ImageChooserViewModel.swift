//
//  ImageChooserViewModel.swift
//  Tasks
//
//  Created by Yarr!zzeR on 22/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import Foundation
import UIKit

class ImageChooserViewModel {
    private var list: List?
    init(forList _list_: List?) {
        self.list = _list_
    }
    var itemsCount: Int {
        return Constants.imageNames.count
    }
}

extension ImageChooserViewModel: ImageChooserViewModelType {
    
    func getImageChooserCellViewModel(forIndex _index_: Int) -> ImageChooserCellViewModelType? {
        guard let _list_ = list else { return nil }
        return ImageChooserCellViewModel(withImageName: Constants.imageNames[_index_], colorIndex: Int(_list_.colorIndex))
    }
    
    func getColorPaletteModel() -> ListDetailColorPletteModelType? {
        guard let _list_ = list else { return nil }
        return ListDetailColorPletteModel(forList: _list_)
    }
    
    func changeImageForList(atIndex _index_: Int) {
        guard let _list_ = list else { return }
        let demands = ListDemands(forList: list, withTitle: _list_.title, withImageName: Constants.imageNames[_index_], colorIndex: Int(_list_.colorIndex), preferredFlag: _list_.preferred, predeletionState: _list_.predeletionState, order: Int(_list_.order))
        MainDatabaseManager.shared.performAListRecord(withDemends: demands)
    }
    
}

extension ImageChooserViewModel {
    private struct Constants {
        static let imageNames = ["Anchor", "Apple", "Buterfly", "Candy", "Car", "Club", "DefaultListImage", "Dimond", "Earth", "Folder", "Foto", "Gym", "HeadGears", "Heart", "Job", "Leaf", "Mail", "Money", "Music", "Phone", "Plane", "Restaurant", "Shark", "Ship", "Snow", "Spade", "Target", "Toy", "Train", "Tree"]
        
//        static let imageNames = ["DefaultListImage", "Candy", "Earth", "Folder", "Job", "Restaurant", "Tree"]
    }
}
