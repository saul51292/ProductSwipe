//
//  ReusableVCCell.swift
//  ProductSwipe
//
//  Created by Saul on 4/30/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ReusableVCCell: UICollectionViewCell {
    let textLabel =  UILabel()
    let imageView =  UIImageView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    
   private func xibSetup() {
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*2/3)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        contentView.addSubview(imageView)

        var yPos = (CGRectGetHeight(contentView.frame) - CGRectGetHeight(textLabel.frame)) / 3.0
        let textFrame = CGRect(x: 0, y: yPos, width: frame.size.width, height: frame.size.height/3)
        textLabel.frame = textFrame
        textLabel.font = UIFont(name: "Montserrat", size: 18.0)
        textLabel.textColor = UIColor.whiteColor()
        textLabel.textAlignment = .Center
        styleCell()
        contentView.addSubview(textLabel)
    
    
    }
    
    
    func styleCell()
    {
        contentView.layer.cornerRadius = contentView.bounds.width/2
        contentView.backgroundColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 0.4)
        contentView.layer.borderColor = UIColor.whiteColor().CGColor
        contentView.layer.borderWidth = 2

    }
}