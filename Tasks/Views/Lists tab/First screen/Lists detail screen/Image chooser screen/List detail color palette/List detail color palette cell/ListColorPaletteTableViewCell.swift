//
//  ListColorPaletteTableViewCell.swift
//  Tasks
//
//  Created by Yarr!zzeR on 26/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class ListColorPaletteTableViewCell: UITableViewCell {

    var model: ListDetailColorPaletteCellViewModelType? {
        didSet {
            
            guard let _model_ = model else { return }
            
//            colortitleLabel.text = _model_.colorTitle
            
            gradientLayer = CAGradientLayer()
            let startColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            let endColor: UIColor
            
            colortitleLabel.text = _model_.colorTitle

            switch _model_.colorIndex {
            case 0: endColor = UIColor.white
            case 1: endColor = UIColor.green
            case 2: endColor = UIColor.yellow
            case 3: endColor = UIColor.blue
            case 4: endColor = UIColor.red
            case 5: endColor = UIColor.magenta
            case 6: endColor = UIColor.orange
            case 7: endColor = UIColor.black
            default: endColor = UIColor.white
            }
            
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 1, y: 1)
            gradientLayer.endPoint = CGPoint(x: 0, y: 0)
            gradientLayer.frame = self.frame
            gradientLayer.locations = [0.7, 1.0]
            layer.insertSublayer(gradientLayer, at: 0)
            
            self.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
        }
    }
    

    
    @IBOutlet weak var colortitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private var gradientLayer: CAGradientLayer!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
