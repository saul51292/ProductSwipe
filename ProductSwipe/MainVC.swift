//
//  MainVC.swift
//  ProductSwipe
//
//  Created by Saul on 4/30/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    @IBOutlet weak var statusBarBack: UIView!
    @IBOutlet weak var mainBack: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var todayView: UIView!
    @IBOutlet weak var backBttn: UIButton!
    
    var disableSwipeButton = false
    let styleManager = StyleManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        createViewOnBack()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        // Dispose of any resources that can be recreated.
    }
    
    func createViewOnBack()
    {
        var newView = FXBlurView(frame: view.frame)
        newView.tintColor = UIColor.clearColor()
        newView.blurRadius = 5
        view.insertSubview(newView, aboveSubview: mainBack)
        
    }
    
    
    
    func popBackToControl()
    {
        if let navController = self.navigationController {
            let control = self.navigationController?.viewControllers.first as! ControlVC
            AnimationManager().mainTransition(self)
            navController.popViewControllerAnimated(false)
            if(disableSwipeButton == true)
            {
                
                control.cardButton.enabled = false
                control.cardButton.layer.borderColor = UIColor.lightGrayColor().CGColor
                
            }
        }
    }
    
   
    @IBAction func backBttnClicked(sender: AnyObject) {
        popBackToControl()
    }
    
    func hideAll()
    {
        statusBarBack.hidden = true
        todayView.hidden = true
        backBttn.hidden = true
    }
    func addBottomBorder(view:UIView)
    {
       var bottomBorder = CALayer()
        bottomBorder.backgroundColor = UIColor.whiteColor().CGColor
        bottomBorder.frame = CGRectMake(0,CGRectGetHeight(view.frame), CGRectGetWidth(view.frame), 1.5)
        view.layer.addSublayer(bottomBorder)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
