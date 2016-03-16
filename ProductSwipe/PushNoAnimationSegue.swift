//
//  PushNoAnimationSegue.swift
//  ProductSwipe
//
//  Created by Saul on 4/30/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

/// Move to the next screen without an animation.
class PushNoAnimationSegue: UIStoryboardSegue {
    
    override func perform() {
        let source = sourceViewController 
        if let navigation = source.navigationController {
            navigation.pushViewController(destinationViewController , animated: false)
        }
    }
    
}