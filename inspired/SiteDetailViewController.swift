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

    @IBOutlet var heartBeat: SpringLabel!
    @IBOutlet var serviceSwitch: UISwitch!
    @IBOutlet var serverStatus: UILabel!
    @IBOutlet var serviceStatus: UILabel!
    @IBOutlet var serverStatusO: UILabel!
    @IBOutlet var serviceStatusO: UILabel!
//    var data: PFObject!;
    var data: PFObject!


    
    override func viewDidLoad() {
        NSLog("data: \(data)");
        var navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor(rgba: "#ffffff")
        navigationBarAppearace.barTintColor = UIColor(rgba: "#000000")
        
        self.tabBarController?.selectedIndex = 0;
//        self.tabBarController.
        
//        [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];
        
//        data["active"] = Bool(data["active"]);
        if let active = data["active"] as? Bool{
            if(active){
                setServiceOn(true);
            }else{
                setServiceOn(false);
            }
        }
        else{
            NSLog("active");
            
        }
    }
    
    @IBAction func didChangeServiceStatus(sender: UISwitch) {
        if(sender.on){
            setServiceOn(true);
        }else{
            setServiceOn(false);
        }
    }
    override func viewDidAppear(animated: Bool) {
        heartBeat.animation = "pop"
        heartBeat.curve = "spring"
        heartBeat.duration = 2.2
        heartBeat.repeatCount = 999999;
        heartBeat.animate();
    }
    
    func setServiceOn(active:Bool){
        if(active){
            serviceSwitch.setOn(true, animated: true);
            serviceStatusO.textColor = UIColor(rgba: "#3ad36b");
            serviceStatus.text = "Service is running";
            heartBeat.repeatCount = 1;

        }else{
            serviceSwitch.setOn(false, animated: false);
            serviceStatusO.textColor = UIColor(rgba: "#C32652");
            serviceStatus.text = "Service is paused";
        }
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