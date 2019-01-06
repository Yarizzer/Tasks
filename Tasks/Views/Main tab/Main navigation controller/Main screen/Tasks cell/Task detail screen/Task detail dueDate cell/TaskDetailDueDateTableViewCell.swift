//
//  TaskDetailDueDateTableViewCell.swift
//  Tasks
//
//  Created by Yarr!zzeR on 18/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TaskDetailDueDateTableViewCell: UITableViewCell {

    var model: TaskDetailDueDateViewModelType? {
        didSet{
            guard let _model_ = model else { return }
            dueDateLabel.text = _model_.currentDueDate
            
            self.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
        }
    }
    
    @IBOutlet weak var dueDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
