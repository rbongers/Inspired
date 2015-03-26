//
//  ViewController.swift
//  inspired
//
//  Created by Wux on 16/03/15.
//  Copyright (c) 2015 Wux. All rights reserved.
//

import UIKit
import Parse


class ViewController: UIViewController {



    @IBOutlet var loader: UIActivityIndicatorView!
    @IBOutlet var statuslabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewDidAppear(animated: Bool) {
        if((PFUser.currentUser()) != nil){
            statuslabel.text = "Retrieving data...";
            
//            Global.getSites();
//            self.openApplication()
            
          
            var query = PFQuery(className:"sites")
            query.whereKey("user_id", equalTo:PFUser.currentUser())
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]!, error: NSError!) -> Void in
                if error == nil {
                    // The find succeeded.
                    println("Successfully retrieved \(objects.count) sites.")
                    
                    
                    // Do something with the found objects
                    if let objects = objects as? [PFObject] {
                        for object in objects {
                            Global.sites.addObject(object);
                        }
                    }
                    self.openApplication()
                    
                } else {
                    // Log details of the failure
                    println("Error: \(error) \(error.userInfo!)")
                }
            }
            
        }
        else {
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC: LoginViewController = storyboard.instantiateViewControllerWithIdentifier("vcMainLogin") as LoginViewController
            self.presentViewController(loginVC, animated: true, completion: nil)
            
            
        }
    }
    
    func openApplication(){
        self.performSegueWithIdentifier("tosites", sender: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

