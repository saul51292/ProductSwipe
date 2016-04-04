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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bttnShare: UIButton!
    
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
    var currentLikeCount:Int!
    var productArray = [Card]()
    var finishedLoading = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runImgurTest()
        // Do any additional setup after loading the view, typically from a nib.
        self.swipeableView.delegate = self
        self.swipeableView.direction = .Horizontal
        count++
        styleManager.createBlur(view,backImage:backImage)
        styleManager.styleLikeDislikeImages(likeImage,dislikeImage:dislikeImage)
    }
    
    
    
    
    func runImgurTest() -> [Card]{
        
        var cardArray = [Card]()
        IMGGalleryRequest.hotGalleryPage(0, withViralSort: true, success: { (objects) -> Void in
            for object in objects{
                let cover = object.coverImage()
                var title = cover.title
                let coverURL = cover.URLWithSize(IMGSize.LargeThumbnailSize)
                if(title == nil){
                    title = ""
                }
                if let data = NSData(contentsOfURL: coverURL){
                    let image = UIImage(data: data)
                    let card = Card(name: String(title),image: image!,link:coverURL)
                    cardArray.append(card)
                  }
                
            }
            self.checkCurrent()
            self.productArray = cardArray
            self.productName.text = self.productArray[self.productIndex].name
            self.finishedLoading = true
            self.nextViewForSwipeableView(self.swipeableView)
            
            }) { (error) -> Void in
                print("Error")
        }
        
        return cardArray
    }

    
    func checkCurrent(){
        if currentIndex != nil{
            productIndex = currentIndex
            count = currentIndex
        }
        if currentLikeCount != nil{
            likeCount = currentLikeCount
        }
        
    }
    
    
    func swipeableView(swipeableView: ZLSwipeableView!, didSwipeView view: UIView!, inDirection direction: ZLSwipeableViewDirection) {
        productName.alpha = 1
        
        if(direction == ZLSwipeableViewDirection.Right){
            likeCount++
        }
        if(count<productArray.count){
            productName.text = self.productArray[count+1].name
            count++
        }
            
        else{
            self.view.addSubview(newBase)
            bttnShare.hidden = true
            newBase.frame = self.view.frame
            newBase.likeCount.text = String(likeCount)
            newBase.bttnBack.addTarget(self, action: "backBttnClicked:", forControlEvents: .TouchUpInside)
            deleteCompany = true
            productName.alpha = 0
        }
       
        
    }
    
    func swipeableView(swipeableView: ZLSwipeableView!, didCancelSwipe view: UIView!) {
        productName.alpha = 1
        if(likeImage.alpha > 0){
            UIView.animateWithDuration(0.2, animations: {
                self.likeImage.alpha = 0
            }, completion: nil)
        }
        if(dislikeImage.alpha > 0){
            UIView.animateWithDuration(0.2, animations: {
                self.dislikeImage.alpha = 0
                }, completion: nil)
        }

    }
    
    func swipeableView(swipeableView: ZLSwipeableView!, didStartSwipingView view: UIView!, atLocation location: CGPoint) {
        print("did start swiping at location: x \( location.x), y \(location.y)")
        view.addSubview(dislikeImage)
        view.addSubview(likeImage)
        likeImage.alpha = 0
        dislikeImage.alpha = 0 

    }
    
    @IBAction func shareProduct(sender: AnyObject) {
        let shareImage: UIImage = self.productArray[count-1].image!
        let objectArray : [AnyObject] = [shareImage,"You're going to love this! \n\(self.productArray[count-1].link!)"]
        let activityVC : UIActivityViewController = UIActivityViewController(activityItems: objectArray, applicationActivities: nil)

        activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
    
    func swipeableView(swipeableView: ZLSwipeableView!, swipingView view: UIView!, atLocation location: CGPoint, translation: CGPoint) {
        
        if(translation.x > 0){
            likeImage.alpha = translation.x/100
            dislikeImage.alpha = 0
        }
        else{
            likeImage.alpha = 0
            dislikeImage.alpha = abs(translation.x)/100
        }
        
        productName.alpha = 1 - abs(translation.x)/250

    }
   
    
    
    @IBAction func backBttnClicked(sender: AnyObject) {
        print("Back To Control")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
            self.swipeableView.dataSource = self
    }
    
    
    func nextViewForSwipeableView(swipeableView: ZLSwipeableView!) -> UIView! {
        if (finishedLoading){
            activityIndicator.stopAnimating()
            let currentProductImage = self.productArray[self.productIndex].image
            let view = CardView(frame:swipeableView.bounds)
            view.cardViewImage.image = currentProductImage
            productIndex++
            return view
        }
        return nil
    }
}

