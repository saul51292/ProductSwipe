//
//  ReusableVCCell.swift
//  ProductSwipe
//
//  Created by Saul on 4/30/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ReusableVCCell: UICollectionViewCell,UIGestureRecognizerDelegate {
    let textLabel =  UILabel()
    let imageView =  UIImageView()
    let styleManager = StyleManager()


    
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
        styleManager.styleLabel(textLabel)
        styleManager.styleCell(contentView)
        contentView.addSubview(textLabel)
    
    
    }
    
}