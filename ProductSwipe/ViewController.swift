//
//  ViewController.swift
//  ProductSwipe
//
//  Created by Saul on 4/29/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ZLSwipeableViewDataSource,ZLSwipeableViewDelegate {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var swipeableView: ZLSwipeableView!
    var productIndex = 0
    var count = 0
    var productArray = ["Fitted Cropped Tank Top","COPE Babydoll Cami","High-Neck Crochet Bra Top","Cropped Tank Top","Recycled Trimmed Tank Top","Cropped Rib Tank Top"]
    
    @IBOutlet weak var companyName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.swipeableView.delegate = self
        //You can choose between ExtraLight, Light and Dark
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .Light)
        
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.setTranslatesAutoresizingMaskIntoConstraints(false)
        blurView.frame = self.view.frame
        blurView.alpha = 0.5
        self.view.insertSubview(blurView, aboveSubview: backImage)
        self.view.insertSubview(productName, aboveSubview: blurView)
        self.view.insertSubview(companyName, aboveSubview: blurView)
        productName.text = self.productArray[count]
        count++


        
        
      
    }
    
    func swipeableView(swipeableView: ZLSwipeableView!, didSwipeView view: UIView!, inDirection direction: ZLSwipeableViewDirection) {
        
        if(count<productArray.count){
            productName.text = self.productArray[count]
            count++
        }


    }
    
    @IBAction func reloadButton(sender: AnyObject) {
        self.productIndex = 0;
        count = 0
        productName.text = self.productArray[count]
        count++

        swipeableView.discardAllSwipeableViews()
    swipeableView.loadNextSwipeableViewsIfNeeded()
        

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

