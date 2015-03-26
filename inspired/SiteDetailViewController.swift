//
//  SiteDetailViewController.swift
//  inspired
//
//  Created by Wux on 24/03/15.
//  Copyright (c) 2015 Wux. All rights reserved.
//

import UIKit
import Parse


class SiteDetailViewController: UIViewController, UITabBarDelegate {

    @IBOutlet var container: UIView!
    

    
    override func viewDidLoad() {
        var navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor(rgba: "#ffffff")
        navigationBarAppearace.barTintColor = UIColor(rgba: "#000000")
        
        var statusView: SiteStatusViewController = storyboard?.instantiateViewControllerWithIdentifier("siteStatus") as SiteStatusViewController;
        statusView.removeFromParentViewController();
        
//        var statusView = storyboard?.instantiateViewControllerWithIdentifier("statusViewController");
//        instantiateViewControllerWithIdentifier(viewControllerIdentifiers[sender.selectedSegmentIndex]) as UIViewController
//        self.container.
        
    }
    
    func setStatisticsView(){
        
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        if(item.tag == 2){
//            self.container.()
        }else{
//            self.container.willMoveToSuperview(self.view);
        }
        NSLog("Did select: \(item.tag)");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}