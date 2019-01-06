//
//  DoneButton.swift
//  Tasks
//
//  Created by Yarr!zzeR on 18/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class DoneButton: UIButton {

    var model: DoneButtonModelType? {
        didSet{
            guard let _model_ = model else { return }
            if _model_.completedState {
                animateBorderWidth()
                UIView.transition(with: self, duration: 1, options: [.allowUserInteraction, .curveEaseInOut], animations: { [unowned self] in
                    self.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
                    }, completion: { [unowned self] _ in
                })
            } else {
                animateBorderWidth()
                UIView.transition(with: self, duration: 1, options: [.allowUserInteraction, .curveEaseInOut], animations: { [unowned self] in
                    self.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                    }, completion: { [unowned self] _ in
                })
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
//        self.frame = CGRect(origin: .zero, size: CGSize(width: 25, height: 25))
        //        self.setTitle("Saved", for: .normal)
        let backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        let borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = frame.width / 2
        self.layer.masksToBounds = true
        
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1
    }
    
    private func animateBorderWidth() {
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
    
    func switchState() {
        guard let _model_ = model else { return }
        self.layer.removeAllAnimations()
        if !_model_.completedState {
            animateBorderWidth()
            
            UIView.transition(with: self, duration: 1, options: [.allowUserInteraction, .curveEaseInOut], animations: { [unowned self] in
                self.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
                }, completion: { _ in
                    _model_.changeCompletedState()
            })
        } else {
            animateBorderWidth()
            
            UIView.transition(with: self, duration: 1, options: [.allowUserInteraction, .curveEaseInOut], animations: { [unowned self] in
                self.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                }, completion: { _ in
                    _model_.changeCompletedState()
            })
        }
    }

}
