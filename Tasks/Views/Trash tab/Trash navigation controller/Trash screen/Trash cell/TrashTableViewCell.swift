//
//  TrashTableViewCell.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TrashTableViewCell: UITableViewCell {

    var model: TrashCellViewModelType? {
        didSet {
            guard let _model_ = model else { return }
            self.taskTitleLabel.text = _model_.taskTitle
            self.taskImportanceLabel.text = _model_.taskImportance
            self.listTitleLabel.text = _model_.listTitle
            self.listImageView.image = UIImage(named: _model_.listImageName)
            
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
            
//            gradientLayer = CAGradientLayer()
//            let startColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
//            let endColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//
//            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
//            gradientLayer.startPoint = CGPoint(x: 1, y: 1)
//            gradientLayer.endPoint = CGPoint(x: 0, y: 0)
//            gradientLayer.frame = self.frame
//            gradientLayer.locations = [0.7, 1.0]
//            layer.insertSublayer(gradientLayer, at: 0)
            
            listImageView.layer.cornerRadius = listImageView.frame.width / 2
            listImageView.layer.masksToBounds = true
            listImageView.layer.borderWidth = 1
            listImageView.layer.borderColor = listColor.cgColor
            
//            let blurEffect = UIBlurEffect(style: .regular)
//            let blurView = UIVisualEffectView(effect: blurEffect)
//            blurView.frame = self.bounds
//            self.addSubview(blurView)
            self.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
        }
    }
    
//    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var timeRemainProgressView: TimeLeftProgressView!
    @IBOutlet weak var taskImportanceLabel: UILabel!
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var listTitleLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
