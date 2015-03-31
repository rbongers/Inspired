//
//  SiteStatisticsContentViewController.swift
//  inspired
//
//  Created by Wux on 31/03/15.
//  Copyright (c) 2015 Wux. All rights reserved.
//

import UIKit
import Parse



class SiteStatisticsContentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var pageIndex : Int = 0
    var titleText : String = ""
    var data: PFObject!
    
    @IBOutlet var txtLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(pageIndex == 0){
            page1();
        }else if(pageIndex == 1){
            page2();
        }else if(pageIndex == 2){
            page3();
        }
        else {
            NSException(name:"Exception", reason:"Wrong PageID", userInfo:nil).raise()
        }
        
        

    }
    
    func page1(){
        var table = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: UITableViewStyle.Plain)
        table.dataSource = self
        table.delegate = self;
        table.backgroundColor = UIColor.blackColor()
        table.separatorStyle = UITableViewCellSeparatorStyle.SingleLine;
        table.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        table.separatorColor = UIColor.darkGrayColor()
        self.view.addSubview(table)
    }
    
    func page2(){

        
    }
    
    func page3(){
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.backgroundColor = UIColor.blackColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
//        cell.selectedBackgroundView.backgroundColor = UIColor().IdarkColor()
        cell.textLabel?.text = "Test"
        cell.textLabel?.font = UIFont(name: "Helvetica", size: 13);
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.text = "Detail"
        cell.detailTextLabel?.textColor = UIColor.darkGrayColor();
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 11)
        
        var statusview = UILabel(frame: CGRect(x: cell.frame.width - 30, y: 15, width: 60, height: 20));
        statusview.backgroundColor = UIColor().IredColor()
        statusview.text = "Down"
        statusview.textAlignment = .Center
        statusview.font = UIFont(name: "Helvetica", size: 11);
        statusview.textColor = UIColor.whiteColor()
        statusview.layer.cornerRadius = 10
        statusview.tag = 10;
        cell.addSubview(statusview);
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("DownDetailViewController") as DownDetailViewController
        vc.data = data;
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!;
        cell.backgroundColor = UIColor().IdarkColor()
       
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!;
        cell.backgroundColor = UIColor.blackColor()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func viewDidAppear(animated: Bool) {
    
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
}