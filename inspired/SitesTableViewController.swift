//
//  SitesTableViewController.swift
//  inspired
//
//  Created by Wux on 17/03/15.
//  Copyright (c) 2015 Wux. All rights reserved.
//

import UIKit
import Parse

class SitesTableViewController: UITableViewController {
    
    var selectedIndex = 0;
    
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
       //        alert.showEdit(self, title: "Edit View", subTitle: "This alert view shows a text box")
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("didSelectRowAtIndexPath: \(indexPath.row)")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("sitecell", forIndexPath: indexPath) as UITableViewCell
        selectedIndex = indexPath.row
        self.performSegueWithIdentifier("sitedetail2", sender: cell)
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        NSLog("Sites: \(Global.sites.count)");
        return Global.sites.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
        var text = "Servers"
        view.backgroundColor = UIColor.clearColor()
        if(section == 2){
            text = "Websites"
        }else if(section == 3){
            text = "Services"
        }
        var label = UILabel(frame: CGRectInfinite)
        return view
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("sitecell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = Global.sites[indexPath.row]["Name"] as? String
//        cell.textLabel?.font = UIFont(name: "Helvetica", size: 16)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.text = Global.sites[indexPath.row]["url"] as? String
//        cell.detailTextLabel?.font = UIFont(name: "Helvetica light", size: 12)
        cell.detailTextLabel?.textColor = UIColor.grayColor()
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    // called when a row is moved
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
            // remove the dragged row's model
//            let val = Global.sites.removeAtIndex(sourceIndexPath.row)
            
            // insert it into the new position
//            self.items.insert(val, atIndex: destinationIndexPath.row)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            let alert = SCLAlertView()
            alert.addButton("Remove") {
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            }
            alert.showInfo(Global.sites[indexPath.row]["Name"] as String, subTitle: "Do you really want to delete this website?", closeButtonTitle: "Cancel", duration: 60);
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let cell = sender as UITableViewCell
        let indexPath = self.tableView?.indexPathForCell(cell)
        
        if (segue.identifier == "sitedetail2") {
            
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
            // sender is the tapped `UITableViewCell`
//            let cell = sender as UITableViewCell
//            let indexPath = self.tableView.indexPathForCell(cell)
        
            // load the selected model
//            let item = self.items[indexPath!.row]
            
//            let detail = segue.destinationViewController as DetailViewController
            // set the model to be viewed
//            detail.item = item
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
