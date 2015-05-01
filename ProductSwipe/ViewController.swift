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
    var likeImage = UIImageView(image: UIImage(named: "like"))
    var dislikeImage = UIImageView(image: UIImage(named: "dislike"))
    var realMid = UIScreen.mainScreen().bounds.width/2

    var productIndex = 0
    var cellIndexPath:NSIndexPath!
    var currentIndex:Int!
    var deleteCompany:Bool!
    var count = 0
    var productArray = ["Fitted Cropped Tank Top","COPE Babydoll Cami","High-Neck Crochet Bra Top","Cropped Tank Top","Recycled Trimmed Tank Top","Cropped Rib Tank Top","Crochet-Yoke Printed Dress","Ecote Clary Godet Trapeze Dress","Mock-Neck Mini Swing Dress","Riley Trapeze Dress","Witchy T-Shirt Dress"]
    
    @IBOutlet weak var companyName: UILabel!
    
    var companyText:String!
    
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
        checkCurrent()
        productName.text = self.productArray[count]
        count++
        backBttnCircle.layer.cornerRadius = backBttnCircle.frame.width/2
        backBttnCircle.layer.borderWidth = 2
        backBttnCircle.layer.borderColor = UIColor.whiteColor().CGColor
        self.view.insertSubview(backBttnCircle, aboveSubview: blurView)
      
    }
    
    func checkCurrent()
    {
        if currentIndex != nil
        {
            productIndex = currentIndex
            count = currentIndex
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        companyName.text = companyText
    }
    
    func swipeableView(swipeableView: ZLSwipeableView!, didSwipeView view: UIView!, inDirection direction: ZLSwipeableViewDirection) {
        if(count<productArray.count){
            productName.text = self.productArray[count]
            count++
        }
        
        
        else{
            deleteCompany = true
           self.view.insertSubview(backBttnCircle, aboveSubview: swipeableView)
        }
    }
    
    func swipeableView(swipeableView: ZLSwipeableView!, didCancelSwipe view: UIView!) {
        if(likeImage.alpha > 0)
        {
            UIView.animateWithDuration(0.2, animations: {
                self.likeImage.alpha = 0
            }, completion: nil)
        }
        if(dislikeImage.alpha > 0)
        {
            UIView.animateWithDuration(0.2, animations: {
                self.dislikeImage.alpha = 0
                }, completion: nil)
        }

    }
    
    func swipeableView(swipeableView: ZLSwipeableView!, didStartSwipingView view: UIView!, atLocation location: CGPoint) {
        println("did start swiping at location: x \( location.x), y \(location.y)")
        likeImage.alpha = 0
        view.addSubview(likeImage)
        dislikeImage.alpha = 0
        dislikeImage.frame = CGRectMake((view.bounds.width-dislikeImage.bounds.width), 0, dislikeImage.bounds.width, dislikeImage.bounds.height)
        view.addSubview(dislikeImage)
    }
    
    
    func swipeableView(swipeableView: ZLSwipeableView!, swipingView view: UIView!, atLocation location: CGPoint, translation: CGPoint) {
        println("translation: x \( translation.x)")

        
        if(translation.x > 0)
        {
            likeImage.alpha = translation.x/150
            dislikeImage.alpha = 0

        }
        else{
            likeImage.alpha = 0
            dislikeImage.alpha = abs(translation.x)/150
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
    
    func mainTransition()
    {
        var transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromBottom
        self.navigationController?.view.layer.addAnimation(transition, forKey: nil)
    }
    
    
    func popBackToMain()
    {
        if let navController = self.navigationController {
            let main = self.navigationController?.viewControllers.first as! MainVC
            let vc = main.childViewControllers.first as! CollectionViewController
            mainTransition()
            navController.popViewControllerAnimated(false)
            currentIndex = count - 1
            vc.dictValues[find(vc.dictKeys,companyText)!] = currentIndex
            if(deleteCompany != nil)
            {
                vc.disableCell(cellIndexPath,key:companyText)
                
            }
        }
    }
    
    @IBAction func backBttnClicked(sender: AnyObject) {
        println("Back To Main")
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
            var currentProductImage = UIImage(named: self.productArray[self.productIndex])

            var view = CardView(frame:swipeableView.bounds)
            view.cardViewImage.image = currentProductImage
            productIndex++
             return view
        }
       return nil
    }
}

