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
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
       //        alert.showEdit(self, title: "Edit View", subTitle: "This alert view shows a text box")
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
    
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("sitecell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = Global.sites[indexPath.row]["Name"] as? String
        cell.detailTextLabel?.text = Global.sites[indexPath.row]["url"] as? String
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
            // sender is the tapped `UITableViewCell`
            let cell = sender as UITableViewCell
            let indexPath = self.tableView.indexPathForCell(cell)
            
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
