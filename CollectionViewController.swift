//
//  CollectionViewController.swift
//  ProductSwipe
//
//  Created by Saul on 4/30/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController,UIGestureRecognizerDelegate {

    private let reuseIdentifier = "dealCounterView"
    var dictKeys : [String]!
    var dictValues = [Int]()
    let animationManager = AnimationManager()
    var shouldAnimate = false
    var scrollViewOffset:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(ReusableVCCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.backgroundColor = UIColor.clearColor()
        var longPress = UILongPressGestureRecognizer(target: self, action: "handleLongPress:")
        longPress.minimumPressDuration = 0.8
        longPress.delaysTouchesBegan = true
        longPress.delegate = self
        self.collectionView?.addGestureRecognizer(longPress)
        dictKeys = ["HM","Urban","JCrew","Forever21","Hollister","Theory"]
        for key in dictKeys
        {
            dictValues.append(0)
        }

        // Do any additional setup after loading the view.
  
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func disableCell(indexPath:NSIndexPath, key:String)
    {
        println("HIT")
        let cell = collectionView?.cellForItemAtIndexPath(indexPath) as! ReusableVCCell
        dictKeys?.removeAtIndex(indexPath.row)
        dictValues.removeAtIndex(indexPath.row)
        self.collectionView?.deleteItemsAtIndexPaths([indexPath])
        self.collectionView?.reloadData()
        println(dictKeys)
        println(dictValues)
        checkIfArrayEmpty()
    }
    
    func checkIfArrayEmpty()
    {
        if(dictKeys.isEmpty)
        {
            var finishedView = CompaniesFinished()
            self.view.addSubview(finishedView)
            let vc = parentViewController as! MainVC
            vc.createViewOnBack()
            vc.hideAll()
            finishedView.frame = self.view.frame
        }
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
        return dictKeys.count
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
          let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ReusableVCCell
        println(indexPath.row)
        
        self.performSegueWithIdentifier("goToTinder", sender: cell)

    }
    
    
    func handleLongPress(gestureRecognizer:UILongPressGestureRecognizer)
    {
        if (gestureRecognizer.state == UIGestureRecognizerState.Began) {
            var p = gestureRecognizer.locationInView(self.collectionView)
            var indexPath = self.collectionView?.indexPathForItemAtPoint(p)
            if(indexPath == nil)
            {
                println("NONE EXIST")
                
            }
            else{
                var cell = self.collectionView?.cellForItemAtIndexPath(indexPath!) as! ReusableVCCell
                self.disableCell(indexPath!, key: cell.textLabel.text!)
            }
        }
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToTinder"
        {
            var makeSender = sender as! ReusableVCCell
            let indexPath: NSIndexPath = self.collectionView!.indexPathForItemAtPoint(makeSender.center)!
            var key  = dictKeys?[indexPath.row]
            var value  = dictValues[indexPath.row]
            let theSelectedItem = key
            let theSelectedItemIndex = value
            animationManager.mainTransition(self)
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
