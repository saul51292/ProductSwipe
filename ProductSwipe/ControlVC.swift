//
//  ControlVC.swift
//  ProductSwipe
//
//  Created by Saul on 5/2/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ControlVC: UIViewController {

    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var cardButton: UIButton!
    @IBOutlet weak var inviteButton: UIButton!
    @IBOutlet weak var mainBack: UIImageView!
    
    @IBOutlet weak var timerLabel: MZTimerLabel!
    let styleManager = StyleManager()
    var keepCurrentIndex:Int!
    var currentLikeCount:Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        createViewOnBack()
        styleManager.styleButton(cardButton,inviteButton,settingsButton)
        cardButton.setImage(UIImage(named: "Cards"), forState: .Normal)
        inviteButton.setImage(UIImage(named: "invite"), forState: .Normal)
        settingsButton.setImage(UIImage(named: "settings"), forState: .Normal)
        // Do any additional setup after loading the view.
        
        timerLabel.timerType = MZTimerLabelTypeTimer
        timerLabel.setCountDownTime(10800)
        timerLabel.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createViewOnBack()
    {
        var newView = FXBlurView(frame: view.frame)
        newView.blurRadius = 5
        newView.tintColor = UIColor.clearColor()
        view.insertSubview(newView, aboveSubview: mainBack)
        
    }
    
    @IBAction func inviteButtonClicked(sender: AnyObject) {
        var userData = MAVEUserData(userID: "1", firstName: "Test", lastName: "User")
        MaveSDK.sharedInstance().identifyUser(userData)
        MaveSDK.sharedInstance().presentInvitePageModallyWithBlock({ (inviteController:UIViewController!) -> Void in
            self.view.window?.rootViewController!.presentViewController(inviteController, animated: true, completion: nil)
            }, dismissBlock: { (controller:UIViewController!, numberSent:UInt) -> Void in
                controller.dismissViewControllerAnimated(true, completion: nil)
            }, inviteContext: "default")

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToTinder"
        {
            AnimationManager().mainTransition(self)
            let targetVC = segue.destinationViewController as! ViewController
            targetVC.currentIndex = keepCurrentIndex
            targetVC.currentLikeCount = currentLikeCount

        }

    }
    

}
