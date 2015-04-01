//
//  AppDelegate.swift
//  inspired
//
//  Created by Wux on 16/03/15.
//  Copyright (c) 2015 Wux. All rights reserved.
//

import UIKit
import Parse;

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Parse.enableLocalDatastore();
        Parse.setApplicationId("6Q4swgCvBAu9xoVT2hQfWiUkqQSKoNpQ5HBZJrqc", clientKey: "s2IAJYDgynvdYcIESYMStf3AslLUBLkrif6tWnIe")
        
        let userNotificationTypes = (UIUserNotificationType.Alert |
            UIUserNotificationType.Badge |
            UIUserNotificationType.Sound);
        
        let settings = UIUserNotificationSettings(forTypes: userNotificationTypes, categories: nil)
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        let installation = PFInstallation.currentInstallation()
        installation.setDeviceTokenFromData(deviceToken)
        installation.saveInBackgroundWithBlock(nil);
    }


}

struct Global {
    static var user:PFUser!
    static var sites:NSMutableArray = []
    static var colors:[String: String] = ["Red" : "#CC3333", "Lightblue": "#69CCCC"]
    static var alerts:[String] = ["Alert 1", "Alert 2", "Alarm", "siren1"]
    static func getSites() -> Bool {
        
        var response = false;
        var query = PFQuery(className:"sites")
        query.whereKey("user_id", equalTo:PFUser.currentUser())
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects.count) sites.")
                self.sites.removeAllObjects();
                
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        self.sites.addObject(object)
//                        Global.sites.addObject(object);
                    }
                }
                response = true;
            } else {
                // Log details of the failure
                println("Error: \(error) \(error.userInfo!)")
            }
        }
        return response
    }
}

