//
//  editprofile.swift
//  Finder
//
//  Created by Ivan Khau on 9/15/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class editprofile: UIViewController, UIActionSheetDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate {
    
    var currentname = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        usernamesubmit.layer.cornerRadius = 4
        usernamesubmit.layer.masksToBounds = true
        //usernamesubmit.alpha = 0.3
        //usernametextfield.alpha = 0.3
        
        aboutsubmit.layer.cornerRadius = 4
        aboutsubmit.layer.masksToBounds = true
        
        profileimage.layer.cornerRadius = 4
        profileimage.layer.masksToBounds = true
        
        usernametextfield.delegate = self
        abouttextfield.delegate = self
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.topItem?.title = "User Settings"
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var profileimage: UIButton!
    
    var newimage = UIImage()
    
    
    @IBAction func changeimage(sender: AnyObject) {
        
        ImagePickerManager.sharedManager.presentImagePicker(self) { (image, source) -> () in
            self.newimage = image
            self.whichsubmit = "image"
            var dualpost = UIActionSheet(title: "Change Profile Picture?", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil)
            dualpost.addButtonWithTitle("Yes")
            
            dualpost.showInView(self.view)
            
        }
    }
    
    
    
    
    @IBAction func closeeditprofile(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    var whichsubmit = ""
    
    @IBOutlet weak var usernametextfield: UITextField!
    
    @IBOutlet weak var usernamesubmit: UIButton!
    
    @IBAction func usernamesubmit(sender: AnyObject) {
        whichsubmit = "username"
        var dualpost = UIActionSheet(title: "Change Username?", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil)
        dualpost.addButtonWithTitle("Yes")
        
        dualpost.showInView(self.view)
        
    }
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        //self.view.frame.origin.y += 210
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        return false
    }
    
    struct MoveKeyboard {
        static let KEYBOARD_ANIMATION_DURATION : CGFloat = 0.3
        static let MINIMUM_SCROLL_FRACTION : CGFloat = 0.2;
        static let MAXIMUM_SCROLL_FRACTION : CGFloat = 0.8;
        static let PORTRAIT_KEYBOARD_HEIGHT : CGFloat = 216;
        static let LANDSCAPE_KEYBOARD_HEIGHT : CGFloat = 162;
    }
    var animateDistance: CGFloat!
    
    func textFieldDidBeginEditing(textField: UITextField) {

        //self.view.frame.origin.y -= 210
        let textFieldRect : CGRect = self.view.window!.convertRect(textField.bounds, fromView: textField)
        let viewRect : CGRect = self.view.window!.convertRect(self.view.bounds, fromView: self.view)
        
        let midline : CGFloat = textFieldRect.origin.y + 0.5 * textFieldRect.size.height
        let numerator : CGFloat = midline - viewRect.origin.y - MoveKeyboard.MINIMUM_SCROLL_FRACTION * viewRect.size.height
        let denominator : CGFloat = (MoveKeyboard.MAXIMUM_SCROLL_FRACTION - MoveKeyboard.MINIMUM_SCROLL_FRACTION) * viewRect.size.height
        var heightFraction : CGFloat = numerator / denominator
        
        if heightFraction < 0.0 {
            heightFraction = 0.0
        } else if heightFraction > 1.0 {
            heightFraction = 1.0
        }
        let orientation : UIInterfaceOrientation = UIApplication.sharedApplication().statusBarOrientation
        if (orientation == UIInterfaceOrientation.Portrait || orientation == UIInterfaceOrientation.PortraitUpsideDown) {
            animateDistance = floor(MoveKeyboard.PORTRAIT_KEYBOARD_HEIGHT * heightFraction)
        } else {
            animateDistance = floor(MoveKeyboard.LANDSCAPE_KEYBOARD_HEIGHT * heightFraction)
        }
        
        var viewFrame : CGRect = self.view.frame
        viewFrame.origin.y -= animateDistance
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(NSTimeInterval(MoveKeyboard.KEYBOARD_ANIMATION_DURATION))
        
        self.view.frame = viewFrame
        
        UIView.commitAnimations()
    }
    func textFieldDidEndEditing(textField: UITextField) {

        var viewFrame : CGRect = self.view.frame
        viewFrame.origin.y += animateDistance
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        
        UIView.setAnimationDuration(NSTimeInterval(MoveKeyboard.KEYBOARD_ANIMATION_DURATION))
        
        self.view.frame = viewFrame
        
        UIView.commitAnimations()
    }
    
    @IBOutlet weak var abouttextfield: UITextField!
    
    @IBOutlet weak var aboutsubmit: UIButton!
    
    @IBAction func aboutsubmit(sender: AnyObject) {
        whichsubmit = "about"
        var dualpost = UIActionSheet(title: "Change About?", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil)
        dualpost.addButtonWithTitle("Yes")

        dualpost.showInView(self.view)
        
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 1 {
            
            
            if whichsubmit == "about" {
                let countletters = count(abouttextfield.text)
                if countletters > 0 && countletters < 150 {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            let userinfo = appDelegate.userinfo
            userinfo["about"] = abouttextfield.text
            userinfo.saveInBackground()
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    self.displayAlert3("Unable to Submit.", message: "Text is limited to 150 characters.")
                }
            }
            
            if whichsubmit == "username" {
                let countletters = count(usernametextfield.text)
                if usernametextfield != "" && countletters > 3 && countletters < 15 {
                    var query = PFQuery(className: "followers")
                    query.whereKey("alias", equalTo: usernametextfield.text)
                    
                    
                    query.findObjectsInBackgroundWithBlock { (objectis:[AnyObject]!, error:NSError!) -> Void in
                        
                        println(objectis.count)
                        if objectis.count == 0 {
                            
                            currentuser.setValue(self.usernametextfield.text, forKey: "username")
                            
                            currentuser.saveInBackground()
                            
                            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
                            let userinfo = appDelegate.userinfo
                            
                            self.currentname = userinfo.objectForKey("alias") as! String
                            
                            
                            userinfo["alias"] = self.usernametextfield.text
                            
                            userinfo.saveInBackgroundWithBlock({ (Bool, NSError) -> Void in
                                
                                self.dismissViewControllerAnimated(true, completion: nil)
                                
                                var query2 = PFQuery(className: "Post")
                                query2.whereKey("alias", equalTo: self.currentname)
                                
                                
                                
                                query2.findObjectsInBackgroundWithBlock { (objects, NSError) -> Void in
                                    
                                    
                                    ///if objectos.count != 0 {
                                        
                                        //objectos["alias"] = self.usernametextfield.text
                                        for object in objects {
                                            
                                            object.setObject(self.usernametextfield.text, forKey: "alias")
                                            object.saveInBackgroundWithBlock({ (Bool, NSError) -> Void in
                                                
                                                
                                                self.dismissViewControllerAnimated(true, completion: nil)
                                                
                                                
                                                })
                                            
                                            
                                            
                                                                                   //objecto["alias"]! = self.currentname as AnyObject
                                            
                                           // objecto["alias"] = self.usernametextfield.text
                                            
                                            
                                            
                                            
                                            
                                        
                                            
                                            
                                        }
                                        
                                        
                                        
                                   /// } else {
                                        
                                    ///    self.dismissViewControllerAnimated(true, completion: nil)
                                    
                                    ///}
                                }

                            })
                            
                            
                            
                        } else {
                            
                            self.displayAlert3("Invalid Username", message: "Username is taken.")
                            
                        }
                    }
                } else {
                    self.displayAlert3("Invalid Username", message: "Usernames have to be 4-14 characters long.")
                }

            }
            
            if whichsubmit == "image" {
                let singlefirstcompareimageData = UIImageJPEGRepresentation(newimage, 0.25)
                
                let singlefirstcompareimageFile = PFFile(name: "image3.jpeg", data: singlefirstcompareimageData)
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                
                let userinfo = appDelegate.userinfo
                userinfo["image"] = singlefirstcompareimageFile
                userinfo.saveInBackground()
                userinfo.saveInBackgroundWithBlock({ (Bool, NSError) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                })
                
            }
            
            

        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField.isEqual(usernametextfield) {
            usernametextfield.text = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string.lowercaseString)
            return false
        }
        if string == "\n"
        {
            textField.resignFirstResponder()
            return false
        }
        
        
        
        
        return true
    }
    
    
    
    func displayAlert3(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            
                            

            
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
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
