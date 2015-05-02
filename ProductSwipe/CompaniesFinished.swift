//
//  CompaniesFinished.swift
//  ProductSwipe
//
//  Created by Saul on 5/1/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class CompaniesFinished: BaseFinishedView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override func setContent()
    {
        likeCount.hidden = true
        likeImageView.image = UIImage(named: "checkDone")
        bttnBack.setTitle("Share the love", forState: .Normal)
        bttnBack.addTarget(self, action: "shareBttnPressed", forControlEvents: .TouchUpInside)

    }
    
    func shareBttnPressed() {
        
        var userData = MAVEUserData(userID: "1", firstName: "Test", lastName: "User")
        MaveSDK.sharedInstance().identifyUser(userData)
        MaveSDK.sharedInstance().presentInvitePageModallyWithBlock({ (inviteController:UIViewController!) -> Void in
            self.window?.rootViewController!.presentViewController(inviteController, animated: true, completion: nil)
            }, dismissBlock: { (controller:UIViewController!, numberSent:UInt) -> Void in
                controller.dismissViewControllerAnimated(true, completion: nil)
            }, inviteContext: "default")
    }
    

}
