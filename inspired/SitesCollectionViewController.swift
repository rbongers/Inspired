//
//  SitesTableViewController.swift
//  inspired
//
//  Created by Wux on 17/03/15.
//  Copyright (c) 2015 Wux. All rights reserved.
//

import UIKit
import Parse

class SitesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate {
    
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    var selectedIndex:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor(rgba: "#ffffff")
        navigationBarAppearace.barTintColor = UIColor(rgba: "#000000")
        navigationBarAppearace.setBackgroundImage(UIImage(named: "black"), forBarMetrics: UIBarMetrics.Default);
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        navigationBarAppearace.translucent = false;
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    }
    
    override func viewDidAppear(animated: Bool) {
        
        NSLog("Data: \(Global.sites.count)");
        self.collectionView?.reloadData();
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(0, 100);
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }

    @IBAction func clicked(sender: UIBarButtonItem) {
        NSLog("Clicked");
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> SiteCollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("sitecell", forIndexPath: indexPath) as SiteCollectionViewCell
        cell.nameLabel.text = Global.sites[indexPath.row]["Name"] as String!
        cell.urlLabel.text = Global.sites[indexPath.row]["url"] as String!
        
        var colorstring =  Global.colors[Global.sites[indexPath.row]["color"] as String] as String!
        var color = UIColor.redColor()
        if(colorstring != nil){
            color = UIColor(rgba: colorstring)
        }
        cell.backgroundColor = UIColor(patternImage: UIImage(named: "sample_sitebg")!);
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Global.sites.count
    }
    
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    
    func confirmDelete(indexPath: NSIndexPath){
        let alert = SCLAlertView()
//        alert.addButton("Remove") {
//            self.collectionView?.deleteItemsAtIndexPaths([indexPath])
//        }
//        alert.showInfo(Global.sites[indexPath.row]["Name"] as String, subTitle: "Do you really want to delete this website?", closeButtonTitle: "Cancel", duration: 60);

    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("sitecell", forIndexPath: indexPath) as SiteCollectionViewCell
        selectedIndex = indexPath.row
        self.performSegueWithIdentifier("sitedetail", sender: cell)
        
//        NSLog("row: \(indexPath.row)");
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let cell = sender as SiteCollectionViewCell
        let indexPath = self.collectionView?.indexPathForCell(cell)
        
        if (segue.identifier == "sitedetail") {
            
            let index = indexPath?.row;
            let tab:UITabBarController = segue.destinationViewController as UITabBarController
            tab.title = Global.sites[selectedIndex]["Name"] as String!
            tab.tabBar.tintColor = UIColor().IgreenColor()
            
            var Controller = tab.viewControllers?[0] as SiteDetailViewController;
            Controller.data = Global.sites[selectedIndex] as PFObject
            var Controller2 = tab.viewControllers?[1] as SiteStatisticsViewController;
            Controller2.data = Global.sites[selectedIndex] as PFObject
            var Controller3 = tab.viewControllers?[2] as SiteDetailSettingsViewController;
            Controller3.data = Global.sites[selectedIndex] as PFObject
        }
    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
        
        let size = UIScreen.mainScreen().bounds
            return CGSize(width: (size.width)-20, height: 100)
    }
    
    func collectionView(collectionView: UICollectionView!,  layout collectionViewLayout: UICollectionViewLayout!,insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        self.collectionView?.performBatchUpdates(nil, completion: nil)
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
