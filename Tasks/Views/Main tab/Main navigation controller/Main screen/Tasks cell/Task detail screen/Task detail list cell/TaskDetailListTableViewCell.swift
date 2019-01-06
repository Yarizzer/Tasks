//
//  TaskDetailListTableViewCell.swift
//  Tasks
//
//  Created by Yarr!zzeR on 23/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TaskDetailListTableViewCell: UITableViewCell {

    var model: TaskDetailListCellViewModelType? {
        didSet{
            guard let _model_ = model else { return }
            listNameLabel.text = _model_.listName
            listImageView.image = UIImage(named: _model_.listImageName)
            
            let listColor: UIColor
            switch _model_.listColorIndex {
            case 0: listColor = UIColor.white
            case 1: listColor = UIColor.green
            case 2: listColor = UIColor.yellow
            case 3: listColor = UIColor.blue
            case 4: listColor = UIColor.red
            case 5: listColor = UIColor.magenta
            case 6: listColor = UIColor.orange
            case 7: listColor = UIColor.black
            default: listColor = UIColor.white // default color
            }
            
            listImageView.backgroundColor = listColor
            listImageView.layer.borderWidth = 1
            listImageView.layer.borderColor = listColor.cgColor
            
            self.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
        }
    }
    
    @IBOutlet weak var listImageView: UIImageView! {
        didSet {
            listImageView.layer.cornerRadius = listImageView.frame.width / 2
            listImageView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var listNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
