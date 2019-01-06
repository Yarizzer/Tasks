//
//  TaskListsTableViewCell.swift
//  Tasks
//
//  Created by Yarr!zzeR on 03/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class ListsTableViewCell: UITableViewCell {

    weak var model: ListsCellViewModelType? {
        didSet {
            guard let _model_ = model else { return }
//            gradientLayer = CAGradientLayer()
//            let startColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            let endColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//
//            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
//            gradientLayer.startPoint = CGPoint(x: 1, y: 1)
//            gradientLayer.endPoint = CGPoint(x: 0, y: 0)
//            gradientLayer.frame = self.frame
//            gradientLayer.locations = [0.7, 1.0]
//            layer.insertSublayer(gradientLayer, at: 0)
            
            self.listLabel.text = _model_.listTitle
            switch _model_.colorIndex {
            case 0: listImage.backgroundColor = UIColor.white
            case 1: listImage.backgroundColor = UIColor.green
            case 2: listImage.backgroundColor = UIColor.yellow
            case 3: listImage.backgroundColor = UIColor.blue
            case 4: listImage.backgroundColor = UIColor.red
            case 5: listImage.backgroundColor = UIColor.magenta
            case 6: listImage.backgroundColor = UIColor.orange
            case 7: listImage.backgroundColor = UIColor.black
            default: listImage.backgroundColor = UIColor.white
            }
            
            self.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
            
            setupPreferredButton()
            setupListImageView()
            completeRange.text = _model_.completeRange
            

        }
    }
    
//    private var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var listImage: ListImageView!
    
    @IBOutlet weak var preferredButton: PreferredButton!
    
    @IBAction func preferredButtonTapped(_ sender: PreferredButton) {
        sender.switchTheState()
        if let parent = self.superview as? UITableView {
            parent.reloadData()
        }
        
    }
    
    @IBOutlet weak var completeRange: UILabel!
    
    private func setupPreferredButton() {
        guard let _model_ = model else { return }
        preferredButton.model = _model_.getPreferredButtonViewModel()
    }
    
    private func setupListImageView() {
        guard let _model_ = model else { return }
        listImage.model = _model_.getListImageViewModel()
    }
    
    @IBOutlet weak var listLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//        layer.cornerRadius = frame.height / 3
//        layer.masksToBounds = true
//        layer.borderWidth = 2
        
        // Initialization code
    }

}
