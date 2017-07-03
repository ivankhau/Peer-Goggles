//
//  AboutViewController.swift
//  Finder
//
//  Created by djay mac on 03/02/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class AboutViewController: UITableViewController, UIActionSheetDelegate {
    
    
    var userid = ""
    

    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 1 { // Post One Pic
            
            //self.performSegueWithIdentifier("postimage1segue", sender: self)
            
            
            userid = PFUser.currentUser()!.objectId! as String
            
            var query = PFQuery(className: "Post")
            
            query.whereKey("userId", equalTo: userid)
            
            
            query.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                
                if let objects = objects {
                    
                    
                    
                        
                    
                    PFObject.deleteAllInBackground(objects, block: { (Bool, NSError) -> Void in
                        
                        var query2 = PFQuery(className: "followers")
                        
                        query2.whereKey("follower", equalTo: self.userid)
                        
                        
                        query2.findObjectsInBackgroundWithBlock({ (objectos, error) -> Void in
                            
                            if let objectos = objectos {
                                
                                PFObject.deleteAllInBackground(objectos)
                                
                                PFObject.deleteAllInBackground(objectos, block: { (Bool, NSError) -> Void in
                                    
                                    
                                    PFUser.currentUser().deleteInBackgroundWithBlock({ (Bool, NSError) -> Void in
                                        self.performSegueWithIdentifier("logout", sender: self)
                                    })
                                    
                                    
                                })
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                            }
                        })

                    })
                    
                        
                    
                    
                        
                        
                        
                        
                        
                        
                    
                }
            })
            
            
            
            
            

            
            
            
        }
    }

    @IBAction func backaction(sender: AnyObject) {
        
        
        self.dismissViewControllerAnimated(true, completion: {})
        
        
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Account"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        /*
        let backButton = UIBarButtonItem(title: "Account", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        backButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20)!], forState: UIControlState.Normal)
        navigationItem.backBarButtonItem = backButton*/


        self.tableView.backgroundColor = backColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            
            var query1 = PFQuery(className: "followers")
            query1.whereKey("follower", equalTo: currentuser.objectId)
            query1.getFirstObjectInBackgroundWithBlock { (followObject, NSError) -> Void in
                
                if followObject != nil {
                    if followObject.objectForKey("reported") as! Int > 99 {
                        self.displayAlert("Account Under Review", message: "Due to suspicious activity, your account is under review. Please try again later.")
                    } else {

                    
            if indexPath.row == 0 {
                PFUser.logOut()
                self.performSegueWithIdentifier("logout", sender: self)
            }
            if indexPath.row == 1 {
                //currentuser.removeObjectForKey("viewedUsers")
                //currentuser.saveInBackgroundWithBlock({ (done, error) -> Void in
                //    var alert = UIAlertView(title: "Done", message: "Now you can see all users again", delegate: self, cancelButtonTitle: "okay")
                //    alert.show()
                //})
                
                
                var dualpost = UIActionSheet(title: "Are you sure? All your posts will be deleted as well.", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil)
                dualpost.addButtonWithTitle("Yes! This App Sucks!")
                //dualpost.addButtonWithTitle("Two")
                dualpost.showInView(self.view)
                
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                
                        }
                
                
                
                
            }
            
            
            
            
                }
            }
            
            
        }
    }
            
}
