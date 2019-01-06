//
//  TaskDetailListChooserTableViewCell.swift
//  Tasks
//
//  Created by Yarr!zzeR on 25/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TaskDetailListChooserTableViewCell: UITableViewCell {

    var model: TaskDetailListsCellViewModelType? {
        didSet {
            guard let _model_ = model else { return }
            listImageView.image = UIImage(named: _model_.listImageName)
            listTitle.text = _model_.listName
            
            if _model_.isPreffered {
                listPreferredLabel.text = NSLocalizedString("Preferred", comment: "Preferred")
                listPreferredLabel.layer.cornerRadius = 3
                listPreferredLabel.layer.borderWidth = 1
                let borderColor = #colorLiteral(red: 0, green: 0.5737690462, blue: 1, alpha: 1)
                listPreferredLabel.layer.borderColor = borderColor.cgColor
            } else {
                listPreferredLabel.text = ""
            }
            
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
            
            listImageView.backgroundColor = color
            listImageView.layer.borderColor = color.cgColor
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
            
            self.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
            
        }
    }
    
    private var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var listImageView: ListImageView!
    
    @IBOutlet weak var listTitle: UILabel!
    @IBOutlet weak var listPreferredLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
