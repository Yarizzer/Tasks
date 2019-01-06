//
//  ListMonitorView.swift
//  Tasks
//
//  Created by Yarr!zzeR on 01/11/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class ListMonitorView: UIView {

    var model: ListMonitorViewModelType? {
        didSet {
            guard let _superView_ = superview else { return }
            self.frame = _superView_.frame
            setupView()
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private func setupView() {
        let monitorCanvas = UIView(frame: self.frame)
        monitorCanvas.backgroundColor = UIColor.gray
        monitorCanvas.layer.cornerRadius = Constants.monitorCanvasCornerRadius
        monitorCanvas.layer.masksToBounds = true
        monitorCanvas.layer.borderWidth = 1
        monitorCanvas.layer.borderColor = Constants.monitorCanvasBorderColor
        
        self.addSubview(monitorCanvas)
    }

}

extension ListMonitorView {
    private struct Constants {
        static let monitorCanvasCornerRadius:CGFloat = 10
        static let monitorCanvasBorderColor = UIColor.red.cgColor
        
    }
}
