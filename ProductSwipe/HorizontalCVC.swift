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
    var dictKeys = ["HM","Urban","JCrew","Forever21","Hollister","Theory"]
      var dictImages = ["Fitted Cropped Tank Top","COPE Babydoll Cami","High-Neck Crochet Bra Top","Cropped Tank Top","Recycled Trimmed Tank Top","Cropped Rib Tank Top"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        var nib = UINib(nibName: "HorizontalCVCell", bundle: nil)
        
       
        self.collectionView!.registerNib(nib, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.backgroundColor = UIColor.clearColor()
        self.collectionView?.contentInset = UIEdgeInsetsMake(0, UIScreen.mainScreen().bounds.width/2 - 175, 0, 50)
        // Do any additional setup after loading the view.
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
        return dictKeys.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> HorizontalCVCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HorizontalCVCell
        cell.loadItem(title: dictKeys[indexPath.row], image: dictImages[indexPath.row])
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
