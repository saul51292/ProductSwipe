//
//  StyleManager.swift
//  ProductSwipe
//
//  Created by Saul on 5/1/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class StyleManager: NSObject {
    
    func createBlur(view:UIView,backImage:UIView)
    {
        
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .Light)
        
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.frame = view.frame
        view.insertSubview(blurView, aboveSubview: backImage)
    }
    
    
    
    func styleLikeDislikeImages(likeImage:UIImageView,dislikeImage:UIImageView)
    {
        likeImage.alpha = 0
        likeImage.frame = CGRectMake(30, 30, likeImage.frame.width, likeImage.frame.height)
        likeImage.transform = CGAffineTransformMakeRotation(((CGFloat)(-30 * M_PI) / 180))
        
        dislikeImage.alpha = 0
        dislikeImage.frame = CGRectMake((256-dislikeImage.frame.width), 30, dislikeImage.frame.width, dislikeImage.frame.height)
        dislikeImage.transform = CGAffineTransformMakeRotation(((CGFloat)(30 * M_PI) / 180))
        
    }

    func styleButton(buttons:UIButton...)
    {
        for button in buttons{
            button.layer.borderColor = UIColor.whiteColor().CGColor
            button.layer.borderWidth = 2
            button.layer.cornerRadius = button.frame.width/2
            button.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center

            
        }
    }
    
   
    
    func styleLabel(textLabel:UILabel)
    {
        textLabel.font = UIFont(name: "Montserrat-Regular", size: 18.0)
        textLabel.textColor = UIColor.whiteColor()
        textLabel.textAlignment = .Center
    }
    func styleCell(contentView:UIView)
    {
        contentView.layer.cornerRadius = contentView.bounds.width/2
        contentView.backgroundColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 0.4)
        contentView.layer.borderColor = UIColor.whiteColor().CGColor
        contentView.layer.borderWidth = 2
        
    }
   
}
