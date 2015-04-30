//
//  CollectionViewController.swift
//  ProductSwipe
//
//  Created by Saul on 4/30/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "dealCounterView"
    var searches :[String:Int]!
    var dictKeys : [String]!
    var dictValues : [Int]!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(ReusableVCCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.backgroundColor = UIColor.clearColor()
        searches = ["HM":0,"Urban":0,"JCrew":0,"Zara":0,"Mango":0,"Forever21":0]
        dictKeys = Array(searches.keys)
        dictValues = Array(searches.values)


        // Do any additional setup after loading the view.
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func disableCell(indexPath:NSIndexPath, key:String)
    {
        println("HIT")
        let cell = collectionView?.cellForItemAtIndexPath(indexPath) as! ReusableVCCell
        
        self.searches.removeValueForKey(key)
        dictKeys?.removeAtIndex(indexPath.row)
        dictValues?.removeAtIndex(indexPath.row)
        self.collectionView?.deleteItemsAtIndexPaths([indexPath])
        self.collectionView?.reloadData()
        println(dictKeys)
        println(dictValues)
        
    }
    
    
    //3
       
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
        return searches.count
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
          let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ReusableVCCell
        println(indexPath.row)
        self.performSegueWithIdentifier("goToTinder", sender: cell)

    }
    
    

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> ReusableVCCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ReusableVCCell
        
        var key  = dictKeys?[indexPath.row]
        cell.textLabel.text = key
        cell.layer.cornerRadius = cell.frame.width/2
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
    
    func mainTransition()
    {
        var transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromTop
        self.navigationController?.view.layer.addAnimation(transition, forKey: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToTinder"
        {
            var makeSender = sender as! ReusableVCCell
            let indexPath: NSIndexPath = self.collectionView!.indexPathForItemAtPoint(makeSender.center)!
            
            var key  = dictKeys?[indexPath.row]
            var value  = dictValues?[indexPath.row]
            let theSelectedItem = key
            let theSelectedItemIndex = value
            mainTransition()
            let targetVC = segue.destinationViewController as! ViewController
            targetVC.cellIndexPath = indexPath
            targetVC.companyText = theSelectedItem
            targetVC.currentIndex = theSelectedItemIndex
           
        }
    }

//    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(MainCollectionViewCell *)sender
//    {
//    MainBrowserViewController *targetVC = (MainBrowserViewController *) [segue destinationViewController];
//    NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
//    NSDictionary *item = [_articleListmain objectAtIndex:indexPath.item];
//    NSURL *targetURL = [item objectForKey:@"link"];
//    targetVC.targetURL  = targetURL;
//    }
//    
}
