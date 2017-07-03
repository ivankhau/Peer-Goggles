//
//  AppDelegate.swift
//  Finder
//
//  Created by djay mac on 27/01/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    //UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)
   
    var userinfo:PFObject!
    
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        var attr = NSDictionary(object: UIFont(name: "AvenirNext-Regular", size: 12.0)!, forKey: NSFontAttributeName)
        UISegmentedControl.appearance().setTitleTextAttributes(NSDictionary(object: UIFont(name: "AvenirNext-Medium", size: 12.0)!, forKey: NSFontAttributeName) as [NSObject : AnyObject], forState: .Normal)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        UITabBar.appearance().barTintColor = UIColor.whiteColor()
        
        //UITabBar.appearance().shadowImage = UIImage.alloc()
        
        UITabBar.appearance().tintColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        UIBarButtonItem.appearance().tintColor = UIColor.whiteColor()
        
        let appearance = UITabBarItem.appearance()
        //let attributes = [NSFontAttributeName:UIFont(name: "AvenirNext-Medium", size: 20)]
        appearance.setTitleTextAttributes(NSDictionary(object: UIFont(name: "AvenirNext-Medium", size: 12.0)!, forKey: NSFontAttributeName) as [NSObject : AnyObject], forState: .Normal)
        
        
        
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red: 2 / 255.0, green: 24 / 255.0, blue: 18 / 255.0, alpha: 0.7)], forState:.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)], forState:.Selected)
        
        
        Parse.setApplicationId("9aKyFd2GdVWYplTFSiA6Wk4PAgEeu7fv4LwUR6T4", clientKey: "LhxIjx5zZgCiNbJBhr3QxxGPwIqt6ki4Q278hI36")
        PFFacebookUtils.initializeFacebook()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.whiteColor()
        //UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        UINavigationBar.appearance().barTintColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)
        UINavigationBar.appearance().backgroundColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().translucent = false
        //UINavigationBar.appearance().tintColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        
        
        // check if user is logged in
        if PFUser.currentUser() != nil && PFUser.currentUser().isAuthenticated() {
            
            
        } else {
            
            var gotologin = storyb.instantiateViewControllerWithIdentifier("loginvc") as! LoginViewController
            window!.rootViewController = gotologin
            
            
        }
        
        
        
        
        if currentuser != nil {
        
        var query69 = PFQuery(className: "followers")
        query69.whereKey("follower", equalTo: currentuser.objectId)
        query69.getFirstObjectInBackgroundWithBlock { (userinfoobject, NSError) -> Void in
            
            if userinfoobject != nil {

                self.userinfo = userinfoobject

            } else {
                
                
                var userinfocreate = PFObject(className: "followers")
                userinfocreate["follower"] = currentuser.objectId as String
                userinfocreate["following"] = []
                userinfocreate["followedby"] = []
                userinfocreate.incrementKey("reportothers", byAmount: 0)
                userinfocreate.incrementKey("reported", byAmount: 0)
                userinfocreate["image"] = currentuser.objectForKey("dpSmall")
                userinfocreate["about"] = "I just joined Peer Goggles!"
                
                userinfocreate.saveInBackgroundWithBlock{(success, error) -> Void in
                    
                    if error == nil {
                        self.userinfo = userinfocreate
                        
                        
                        
                        
                    } else {
                        
                        
                        
                        
                    }
                    
                }
                
            }
            
        }
        }

        
        
        if UIApplication.sharedApplication().respondsToSelector("registerUserNotificationSettings:") { // uis 8
            let notificationTypes = UIUserNotificationType.Alert | UIUserNotificationType.Badge | UIUserNotificationType.Sound
            let notificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: nil)
            UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
            
        } else {
            UIApplication.sharedApplication().registerForRemoteNotificationTypes(.Alert | .Badge | .Sound)
        }
        
        return true
    }
    
    
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        UIApplication.sharedApplication().registerForRemoteNotifications()
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        println(error.localizedDescription)
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        let currentInstallation = PFInstallation.currentInstallation()
        currentInstallation.setDeviceTokenFromData(deviceToken)
        currentInstallation.saveInBackgroundWithBlock(nil)
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        AudioServicesPlayAlertSound(1110)
        
        NSNotificationCenter.defaultCenter().postNotificationName("displayMessage", object: userInfo)
        NSNotificationCenter.defaultCenter().postNotificationName("reloadMessages", object: nil)
    }
    
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        return FBAppCall.handleOpenURL(url, sourceApplication: sourceApplication, withSession: PFFacebookUtils.session())
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
        
        FBAppCall.handleDidBecomeActiveWithSession(PFFacebookUtils.session())
    }
    
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

