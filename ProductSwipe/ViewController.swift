//
//  ViewController.swift
//  ProductSwipe
//
//  Created by Saul on 4/29/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ZLSwipeableViewDataSource,ZLSwipeableViewDelegate {

    @IBOutlet weak var bttnBack: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var swipeableView: ZLSwipeableView!
    var likeImage = UIImageView(image: UIImage(named: "like"))
    var dislikeImage = UIImageView(image: UIImage(named: "dislike"))
    var realMid = UIScreen.mainScreen().bounds.width/2
    var styleManager = StyleManager()
    var animationManager = AnimationManager()

    var productIndex = 0
    var cellIndexPath:NSIndexPath!
    var currentIndex:Int!
    var deleteCompany:Bool!
    var count = 0
    var newBase = BaseFinishedView()
    var likeCount = 0
    
    var productArray = ["Fitted Cropped Tank Top","COPE Babydoll Cami","High-Neck Crochet Bra Top","Cropped Tank Top","Recycled Trimmed Tank Top","Cropped Rib Tank Top","Crochet-Yoke Printed Dress","Ecote Clary Godet Trapeze Dress","Mock-Neck Mini Swing Dress","Riley Trapeze Dress","Witchy T-Shirt Dress"]
    
    @IBOutlet weak var companyName: UILabel!
    var companyText:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.swipeableView.delegate = self
        self.swipeableView.direction = .Horizontal
        checkCurrent()
        productName.text = self.productArray[count]
        count++
        styleManager.createBlur(view,backImage:backImage)
        styleManager.styleLikeDislikeImages(likeImage,dislikeImage:dislikeImage)
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
        productName.alpha = 1
        companyName.alpha = 1
        
        if(direction == ZLSwipeableViewDirection.Right)
        {
            likeCount++
        }
        if(count<productArray.count){
            productName.text = self.productArray[count]
            count++
        }
            
        else{
            self.view.addSubview(newBase)
            newBase.frame = self.view.frame
            newBase.likeCount.text = String(likeCount)
            newBase.bttnBack.addTarget(self, action: "backBttnClicked:", forControlEvents: .TouchUpInside)
            self.view.bringSubviewToFront(bttnBack)
            deleteCompany = true
            productName.alpha = 0
            companyName.alpha = 0
        }
       
        
    }
    
    func swipeableView(swipeableView: ZLSwipeableView!, didCancelSwipe view: UIView!) {
        productName.alpha = 1
        companyName.alpha = 1
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
        view.addSubview(dislikeImage)
        view.addSubview(likeImage)
        likeImage.alpha = 0
        dislikeImage.alpha = 0 

    }
    
    
    func swipeableView(swipeableView: ZLSwipeableView!, swipingView view: UIView!, atLocation location: CGPoint, translation: CGPoint) {
        
        if(translation.x > 0)
        {
            likeImage.alpha = translation.x/100
            dislikeImage.alpha = 0

        }
        else{
            likeImage.alpha = 0
            dislikeImage.alpha = abs(translation.x)/100
        }
        
        productName.alpha = 1 - abs(translation.x)/250
        companyName.alpha = 1 - abs(translation.x)/250


    }
    
    
   
    
    func popBackToMain()
    {
        if let navController = self.navigationController {
            let main = self.navigationController?.viewControllers.first as! MainVC
            let vc = main.childViewControllers.first as! CollectionViewController
            animationManager.mainTransition(self)
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

