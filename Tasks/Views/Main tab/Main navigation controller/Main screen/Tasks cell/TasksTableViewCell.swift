//
//  TasksTableViewCell.swift
//  Tasks
//
//  Created by Yarr!zzeR on 08/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TasksTableViewCell: UITableViewCell {

    var model: TasksCellViewModelType? {
        didSet{
            guard let _model_ = model else { return }
            
            taskTitle.text = _model_.taskTitle
            dueDateLabel.text = _model_.dueDateText
            listImageView.image = UIImage(named: _model_.listImageName)
            listLabel.text = _model_.listName
            dueDateLabel.text = _model_.dueDateText
            dueTimeLabel.text = _model_.dueTimeText
            
            switch _model_.importance {
            case 0:
                importanceLabel.text = "--"
            case 1:
                importanceLabel.text = "!"
            case 2:
                importanceLabel.text = "!!"
            case 3:
                importanceLabel.text = "!!!"
            default: break
                
            }
            
//            let startColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
//            let endColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            
            
            
            //            switch _model_.listColorIndex {
            //            case 0: listColorView.backgroundColor = UIColor.white
            //            case 1: listColorView.backgroundColor = UIColor.green
            //            case 2: listColorView.backgroundColor = UIColor.yellow
            //            case 3: listColorView.backgroundColor = UIColor.blue
            //            case 4: listColorView.backgroundColor = UIColor.red
            //            case 5: listColorView.backgroundColor = UIColor.magenta
            //            case 6: listColorView.backgroundColor = UIColor.orange
            //            case 7: listColorView.backgroundColor = UIColor.black
            //            default: listColorView.backgroundColor = UIColor.white // default color
            //            }
            
            
            
//            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
//            gradientLayer.startPoint = CGPoint(x: 1, y: 1)
//            gradientLayer.endPoint = CGPoint(x: 0, y: 0)
//            gradientLayer.frame = self.frame
//            gradientLayer.locations = [0.7, 1.0]
//            layer.insertSublayer(gradientLayer, at: 0)
            
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
            
            listImageView.layer.borderColor = listColor.cgColor
            listImageView.layer.borderWidth = 1
            
            doneButton.model = _model_.getDoneButtonViewModel()
            timeLeftProgressView.model = _model_.getTimeLeftProgressViewModel()
            
            taskCompleted = _model_.completed
            
            self.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
            
        }
    }
    
//    var gradientLayer = CAGradientLayer()
    
    @IBOutlet weak var doneButton: DoneButton! 
    
    @IBAction func doneButtonTapped(_ sender: DoneButton) {
        doneButton.switchState()
        switchCompletedView()
    }
    
    @IBOutlet weak var taskTitle: UILabel!
    
    @IBOutlet weak var importanceLabel: UILabel!
    
    @IBOutlet weak var listImageView: UIImageView! {
        didSet{
            listImageView.layer.cornerRadius = listImageView.frame.width / 2
            listImageView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var listLabel: UILabel!
    
    @IBOutlet weak var dueDateLabel: UILabel!
    
    @IBOutlet weak var dueTimeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var timeLeftProgressView: TimeLeftProgressView!
    
    private var taskCompleted: Bool? {
        didSet{
            guard let _taskCompleted_ = taskCompleted else { return }
            if _taskCompleted_ {
                self.taskTitle.alpha = 0.7
                self.dueDateLabel.alpha = 0.7
                self.dueTimeLabel.alpha = 0.7
                self.importanceLabel.alpha = 0.7
                self.importanceLabel.alpha = 0.7
                self.listLabel.alpha = 0.7
//                self.timeLeftProgressView.alpha = 0.7
//                self.doneButton.alpha = 0.7
                //                self.doneButton.alpha = 0.5
                
            } else {
                self.taskTitle.alpha = 1
                self.dueDateLabel.alpha = 1
                self.dueTimeLabel.alpha = 1
                self.importanceLabel.alpha = 1
                self.importanceLabel.alpha = 1
                self.listLabel.alpha = 1
//                self.timeLeftProgressView.alpha = 1
//                self.doneButton.alpha = 1
            }
            timeLeftProgressView.switchCompleted(withValue: _taskCompleted_)
        }
    }
    
    private func switchCompletedView() {
        guard let _taskCompleted_ = taskCompleted else { return }
        taskCompleted = !_taskCompleted_
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
