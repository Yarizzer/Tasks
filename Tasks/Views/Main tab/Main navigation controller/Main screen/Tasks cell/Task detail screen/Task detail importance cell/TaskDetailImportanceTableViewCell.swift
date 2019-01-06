//
//  TaskDetailImportanceTableViewCell.swift
//  Tasks
//
//  Created by Yarr!zzeR on 16/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TaskDetailImportanceTableViewCell: UITableViewCell {

    var model: TaskDetailImportanceCellViewModelType? {
        didSet{
            guard let _model_ = model else { return }
            importanceSegment.selectedSegmentIndex = _model_.taskImportance
            
            self.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
        }
    }
    
    @IBOutlet weak var importanceSegment: UISegmentedControl!
    
    @IBAction func importanceSegmentAction(_ sender: UISegmentedControl) {
        guard let _model_ = model else { return }
        _model_.changeImportance(withValue: sender.selectedSegmentIndex)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
