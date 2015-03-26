//
//  AddSiteViewController.swift
//  inspired
//
//  Created by Wux on 20/03/15.
//  Copyright (c) 2015 Wux. All rights reserved.
//

import UIKit
import Parse


class AddSiteViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var addBtn: UIButton!
    
    @IBOutlet var sitenameField: UITextField!
    @IBOutlet var urlField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func addClicked(sender: AnyObject) {
        
        setBusy(true);
        
        let sitename = self.sitenameField.text;
        let url = self.sitenameField.text;
      
        
        
        if(sitename.isEmpty){
            SCLAlertView().showError("Error", subTitle: "Sitename is a required field", closeButtonTitle: "Edit", duration:999)
            setBusy(false);
        }
        else if(url.isEmpty){
            SCLAlertView().showError("Error", subTitle: "URL is a required field", closeButtonTitle: "Edit", duration:999)
            setBusy(false);
        }
        else {
            var site = PFObject(className:"sites")
            site["user_id"] = PFUser.currentUser()
            site["Name"] = sitename
            site["url"] = url
            site["interval"] = 5;
            site["sound"] = "siren1";
            site.saveInBackgroundWithBlock {
                (success: Bool, error: NSError!) -> Void in
                if (success) {
                    self.cancelClicked(site);
                    let currentInstallation = PFInstallation.currentInstallation()
                    currentInstallation.addUniqueObject(site.objectId, forKey: "channels")
                    currentInstallation.saveInBackgroundWithBlock(nil)
                } else {
                    SCLAlertView().showError("Error", subTitle: error.description, closeButtonTitle: "Ok", duration:999)
                }
            }
            NSLog("jeej");
        }
    }
    
    func setBusy(type: Bool){
        if type {
            self.addBtn.enabled = false;
        }
        else {
            self.addBtn.enabled = true;
        }
    }
    
    
    @IBAction func cancelClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func tabbedBackground(sender: AnyObject){
        self.view.endEditing(true);
    }
}
