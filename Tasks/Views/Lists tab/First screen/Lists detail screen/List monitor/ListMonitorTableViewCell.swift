//
//  ListMonitorTableViewCell.swift
//  Tasks
//
//  Created by Yarr!zzeR on 01/11/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class ListMonitorTableViewCell: UITableViewCell {

    var model: ListMonitorCellViewModelType? {
        didSet {
            guard let _model_ = model else { return }
            self.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
        
            monitorView.model = _model_.getListMonitorView()

        }
    }
    @IBOutlet weak var monitorView: ListMonitorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
