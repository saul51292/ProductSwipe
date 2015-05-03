//
//  HorizontalCVCell.swift
//  ProductSwipe
//
//  Created by Saul on 5/2/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class HorizontalCVCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var blurView: FXBlurView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var addMoreTint: UIView!
    
    func loadItem(#title: String, image: String) {
        backgroundImage.bounds = contentView.bounds
        backgroundImage.contentMode = .ScaleAspectFill
        backgroundImage.image = UIImage(named: image)
        titleLabel.text = title
    }
    
    func styleCell()
    {
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.whiteColor().CGColor
        backgroundImage.clipsToBounds = true
        backgroundImage.layer.masksToBounds = true
        contentView.layer.masksToBounds = true
        blurView.tintColor = UIColor.clearColor()
        blurView.blurRadius = 30
    }
    
    

}
