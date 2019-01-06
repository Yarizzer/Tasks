//
//  TaskDetailTitleTableViewCell.swift
//  Tasks
//
//  Created by Yarr!zzeR on 15/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TaskDetailTitleTableViewCell: UITableViewCell {

    var model: TaskDetailTitleCellViewModelType? {
        didSet{
            guard let _model_ = model else { return }
            taskTitle.text = _model_.taskTitle
            
            self.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var taskTitle: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
