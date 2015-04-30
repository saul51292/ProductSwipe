//
//  ViewController.swift
//  ProductSwipe
//
//  Created by Saul on 4/29/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ZLSwipeableViewDataSource,ZLSwipeableViewDelegate {

    @IBOutlet weak var backBttnCircle: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var swipeableView: ZLSwipeableView!
    var productIndex = 0
    var count = 0
    var productArray = ["Fitted Cropped Tank Top","COPE Babydoll Cami","High-Neck Crochet Bra Top","Cropped Tank Top","Recycled Trimmed Tank Top","Cropped Rib Tank Top","Crochet-Yoke Printed Dress","Ecote Clary Godet Trapeze Dress","Mock-Neck Mini Swing Dress","Riley Trapeze Dress","Witchy T-Shirt Dress"]
    
    @IBOutlet weak var companyName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.swipeableView.delegate = self
        self.swipeableView.direction = .Horizontal

        let blurEffect: UIBlurEffect = UIBlurEffect(style: .Light)
        
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.setTranslatesAutoresizingMaskIntoConstraints(false)
        blurView.frame = self.view.frame
        self.view.insertSubview(blurView, aboveSubview: backImage)
        self.view.insertSubview(productName, aboveSubview: blurView)
        self.view.insertSubview(companyName, aboveSubview: blurView)
        productName.text = self.productArray[count]
        count++
        backBttnCircle.layer.cornerRadius = backBttnCircle.frame.width/2
        backBttnCircle.layer.borderWidth = 2
        backBttnCircle.layer.borderColor = UIColor.whiteColor().CGColor
         self.view.insertSubview(backBttnCircle, aboveSubview: blurView)


        
        
      
    }
    
    func swipeableView(swipeableView: ZLSwipeableView!, didSwipeView view: UIView!, inDirection direction: ZLSwipeableViewDirection) {
        if(count<productArray.count){
            productName.text = self.productArray[count]
            count++
        }
        else{
           self.view.insertSubview(backBttnCircle, aboveSubview: swipeableView)
        }


    }
    
    @IBAction func reloadButton(sender: AnyObject) {
        self.productIndex = 0;
        count = 0
        productName.text = self.productArray[count]
        count++
        self.view.insertSubview(backBttnCircle, belowSubview: swipeableView)
        swipeableView.discardAllSwipeableViews()
    swipeableView.loadNextSwipeableViewsIfNeeded()
        

    }
    
    
    func popBackToMain()
    {
        if let navController = self.navigationController {
            var transition = CATransition()
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionFade
            transition.subtype = kCATransitionFromBottom
            self.navigationController?.view.layer.addAnimation(transition, forKey: nil)
            navController.popViewControllerAnimated(false)
        }

    }
    
    @IBAction func backBttnClicked(sender: AnyObject) {
        println("In Tinder")
        popBackToMain()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
            self.swipeableView.dataSource = self
    }
    
    
    func nextViewForSwipeableView(swipeableView: ZLSwipeableView!) -> UIView! {
        if (self.productIndex < self.productArray.count){
            println(self.productIndex)
            var currentProductImage = UIImage(named: self.productArray[self.productIndex])

            var view = CardView(frame:swipeableView.bounds)
            view.cardViewImage.image = currentProductImage
            productIndex++
            println(view.frame)
             return view
        }
       return nil
    }
}

