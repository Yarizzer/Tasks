//
//  TimeLeftProgressView.swift
//  Tasks
//
//  Created by Yarr!zzeR on 19/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TimeLeftProgressView: UIProgressView {
    var model: TimeLeftProgressViewModelType? {
        didSet {
            guard let _model_ = model else { return }
            progressValue = _model_.currentProgressValue
            taskCompleted = _model_.taskCompleted
        }
    }
    
    private var taskCompleted: Bool? {
        didSet {
            setupView()
        }
    }
    private var progressValue: Float?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        setupView()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    private func setupView() {
        self.trackTintColor = UIColor.clear
        guard let _progress_ = progressValue, let _taskCompleted_ = taskCompleted else { return }
        
        if _taskCompleted_ {
            self.tintColor = UIColor.green
            self.setProgress(1, animated: true)
            
        } else {
            if _progress_ < 0.5 {
                self.tintColor = UIColor.green
            } else if _progress_ < 0.8 {
                self.tintColor = UIColor.yellow
            } else {
                self.tintColor = UIColor.red
            }

            self.setProgress(_progress_, animated: true)
        }
    }
    
    func switchCompleted(withValue _value_: Bool) {
        taskCompleted = _value_
    }
}
