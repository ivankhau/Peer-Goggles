//
//  RegisterViewController.swift
//  Finder
//
//  Created by djay mac on 27/01/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var fullnameTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmTF: UITextField!
    var alertError:NSString!
    
    @IBOutlet weak var termsSwitch: UISwitch!
    @IBOutlet weak var signupB: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: scaleImage(regimg, and: self.view.frame.size))
        
        termsSwitch.on = false
        self.signupB.hidden = true
    }
    
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func termsSwift(sender: AnyObject) {
        
        if termsSwitch.on == false {
            self.signupB.hidden = true
        } else {
            self.signupB.hidden = false
        }
    }
    
    @IBAction func signUpAction(sender: AnyObject) {
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        if self.checkSignup() == true {
            self.createUser()
        } else {
            var alert = UIAlertView(title: "Error", message: alertError as String, delegate: self, cancelButtonTitle: "okay")
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            alert.show()
        }
        
    }
    
    func checkSignup()-> Bool {
        
        if usernameTF.text.isEmpty || emailTF.text.isEmpty || passwordTF.text.isEmpty || confirmTF.text.isEmpty {
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            alertError = "Oops! Text is empty"
            return false
        } else if passwordTF.text != confirmTF.text {
            alertError = "Password did not match"
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            return false
        } else if count(usernameTF.text) < 4 {
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            alertError = "Username should be more than 3"
            return false
        } else if count(passwordTF.text) < 3 {
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            alertError = "Password should be more than 5"
            return false
        }
        return true
    }
    
    
    func createUser() {
        
        userpf.username = usernameTF.text
        userpf.password = passwordTF.text
        userpf.email = emailTF.text

        userpf["fname"] = fullnameTF.text
        
        var firstname = fullnameTF.text.componentsSeparatedByString(" ")
        userpf["name"] = firstname[0] as String
  
        userpf["age"] = 18
        
        
  
        userpf["gender"] = 1
        
        userpf.signUpInBackgroundWithBlock {
            (succeeded, error) -> Void in
            if error == nil {
                currentuser.incrementKey("uservotecount", byAmount: 0)
                currentuser.incrementKey("reportedOtherscount", byAmount: 0)
                currentuser.incrementKey("PostNumber", byAmount: 0)
                
                //TAKE OUT LATER
                currentuser.incrementKey("fbfriendcount", byAmount: 0)
                currentuser.saveInBackground()

                justSignedUp = true
                currentuser = userpf
                if UIDevice.currentDevice().model != "iPhone Simulator" {
                    let currentInstallation = PFInstallation.currentInstallation()
                    currentInstallation["user"] = currentuser
                    currentInstallation.saveInBackground()
                }
                self.performSegueWithIdentifier("registertotab", sender: self)
                MBProgressHUD.hideHUDForView(self.view, animated: true)
            } else {
                MBProgressHUD.hideHUDForView(self.view, animated: true)
                if let errorString = error.userInfo?["error"] as? NSString {
                    var alert = UIAlertView(title: "Error", message: errorString as String, delegate: self, cancelButtonTitle: "okay")
                    alert.show()
                }
                
            }
        }
        
        
    }
    
    
    @IBAction func termsPressed(sender: AnyObject) {
        var termsvc = storyb.instantiateViewControllerWithIdentifier("termsvc") as! TermsViewController
        termsvc.backBt = false
        self.presentViewController(termsvc, animated: false, completion: nil)
    }
    
    
}
