//
//  AnimationManager.swift
//  ProductSwipe
//
//  Created by Saul on 5/1/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class AnimationManager: NSObject {
    

    func mainTransition(vc:UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromBottom
        vc.navigationController?.view.layer.addAnimation(transition, forKey: nil)
    }
    
    
    func animateViewsSpringingUp(views: UIView...){
        var time = Double(1.6/Double(views.count))
        
        for view in views{
            UIView.animateWithDuration(time, delay: 0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 0.8,
                options: .CurveEaseInOut,
                animations:  {
                    view.frame.offsetInPlace(dx: 0, dy: -300)
                }, completion: nil)
            time += Double(1.0/Double(views.count))
            
        }
    }
}
