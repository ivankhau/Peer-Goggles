//
//  GroupSettingsViewController.swift
//  Finder
//
//  Created by Ivan Khau on 7/26/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit
//import QuartzCore

class GroupSettingsViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIActionSheetDelegate {
    
    @IBOutlet weak var changesubmitoutlet: UIButton!
    
    @IBOutlet weak var deletesubmitoutlet: UIButton!
    
    @IBOutlet weak var tipbackgroundoutlet: UILabel!
    
    //@IBOutlet weak var groupnametext: UITextField!
    
    @IBOutlet weak var changecurrent: UITextField!
    
    @IBOutlet weak var changenew: UITextField!
    
    @IBOutlet weak var changenewconfirm: UITextField!
    
    //@IBOutlet weak var deletepassword: UITextField!
    
    var lastviewed = ""
    
    @IBOutlet weak var selectedgroup: UILabel!
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 20
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 20
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            //self.performSegueWithIdentifier("privategroupcreatetofeed", sender: self)
            
            self.navigationController?.popToRootViewControllerAnimated(true)

        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func displayAlert1(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            //self.performSegueWithIdentifier("privategroupcreatetofeed", sender: self)
            self.navigationController?.popToRootViewControllerAnimated(true)
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func displayAlert2(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            self.performSegueWithIdentifier("joinsegue1", sender: self)
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    
    @IBAction func changesubmitaction(sender: AnyObject) {
        
        if changenew.text != "" && changenewconfirm.text != "" && changecurrent.text != "" && changenew.text == changenewconfirm.text {
        var query1 = PFQuery(className: "PrivateGroups")
        query1.whereKey("privatename", equalTo: lastviewed)
        query1.whereKey("creator", equalTo: PFUser.currentUser().objectId)
        query1.whereKey("password", equalTo: changecurrent.text)
        query1.getFirstObjectInBackgroundWithBlock {
                (object: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    println("The getFirstObject request failed.")
                    self.displayAlert("Error", message: "We were unable to find a group that you created with the name and password combination you provided.")
                } else {
                    if let obj = object {
                        obj.setValue(self.changenew.text, forKey: "password")
                        obj.saveInBackground()
                        self.displayAlert1("Password Has Been Changed", message: "Existing members still have have access to the group. If you changed the password because of an unwanted Peer, delete and create a new group. In Peer Goggles we don't use names, so for the sake anonymity there is no feature to remove a specific user from your group.")
                    }
                    println("Successfully retrieved the object.")
                }
            }
        
        
        } else {
            self.displayAlert("Error", message: "Check if the group name and password is correct. Entries are case sensitive.")

        }
    }
    
    @IBAction func deletesubmitaction(sender: AnyObject) {
        var dualpost = UIActionSheet(title: "Are you sure? If you are a member, you will be removed from the group. If you are the group creator, the group will be permanently deleted.", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil)
        dualpost.addButtonWithTitle("Yes")
        //dualpost.addButtonWithTitle("Two")
        dualpost.showInView(self.view)

    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 1 { // Delete Group
            
            //if deletepassword.text != "" {
                
                var query1 = PFQuery(className: "PrivateGroups")
                query1.whereKey("privatename", equalTo: lastviewed)
                query1.whereKey("creator", equalTo: PFUser.currentUser().objectId)
                //query1.whereKey("password", equalTo: deletepassword.text)
                query1.getFirstObjectInBackgroundWithBlock {
                    (object: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        
                        
                        
                        var query2 = PFQuery(className: "PrivateGroups")
                        query2.whereKey("privatename", equalTo: self.lastviewed)
                        //query2.whereKey("creator", equalTo: PFUser.currentUser().objectId)
                        //query1.whereKey("password", equalTo: deletepassword.text)
                        query2.getFirstObjectInBackgroundWithBlock {
                            (object: PFObject?, error: NSError?) -> Void in
                            if error != nil {
                                
                                println("Something is Def. Wrong!!")
                                
                                
                            } else {
                                
                                if let obj = object {
                                    //obj.removeObjectsInArray(PFUser.currentUser().objectId, forKey: "members")
                                    obj.removeObject(PFUser.currentUser().objectId, forKey: "members")
                                    obj.saveInBackground()
                                    
                                    self.displayAlert1("You Have Left The Group", message: "Either you were too good for \(self.lastviewed) or \(self.lastviewed) was too good for you.")
                                
                                
                            }
                        
                        //println("The getFirstObject request failed.")
                        //self.displayAlert("Error", message: "We were unable to find a group that you created with the name and password combination you provided.")
                        
                        

                        }
                        }
                        
                        
                        
                    } else {
                        if let obj = object {
                            
                            
                            //if obj.valueForKeyPath("creator") = PFUser.currentUser().objectId {}
                            
                            //if obj.objectForKey("creator") = PFUser.currentUser().objectId {}
                            //if obj.valueForKey("creator") != PFUser.currentUser().objectId {
                            //}
                            
                            obj.setValue("d!@#$", forKey: "password")
                            //obj.removeObjectsInArray([AnyObject](), forKey: "members")
                            obj.removeObjectForKey("members")
                            obj.saveInBackground()
                            self.displayAlert1("Group Has Been Deleted", message: "And just like that, the great \(self.lastviewed) and its Peers vanished without a trace.")
                        }
                        println("Successfully retrieved the object.")
                    }
                }
                
                
            //} else {
            //    self.displayAlert("Error", message: "Check if the group name and password is correct. Entries are case sensitive.")
                
            //}
            
        }
    }
    


    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedgroup.text = lastviewed
        
        changesubmitoutlet.layer.cornerRadius = 5
        
        deletesubmitoutlet.layer.cornerRadius = 5
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
