//
//  CardView.swift
//  ProductSwipe
//
//  Created by Saul on 4/29/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class CardView: UIView {

    @IBOutlet weak var cardViewImage: UIImageView!
    @IBOutlet var contentView: UIView!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
       private func xibSetup() {
        NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.whiteColor().CGColor
        contentView.frame = bounds
        styleImage()
        contentView.addSubview(cardViewImage)
        self.addSubview(contentView)
    }

    private func styleImage(){
        cardViewImage.frame = contentView.frame
        cardViewImage.bounds = contentView.bounds
        cardViewImage.clipsToBounds = true
        cardViewImage.layer.masksToBounds = true
        cardViewImage.contentMode = .ScaleAspectFit
    }
}
