//
//  PreferredButton.swift
//  Tasks
//
//  Created by Yarr!zzeR on 11/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class PreferredButton: UIButton {
    private var preferred: Bool = false
    var model: PreferredButtonViewModelType? {
        didSet{
            guard let _model_ = model else { return }
            preferred = _model_.listIsPreferred
            animateStateTransition()
                
        }
    }
    
//    convenience init(withModel _model_: PreferredButtonViewModelType) {
//        self.init()
//        print("convenience init")
//        self.model = _model_
//    }
    
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
        
        let backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = frame.width / 2
        self.layer.masksToBounds = true
        
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1
    }
    
    func switchTheState() {
        guard let _model_ = model else { return }
        if !_model_.listIsPreferred {
            _model_.changePreferredState()
            self.preferred = _model_.listIsPreferred
        }
        animateStateTransition()
    }
    
    private func animateStateTransition() {
        guard let _model_ = model else { return }
        if _model_.listIsPreferred {
            UIView.transition(with: self, duration: 0.5, options: [.allowUserInteraction, .curveEaseInOut], animations: {
                self.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
//                self.setTitle(NSLocalizedString("main", comment: "main"), for: .normal)
            })
        } else {
            UIView.transition(with: self, duration: 0.5, options: [.allowUserInteraction, .curveEaseInOut], animations: {
                self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                self.setTitle("", for: .normal)
            })
        }
    }

}
