//
//  HorizontalCVC.swift
//  ProductSwipe
//
//  Created by Saul on 5/2/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

let reuseIdentifier = "BrandCell"

class HorizontalCVC: UICollectionViewController,UIScrollViewDelegate {

    var image = UIImage(named: "mainBack")
    var upcomingDealDict = [UpcomingDealCard]()
    var count  = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        var nib = UINib(nibName: "HorizontalCVCell", bundle: nil)
        
       
        self.collectionView!.registerNib(nib, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.backgroundColor = UIColor.clearColor()
        self.collectionView?.contentInset = UIEdgeInsetsMake(0, UIScreen.mainScreen().bounds.width/2 - 175, 0, 50)
        upcomingDealDict = addTestData()
        // Do any additional setup after loading the view.
    }
    
    func formatADate(date:NSDate)->String {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd"
         let s = dateFormatter.stringFromDate(date)
        return s
    }
    
    func addMore(d:NSDate)->String
    {
        let moreDates = NSCalendar.currentCalendar().dateByAddingUnit(
                .CalendarUnitDay,
                value: count,
                toDate: d,
                options: NSCalendarOptions(0))
        count++
        return formatADate(moreDates!)
    }
    
    func addTestData() ->[UpcomingDealCard]
    {
        var productDict = ["Fitted Cropped Tank Top":"HM","COPE Babydoll Cami":"Urban","High-Neck Crochet Bra Top":"jcrew","Cropped Tank Top":"Forever21","Recycled Trimmed Tank Top":"Hollister","Cropped Rib Tank Top":"Mango"]
        var upcomingDealArray = [UpcomingDealCard]()
        
        for (key,value) in productDict{
            var upcomingDeal = UpcomingDealCard(time:addMore(NSDate()), companyLogo: UIImage(named: value)!, image: UIImage(named: key)!)
            upcomingDealArray.append(upcomingDeal)
        }
        
        return upcomingDealArray
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return upcomingDealDict.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> HorizontalCVCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HorizontalCVCell
        cell.loadItem(title: upcomingDealDict[indexPath.row].time, backImage: upcomingDealDict[indexPath.row].image,logoImage: upcomingDealDict[indexPath.row].companyLogo!)
        cell.styleCell()
        // Configure the cell
        return cell
    }

    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
