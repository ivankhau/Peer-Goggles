//
//  PackCreateViewController.swift
//  Finder
//
//  Created by Ivan Khau on 7/17/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class PackCreateViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            self.navigationController?.popToRootViewControllerAnimated(true)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if let letterRange = string.rangeOfCharacterFromSet(NSCharacterSet.lowercaseLetterCharacterSet()){
            return true
        }else if string != "" {
            return false }; return true
    }

    
    func displayAlert1(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            self.performSegueWithIdentifier("newpostsegue1", sender: self)
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }


    
    
    @IBOutlet weak var createtextfield: UITextField!
    
    
    @IBOutlet weak var createsubmitbutton: UIButton!
    
    @IBAction func createsubmitaction(sender: AnyObject) {
        
        if createtextfield.text != "" {
        var post = PFObject(className: "PublicSuggestions")
        post["suggestion"] = createtextfield.text
        post.saveInBackground()
        
        self.displayAlert("Suggestion Received", message: "If your suggestion doesn't suck, we may consider it.")
        }
        /*
        var query1 = PFQuery(className: "Categories")
        query1.whereKey("catname", equalTo: createtextfield.text)
        query1.findObjectsInBackgroundWithBlock { (catnames, error) -> Void in
            if catnames.count == 1 {
                for catname in catnames {
                    
                    self.displayAlert("Unable to Create Group", message: "Group already exists.")

                    
                    
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
            
            if catnames.count == 0 {
                var post = PFObject(className: "Categories")
                post["catname"] = self.createtextfield.text
                                post.saveInBackground()
                PFUser.currentUser()["lasviewed"] = self.createtextfield.text as String
                currentuser.saveInBackground()
                self.displayAlert1("Success", message: "Your group has been created.")
                
                //if error == nil {
                //    self.performSegueWithIdentifier("newpostsegue1", sender: self)
                //}

                //self.performSegueWithIdentifier("newpostsegue", sender: self)
                
            }
            
        }
        */

        
        
        
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    
    func textFieldDidEndEditing(textField: UITextField) {
        createsubmitbutton.enabled = true
        createsubmitbutton.alpha = 1
        
        
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createsubmitbutton.layer.cornerRadius = 5
        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        createsubmitbutton.enabled = false
        createsubmitbutton.alpha = 0.5

        
        
        
        self.createtextfield.delegate = self

        

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
