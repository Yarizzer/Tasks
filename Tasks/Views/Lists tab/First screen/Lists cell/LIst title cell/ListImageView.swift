//
//  ListImageView.swift
//  Tasks
//
//  Created by Yarr!zzeR on 20/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class ListImageView: UIImageView {

    var model: ListImageViewModelType? {
        didSet{
            guard let _model_ = model else { return }
            self.image = UIImage(named: _model_.imageName)
            switch _model_.colorIndex {
            case 0: layer.borderColor = UIColor.white.cgColor
            case 1: layer.borderColor = UIColor.green.cgColor
            case 2: layer.borderColor = UIColor.yellow.cgColor
            case 3: layer.borderColor = UIColor.blue.cgColor
            case 4: layer.borderColor = UIColor.red.cgColor
            case 5: layer.borderColor = UIColor.magenta.cgColor
            case 6: layer.borderColor = UIColor.orange.cgColor
            case 7: layer.borderColor = UIColor.black.cgColor
            default: layer.borderColor = UIColor.white.cgColor // default color
            }
            
            animateAppearing()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        print("init frame")
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //        print("init coder")
        setupView()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    private func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
    }
    
    func animateAppearing() {
        let endWidthValue: Float = 5
        let duration: Double = 0.5
        let linearTiming = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        let borderWidthClosingAmination = CAKeyframeAnimation(keyPath: "borderWidth")
        borderWidthClosingAmination.duration = duration
        borderWidthClosingAmination.values = [1.000, endWidthValue, 1.000] as [Float]
        borderWidthClosingAmination.keyTimes = [0.000, 0.500, 1.000] as [NSNumber]
        borderWidthClosingAmination.timingFunctions = [linearTiming, linearTiming]
        borderWidthClosingAmination.beginTime = 0
        borderWidthClosingAmination.isRemovedOnCompletion = false
        self.layer.add(borderWidthClosingAmination, forKey:"BorderWidth Animation")
        
    }
}
