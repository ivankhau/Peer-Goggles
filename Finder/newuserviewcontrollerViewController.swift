//
//  newuserviewcontroller.swift
//  Finder
//
//  Created by Ivan Khau on 9/16/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class newuserviewcontroller: UIViewController, UIActionSheetDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //usernamesubmit.layer.cornerRadius = 4
        //usernamesubmit.layer.masksToBounds = true
        
        var userinfocreate = PFObject(className: "followers")
        userinfocreate["follower"] = currentuser.objectId as String
        userinfocreate["following"] = []
        userinfocreate["followedby"] = []
        userinfocreate.incrementKey("reportothers", byAmount: 0)
        userinfocreate.incrementKey("reported", byAmount: 0)
        userinfocreate["image"] = currentuser.objectForKey("dpSmall")
        userinfocreate["about"] = "I just joined Peer Goggles!"
        userinfocreate["alias"] = ""
        userinfocreate.saveInBackground()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //let userinfo = appDelegate.userinfo
        
        appDelegate.userinfo = userinfocreate

        
        
        aboutsubmit.layer.cornerRadius = 4
        aboutsubmit.layer.masksToBounds = true
        
        termsSwitch.on = false
        aboutsubmit.enabled = false
        aboutsubmit.alpha = 0.5
        
        usernametextfield.delegate = self
        abouttextfield.delegate = self
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.topItem?.title = "Create Profile"
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var termsSwitch: UISwitch!
    
    @IBAction func termsSwift(sender: AnyObject) {
        
        if termsSwitch.on == false {
            aboutsubmit.enabled = false
            aboutsubmit.alpha = 0.5
        } else {
            aboutsubmit.enabled = true
            aboutsubmit.alpha = 1
        }
        
        
        
    }
    
    


    
    @IBOutlet weak var usernametextfield: UITextField!
    

    

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
        
        
            
        let countletters2 = count(usernametextfield.text)
        if usernametextfield != "" && countletters2 > 3 && countletters2 < 15 {
            
        
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                
                let userinfo = appDelegate.userinfo
            
                var query = PFQuery(className: "followers")
                query.whereKey("alias", equalTo: usernametextfield.text)
                
                
                query.findObjectsInBackgroundWithBlock { (objects:[AnyObject]!, error:NSError!) -> Void in
                    
                    println(objects.count)
                    if objects.count == 0 {
                        
                        
                        userinfo["alias"] = self.usernametextfield.text
                        
                        if self.abouttextfield.text == "" {
                        userinfo["about"] = "I just joined Peer Goggles!"
                        } else {
                        userinfo["about"] = self.abouttextfield.text
                            
                        }
                        userinfo.saveInBackground()
                        
                    self.performSegueWithIdentifier("createprofiletotab", sender: self)
                        
                    } else {
                        
                        self.displayAlert3("Invalid Username", message: "Username is taken.")
                        
                    }
                }
            } else {
                self.displayAlert3("Invalid Username", message: "Usernames have to be 4-14 characters long.")
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