//
//  SiteDetailSettingsViewController.swift
//  inspired
//
//  Created by Wux on 30/03/15.
//  Copyright (c) 2015 Wux. All rights reserved.
//

import UIKit
import Parse

class SiteDetailSettingsViewController: UITableViewController, PopUpPickerViewDelegate, UITextFieldDelegate {
    

    //    var data: PFObject!;
    var data: PFObject!
    var pickerView: PopUpPickerView!
    var alerts = Global.alerts;
    
    @IBOutlet var fieldName: UITextField!
    @IBOutlet var fieldUrl: UITextField!
    @IBOutlet var switchNoty: UISwitch!
    @IBOutlet var buttonNoty: UIButton!
    
    override func viewDidLoad() {
        pickerView = PopUpPickerView()
        pickerView.delegate = self
        
        
        var saveBtn = UIButton(frame: CGRectMake(0, self.tableView.frame.size.height - 250, self.tableView.frame.size.width, 40))
        saveBtn.backgroundColor = UIColor().IgreenColor()
        saveBtn.setTitle("Save", forState: UIControlState.Normal)
        saveBtn.setBackgroundColor(UIColor().IgreenDarkerColor(), forUIControlState: UIControlState.Highlighted);
        saveBtn.addTarget(self, action: "saveSettings:", forControlEvents:UIControlEvents.TouchUpInside)
        
        self.tableView.addSubview(saveBtn)
        
        if let window = UIApplication.sharedApplication().keyWindow {
            window.addSubview(pickerView)
        } else {
            self.view.addSubview(pickerView)
        }
        
        fieldName.text = data["Name"] as String!
        fieldUrl.text = data["url"] as String!
        buttonNoty.setTitle(data["sound"] as String!, forState: UIControlState.Normal)
        
        switchNoty.setOn(data["notification"] as Bool!, animated: false)
    }
    
    func saveSettings(button: UIButton){
        self.view.endEditing(true)
        button.setTitle("", forState: UIControlState.Normal)
        button.enabled = false
        
        var loader = UIActivityIndicatorView(frame: CGRectMake((button.frame.size.width / 2) - 15, 5, 30, 30))
        loader.startAnimating()
        
        button.addSubview(loader)
        
        data["Name"] = fieldName.text
        data["url"] = fieldUrl.text
        data["notification"] = switchNoty.on
        data.saveEventually(nil)
        
        button.setTitle("Save", forState: UIControlState.Normal)
        button.enabled = true
        loader.removeFromSuperview()
    }

    
    @IBAction func clickNotificationAlertButton(sender: UIButton) {
        println("clickNotificationAlertButton")
        pickerView.showPicker()
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        println("viewForFooterInSection \(section)")
        
        // Last section
        if(section == tableView.numberOfSections()){
            
            
            let footer = UITableViewHeaderFooterView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 100));
            footer.backgroundColor = UIColor.redColor()
            return footer;
        }
        
        return UITableViewHeaderFooterView()

    }
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return alerts.count;
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return alerts[row]
    }
    func pickerView(pickerView: UIPickerView, didSelect numbers: [Int]) {
        data["notification"] = alerts[numbers[0]]
        buttonNoty.setTitle(alerts[numbers[0]], forState: UIControlState.Normal)
    }
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: alerts[row], attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()])
    }
   
    @IBAction func tabbedBackground(sender: AnyObject){
        self.view.endEditing(true)
//        pickerView.cancelPicker()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}