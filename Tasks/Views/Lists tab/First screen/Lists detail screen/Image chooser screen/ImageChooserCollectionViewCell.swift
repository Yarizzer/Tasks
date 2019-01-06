//
//  ImageChooserCollectionViewCell.swift
//  Tasks
//
//  Created by Yarr!zzeR on 22/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class ImageChooserCollectionViewCell: UICollectionViewCell {
    var model: ImageChooserCellViewModelType? {
        didSet{
            guard let _model_ = model else { return }
            self.cellImage.image = UIImage(named: _model_.nameOfImage)
            
            cellImage.layer.cornerRadius = cellImage.frame.width / 2
            cellImage.layer.masksToBounds = true
            cellImage.layer.borderWidth = 3
            cellImage.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var cellImage: UIImageView!
}
