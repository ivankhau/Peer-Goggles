//
//  PrivateCreateViewController.swift
//  Finder
//
//  Created by Ivan Khau on 7/17/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class PrivateCreateViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 20
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 20
    }

    
    func displayAlert1(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            self.performSegueWithIdentifier("privategroupcreatetofeed", sender: self)
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "privategroupcreatetofeed"){
            //let indexPath = self.tableView.indexPathForSelectedRow()
            //let indes = tableView.indexPathForSelectedRow()
            //var lastviewed = userids[indexPath!.row]
            //let destination = segue.destinationViewController as! UINavigationController
            //let targetController = destinationNavigationController.topViewController
            //destination.lastviewed = userids[indexPath!.row]
            
            //var cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            
            //let lastviewed = userids[indexPath!.row]
            let navVC = segue.destinationViewController as! UINavigationController
            let detailVC = navVC.topViewController as! PrivateFeedViewController
            detailVC.lastviewed = self.createname.text

            
            
            //println(lastviewed)
            
            
        }
        
        if(segue.identifier == "joinsegue1"){
            //let indexPath = self.tableView.indexPathForSelectedRow()
            //let indes = tableView.indexPathForSelectedRow()
            //var lastviewed = userids[indexPath!.row]
            //let destination = segue.destinationViewController as! UINavigationController
            //let targetController = destinationNavigationController.topViewController
            //destination.lastviewed = userids[indexPath!.row]
            
            //var cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            
            //let lastviewed = userids[indexPath!.row]
            let navVC = segue.destinationViewController as! UINavigationController
            let detailVC = navVC.topViewController as! PrivateFeedViewController
            detailVC.lastviewed = joinname.text
            
            
            
            //println(lastviewed)
            
            
        }

    }

    
    
    //@IBOutlet weak var cancelbutton: UIButton!
    
    
    
    @IBOutlet weak var joinname: UITextField!
    
    @IBOutlet weak var joinpassword: UITextField!
    
    @IBOutlet weak var joinbuttonoutlet: UIButton!
    
    @IBAction func joinaction(sender: AnyObject) {
        
        var query1 = PFQuery(className: "PrivateGroups")
        query1.whereKey("privatename", equalTo: joinname.text)
        query1.whereKey("password", equalTo: joinpassword.text)
        
        query1.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if objects.count == 1 {
                for object in objects {
                    
                    if let arr = object["members"]{
                        if arr?.containsObject(PFUser.currentUser().objectId) == false {
                        //if(arr.containsObject(PFUser.currentUser().objectID == false){
                        arr!.addObject(PFUser.currentUser().objectId)
                        object.saveInBackground()
                            
                        //PFUser.currentUser()["lasprivate"] = self.joinname.text as String
                        PFUser.currentUser().addUniqueObject(self.joinname.text, forKey: "memberofgroup")
                        currentuser.saveInBackground()
                            
                        self.displayAlert2("Success", message: "You have joined the group!")
    
                        
                        }
                    }   
                }
            } else {
                
                self.displayAlert("Error", message: "Invalid group name or password.")

            }
        
        
            
        }

        
    }
    
    @IBOutlet weak var createname: UITextField!
    
    @IBOutlet weak var createpassword: UITextField!
    
    @IBOutlet weak var createpasswordconfirm: UITextField!
    
    @IBOutlet weak var createbuttonoutlet: UIButton!
    
    @IBAction func createaction(sender: AnyObject) {
        
        var query1 = PFQuery(className: "PrivateGroups")
        query1.whereKey("privatename", equalTo: createname.text)
        query1.findObjectsInBackgroundWithBlock { (catnames, error) -> Void in
            if catnames.count == 1 {
                for catname in catnames {
                    
                    self.displayAlert("Unable to Create Group", message: "Group name already taken.")
                    
                    
                    
                    //catname.incrementKey("viewcount")
                    //catname.saveInBackground()
                    //let currentcount = catname["viewcount"] as! Int
                    //catname.setValue(currentcount+1, forKey: "viewcount")
                    //catname.saveInBackground()
                    //if error == nil {
                    //    self.performSegueWithIdentifier("packsegue", sender: self)
                    //}
                    
                }
            }
            
            if catnames.count == 0 && self.createpassword.text == self.createpasswordconfirm.text {
                var post = PFObject(className: "PrivateGroups")
                post["privatename"] = self.createname.text
                post["password"] = self.createpasswordconfirm.text
                post["creator"] = PFUser.currentUser().objectId as String
                post.addUniqueObject(PFUser.currentUser().objectId, forKey: "members")
                //post.addUniqueObject("Share Your Thoughts!", forKey: "comments")
                post.addUniqueObjectsFromArray(["", "  ", "   ", "    ", "     ", "      ", "       ", "        ", "         ", "           ", "            ", "             ",  "             "], forKey: "comments")
                post.saveInBackground()
                PFUser.currentUser()["lasprivate"] = self.createname.text as String
                
                PFUser.currentUser().addUniqueObject(self.createname.text, forKey: "memberofgroup")
                
                currentuser.saveInBackground()
                self.displayAlert1("Success", message: "Your private group has been created.")
                
                //if error == nil {
                //    self.performSegueWithIdentifier("newpostsegue1", sender: self)
                //}
                
                //self.performSegueWithIdentifier("newpostsegue", sender: self)
                
            } else {
                self.displayAlert("Unable to Create Group", message: "Passwords do not match.")
            }
            
        }
        
        
        
        
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        
        
        joinbuttonoutlet.layer.cornerRadius = 5
        
        //cancelbutton.layer.cornerRadius = 5
        
        createbuttonoutlet.layer.cornerRadius = 5
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        

        
        self.joinname.delegate = self
        self.joinpassword.delegate = self
        self.createname.delegate = self
        self.createpassword.delegate = self
        self.createpasswordconfirm.delegate = self

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
