//
//  TaskDetailDescriptionTableViewCell.swift
//  Tasks
//
//  Created by Yarr!zzeR on 17/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TaskDetailDescriptionTableViewCell: UITableViewCell {

    var model: TaskDetailDescriptionCellViewModelType? {
        didSet {
            guard let _model_ = model else { return }
            taskDescriptionLabel.text = _model_.description
            
            self.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
        }
    }
    
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
