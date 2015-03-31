//
//  DownDetailViewController.swift
//  inspired
//
//  Created by Wux on 31/03/15.
//  Copyright (c) 2015 Wux. All rights reserved.
//

import UIKit
import Parse

class DownDetailViewController: UIViewController {
    
    var data:PFObject!;
    
    override func viewDidLoad() {
//        self.title = data["Name"] as String!
//        var date = data["from"] as NSDate;
//        var dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "YYYY/mm/dd" //format style. Browse online to get a format that fits your needs.
//        var dateString = dateFormatter.stringFromDate(date)
        self.title = "Down - datetofix";
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
