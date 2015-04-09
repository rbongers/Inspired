//
//  LoginViewController.swift
//  inspired
//
//  Created by Wux on 16/03/15.
//  Copyright (c) 2015 Wux. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!

    @IBOutlet var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField === username) {
            password.becomeFirstResponder()
        }else if (textField === password) {
            self.loginClicked(loginBtn);
        }
        return true
    }
    
    @IBAction func tabbedBackground(sender: AnyObject){
        self.view.endEditing(true);
    }
    
    @IBAction func loginClicked(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(username.text, password:password.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                // Do stuff after successful login.
                NSLog("login success");
                self.dismissViewControllerAnimated(true, completion: {});
            } else if error != nil{
//                println(error.userInfo);
//                let errorstring:NSString = error.userInfo as String!
                SCLAlertView().showError("Failed", subTitle: "Wrong Credentials", closeButtonTitle: "Close", duration: 99)
                // The login failed. Check error to see why.
//                NSLog("login failed");
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
