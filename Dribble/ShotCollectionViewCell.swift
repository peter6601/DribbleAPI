//
//  ShotCollectionViewCell.swift
//  Dribble
//
//  Created by 丁暐哲 on 2016/6/13.
//  Copyright © 2016年 Din. All rights reserved.
//
import Foundation
import UIKit

class ShotCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont(name: MegaTheme.fontName, size: 14)
        
        nameLabel.textColor = UIColor(white: 0.45, alpha: 1.0)
        nameLabel.font = UIFont(name: MegaTheme.fontName, size: 6)
        
        ImageView.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).CGColor
        ImageView.layer.borderWidth = 0.5
    }
    
}
