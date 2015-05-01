//
//  BaseFinishedView.swift
//  ProductSwipe
//
//  Created by Saul on 5/1/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class BaseFinishedView: UIView {

    @IBOutlet weak var bttnBack: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var allDone: UILabel!
    @IBOutlet weak var likeImageView: UIImageView!
    
    @IBOutlet weak var checkBack: UILabel!
    let animationManager = AnimationManager()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override func layoutSubviews() {
        animationManager.animateViewsSpringingUp(bttnBack,checkBack,allDone,likeCount,likeImageView)
    }
    
    func setContent()
    {
        
    }

    
    private func xibSetup() {
        NSBundle.mainBundle().loadNibNamed("BaseFinishedView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.translatesAutoresizingMaskIntoConstraints()
        styleBttnBack()
        setContent()
        self.addSubview(contentView)
    }

    private func styleBttnBack()
    {
        bttnBack.layer.borderColor = UIColor.whiteColor().CGColor
        bttnBack.layer.borderWidth = 2
        bttnBack.layer.cornerRadius = 10
    }

}
