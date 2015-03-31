//
//  SiteDetailSettingsViewController.swift
//  inspired
//
//  Created by Wux on 30/03/15.
//  Copyright (c) 2015 Wux. All rights reserved.
//

import UIKit
import Parse

class SiteDetailSettingsViewController: UITableViewController {
    

    //    var data: PFObject!;
    var data: PFObject!
    
    override func viewDidLoad() {
        
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        return UITableViewCell();
//    }
    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1;
//    }
    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        r/eturn 1;
//    }
    
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let  footer = tableView.dequeueReusableCellWithIdentifier("footer") as UITableViewHeaderFooterView;
        println("viewForFooterInSection \(section)")
        
        // Last section
        if(section == tableView.numberOfSections()){
            
            
            let  footer = tableView.dequeueReusableCellWithIdentifier("footer") as UITableViewHeaderFooterView;
        }
        
        return UITableViewHeaderFooterView();

    }
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}