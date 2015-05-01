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
    
    let styleManager = StyleManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createViewOnBack()
    {
        var newView = UIView(frame: view.frame)
        newView.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.5)
        view.insertSubview(newView, aboveSubview: mainBack)
        
    }
    
    func hideAll()
    {
        statusBarBack.hidden = true
        todayView.hidden = true
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
