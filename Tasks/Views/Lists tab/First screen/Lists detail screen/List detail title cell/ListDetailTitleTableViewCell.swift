//
//  ListDetailTitleTableViewCell.swift
//  Tasks
//
//  Created by Yarr!zzeR on 10/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class ListDetailTitleTableViewCell: UITableViewCell {

    var model: ListDetailTitleViewModelType? {
        didSet {
            guard let _model_ = model else { return }
            listTitleLabel.text = _model_.title
            imageButton.setImage(UIImage(named: _model_.listImageName), for: .normal)
            
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
            
            let color: UIColor
            switch _model_.listColorIndex {
            case 0: color = UIColor.white
            case 1: color = UIColor.green
            case 2: color = UIColor.yellow
            case 3: color = UIColor.blue
            case 4: color = UIColor.red
            case 5: color = UIColor.magenta
            case 6: color = UIColor.orange
            case 7: color = UIColor.black
            default: color = UIColor.white
            }
            
            imageButton.backgroundColor = color
            imageButton.layer.borderColor = color.cgColor
            imageButton.layer.borderWidth = 1
            
            self.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
        }
    }
    
    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var listTitleLabel: UILabel!
    @IBOutlet weak var imageButton: UIButton! {
        didSet {
            imageButton.layer.cornerRadius = imageButton.frame.width / 2
            imageButton.layer.masksToBounds = true
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
