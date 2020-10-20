//
//  LoginViewController.swift
//  Finder
//
//  Created by djay mac on 27/01/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit
import AssetsLibrary

class LoginViewController: UIViewController, UIActionSheetDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate {
    
    var alertError:NSString!
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBOutlet weak var caption: UILabel!
    
    @IBOutlet weak var loginview: UIView!
    
    @IBOutlet weak var signupview: UIView!
    
    @IBOutlet weak var signuptriangle: UIImageView!
    
    @IBOutlet weak var logintriangle: UIImageView!
    
    
    @IBOutlet weak var signupbutton: UIButton!
    
    @IBOutlet weak var loginbutton: UIButton!
    
    @IBOutlet weak var signupusername: UITextField!
    
    @IBOutlet weak var signuppassword: UITextField!
    
    @IBOutlet weak var signuppassword2: UITextField!
    
    @IBOutlet weak var resultsview: UIView!
    
    var noresult:Int = 743
    var yesresult:Int = 143
    
    var perc1:Double = 0
    var perc2:Double = 0
    var result1 = ""
    var result2 = ""
    var resperc1: String = ""
    var resperc2: String = ""

    @IBOutlet var mainview: UIView!
    
    @IBOutlet weak var resultlabel1: UILabel!
    
    @IBOutlet weak var resultlabel2: UILabel!
    
    @IBOutlet weak var barfront: UILabel!
    
    @IBOutlet weak var barfront2: UILabel!
    
    @IBOutlet weak var barback: UILabel!
    
    @IBOutlet weak var barback2: UILabel!
    
    @IBOutlet weak var blackback: UILabel!
    
    @IBOutlet weak var crossbutton: UIButton!
    
    @IBOutlet weak var checkbutton: UIButton!
    
    @IBOutlet weak var barborder: UILabel!
    
    
    
    @IBAction func nobutton(sender: AnyObject) {
        
        crossbutton.enabled = false
        checkbutton.enabled = false
        
        
        self.view.bringSubviewToFront(resultsview)
        self.mainview.userInteractionEnabled = false
        noresult = noresult + 1
        
        let resperc1int = (noresult * 100) / (noresult + yesresult)
        let resperc1 = "\((noresult * 100) / (noresult + yesresult))" as String
        let resperc2 = "\(100 - resperc1int)" as String
        resultlabel1.text = "\(noresult) (\(resperc1)%)" as String
        
        resultlabel2.text = "\(yesresult) (\(resperc2)%)" as String
        perc1 = Double((noresult * 100) / (noresult + yesresult))
        perc2 = Double((yesresult * 100) / (noresult + yesresult))
        
        var percent = CGFloat((noresult * 100) / (noresult + yesresult))
        var percent2 = CGFloat((yesresult * 100) / (noresult + yesresult))
        
        self.barfront.frame.size.width = self.barback.frame.size.width * percent * 0.01
        self.barfront.layer.masksToBounds = true
        
        self.barfront2.frame.size.width = self.barback2.frame.size.width * percent2 * 0.01
        self.barfront2.layer.masksToBounds = true
        
        self.resultsview.hidden = false
        
        UIView.animateWithDuration(0.3, animations: {
            self.resultsview.alpha = 1.0
            self.blackback.alpha = 1.0
   
            
        })
        let seconds = 1.5
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        let delay3 = 0.3 * Double(NSEC_PER_SEC)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay3)), dispatch_get_main_queue(), {
            self.mainview.userInteractionEnabled = true
        })
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            UIView.animateWithDuration(0.3, animations: {

                
                self.resultsview.alpha = 0
                self.blackback.alpha = 0
                self.crossbutton.enabled = true
                self.checkbutton.enabled = true
                
            })
        
            
        })
    

    }


    @IBAction func yesbutton(sender: AnyObject) {
        
        crossbutton.enabled = false
        checkbutton.enabled = false
        
        self.view.bringSubviewToFront(resultsview)
        self.view.userInteractionEnabled = false
        yesresult = yesresult + 1
        
        let resperc1int = (noresult * 100) / (noresult + yesresult)
        let resperc1 = "\((noresult * 100) / (noresult + yesresult))" as String
        let resperc2 = "\(100 - resperc1int)" as String
        resultlabel1.text = "\(noresult) (\(resperc1)%)" as String
        
        resultlabel2.text = "\(yesresult) (\(resperc2)%)" as String
        perc1 = Double((noresult * 100) / (noresult + yesresult))
        perc2 = Double((yesresult * 100) / (noresult + yesresult))
        
        var percent = CGFloat((noresult * 100) / (noresult + yesresult))
        var percent2 = CGFloat((yesresult * 100) / (noresult + yesresult))
        
        self.barfront.frame.size.width = self.barback.frame.size.width * percent * 0.01
        self.barfront.layer.masksToBounds = true
        
        self.barfront2.frame.size.width = self.barback2.frame.size.width * percent2 * 0.01
        self.barfront2.layer.masksToBounds = true
        
        self.resultsview.hidden = false
        
        UIView.animateWithDuration(0.3, animations: {
            self.resultsview.alpha = 1.0
            self.blackback.alpha = 1.0
            
            
        })
        let seconds = 1.5
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        let delay3 = 0.3 * Double(NSEC_PER_SEC)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay3)), dispatch_get_main_queue(), {
            self.mainview.userInteractionEnabled = true
        })
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            UIView.animateWithDuration(0.3, animations: {
                
                
                self.resultsview.alpha = 0
                self.blackback.alpha = 0
                self.crossbutton.enabled = true
                self.checkbutton.enabled = true
                
            })
            
            
        })
        
    }
    
    @IBOutlet weak var centerconstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var logindog: UIImageView!
    
    @IBOutlet weak var dogcaption: UILabel!
    
    @IBOutlet weak var loginpoodle: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let vignette = CIFilter(name:"CIVignette")
        vignette.setValue(self.view.backgroundColor, forKey:kCIInputImageKey)
        vignette.setValue(0.2, forKey:"inputIntensity")
        vignette.setValue(0.2, forKey:"inputRadius")
        self.a*/
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.barfront.frame
        rectShape.position = self.barfront.center
        rectShape.path = UIBezierPath(roundedRect: self.barfront.bounds, byRoundingCorners: .BottomLeft | .TopLeft, cornerRadii: CGSize(width: 13, height: 13)).CGPath
        
        self.barfront.layer.backgroundColor = UIColor.greenColor().CGColor
        //Here I'm masking the textView's layer with rectShape layer
        self.barfront.layer.mask = rectShape
        
        barborder.layer.cornerRadius = 13
        barborder.layer.borderColor = UIColor.grayColor().CGColor
        barborder.layer.borderWidth = 1
        barborder.layer.masksToBounds = true
        
        barback.layer.cornerRadius = 13

        barback.layer.masksToBounds = true
        
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .Dark)
        
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(blurView)
        
        
        
        if UIScreen.mainScreen().bounds.size.height == 480 {
            self.crossbutton.hidden = true
            self.checkbutton.hidden = true
            self.logindog.hidden = true
            self.dogcaption.hidden = true
            self.loginpoodle.hidden = true
            self.centerconstraint.constant = -35
            
            
            
        }
        
        
        
        
        
        blackback.alpha = 0
        resultsview.layer.cornerRadius = 6
        resultsview.layer.borderWidth = 2
        resultsview.layer.borderColor = UIColor(red: 196 / 255.0, green: 203 / 255.0, blue: 201 / 255.0, alpha: 1.0).CGColor
        resultsview.hidden = true
        self.resultsview.alpha = 0
        
        self.resultsview.backgroundColor = UIColor.whiteColor()
        
        
        
       
        
        
        
        caption.layer.cornerRadius = 4
        caption.layer.borderWidth = 0
        caption.layer.borderColor = UIColor.lightGrayColor().CGColor
        caption.layer.masksToBounds = true
        
        
        
        
        
        loginview.layer.cornerRadius = 4
        caption.layer.masksToBounds = true
        
        signupview.layer.cornerRadius = 4
        caption.layer.masksToBounds = true
        
        loginview.hidden = true
        logintriangle.hidden = true
        
        signupbutton.layer.cornerRadius = 4
        loginbutton.layer.cornerRadius = 4
        
        signupusername.delegate = self
        loginusername.delegate = self
        loginpassword.delegate = self
        signuppassword.delegate = self
        signuppassword2.delegate = self
        
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        //self.view.backgroundColor = UIColor(patternImage: scaleImage(backimg, and: self.view.frame.size))
    }
    
    
    @IBAction func signupselect(sender: AnyObject) {
        loginview.hidden = true
        signupview.hidden = false
        logintriangle.hidden = true
        signuptriangle.hidden = false
        
    }
    
    @IBAction func loginselect(sender: AnyObject) {
        loginview.hidden = false
        signupview.hidden = true
        logintriangle.hidden = false
        signuptriangle.hidden = true


        
        
    }
    
    @IBOutlet weak var loginusername: UITextField!
    
    
    @IBOutlet weak var loginpassword: UITextField!
    
    
    
    @IBAction func loginbutton(sender: AnyObject) {
        
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        PFUser.logInWithUsernameInBackground(loginusername.text, password: loginpassword.text) { (getuser, error: NSError!) -> Void in
            if getuser != nil {
                currentuser = getuser
                if UIDevice.currentDevice().model != "iPhone Simulator" {
                    let currentInstallation = PFInstallation.currentInstallation()
                    currentInstallation["user"] = currentuser
                    currentInstallation.saveInBackground()
                }
                
                var query69 = PFQuery(className: "followers")
                query69.whereKey("follower", equalTo: currentuser.objectId)
                query69.getFirstObjectInBackgroundWithBlock { (userinfoobject, NSError) -> Void in
                    
                    if userinfoobject != nil {
                        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                        
                        
                        appDelegate.userinfo = userinfoobject
                        
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
                                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                                
                                
                                appDelegate.userinfo = userinfocreate
                                
                                
                                
                                
                            } else {
                                
                                
                                
                                
                            }
                            
                        }
                        
                    }
                    
                }

                
                
                self.performSegueWithIdentifier("logintotab", sender: self)
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
    
    @IBAction func signupbutton(sender: AnyObject) {
        
        let countletters2 = count(signupusername.text)
        if signupusername != "" && countletters2 > 3 && countletters2 < 15 {
        
            var query = PFQuery(className: "followers")
            query.whereKey("alias", equalTo: signupusername.text)
            
            
            query.findObjectsInBackgroundWithBlock { (objects:[AnyObject]!, error:NSError!) -> Void in
                
                println(objects.count)
                if objects.count == 0 {

            
            
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        if self.checkSignup() == true {
            self.createUser()
        } else {
            var alert = UIAlertView(title: "Error", message: self.alertError as String, delegate: self, cancelButtonTitle: "okay")
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            alert.show()
        }
        
                } else {
                    
                    self.displayAlert3("Invalid Username", message: "Username is taken.")
                    
                }
            }
            
            
        } else {
            self.displayAlert3("Invalid Username", message: "Usernames have to be 4-14 characters long.")
        }
        
        
        
        
        
        
        
    }
    
    func checkSignup()-> Bool {
        
        if signupusername.text.isEmpty || signuppassword.text.isEmpty || signuppassword2.text.isEmpty {
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            alertError = "Oops! Text is empty"
            return false
        } else if signuppassword.text != signuppassword2.text {
            alertError = "Password did not match"
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            return false
        } else if count(signupusername.text) < 4 {
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            alertError = "Username should be more than 3"
            return false
        } else if count(signuppassword.text) < 3 {
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            alertError = "Password should be more than 5"
            return false
        }
        return true
    }
    
    
    func createUser() {
        
        userpf.username = signupusername.text
        userpf.password = signuppassword.text
        
        
        userpf.signUpInBackgroundWithBlock {
            (succeeded, error) -> Void in
            if error == nil {
                
                
                
                
                //currentuser.incrementKey("uservotecount", byAmount: 0)
                //currentuser.incrementKey("reportedOtherscount", byAmount: 0)
                //currentuser.incrementKey("PostNumber", byAmount: 0)
                
                //TAKE OUT LATER
                //currentuser.incrementKey("fbfriendcount", byAmount: 0)
                //currentuser.saveInBackground()
                
                justSignedUp = true
                currentuser = userpf
                if UIDevice.currentDevice().model != "iPhone Simulator" {
                    
                    
                    
                    
                }
                
                let singlefirstcompareimageData = UIImageJPEGRepresentation(UIImage(named: "usadog"), 0.50)
                
                let singlefirstcompareimageFile = PFFile(name: "image3.jpeg", data: singlefirstcompareimageData)
                
                
                
                
                let currentInstallation = PFInstallation.currentInstallation()
                currentInstallation["user"] = currentuser
                currentInstallation.saveInBackground()
                var userinfocreate = PFObject(className: "followers")
                userinfocreate["follower"] = currentuser.objectId as String
                userinfocreate["following"] = []
                userinfocreate["followedby"] = []
                userinfocreate.incrementKey("reportothers", byAmount: 0)
                userinfocreate.incrementKey("reported", byAmount: 0)
                userinfocreate["image"] = singlefirstcompareimageFile
                userinfocreate["about"] = "I just joined Peer Goggles!"
                userinfocreate["alias"] = self.signupusername.text
                userinfocreate.saveInBackground()
                
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                
                appDelegate.userinfo = userinfocreate
                
                self.performSegueWithIdentifier("logintotab", sender: self)
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
        if UIScreen.mainScreen().bounds.size.height == 480 {
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
    }
    func textFieldDidEndEditing(textField: UITextField) {
        if UIScreen.mainScreen().bounds.size.height == 480 {
        var viewFrame : CGRect = self.view.frame
        viewFrame.origin.y += animateDistance
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        
        UIView.setAnimationDuration(NSTimeInterval(MoveKeyboard.KEYBOARD_ANIMATION_DURATION))
        
        self.view.frame = viewFrame
        
        UIView.commitAnimations()
        }
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField.isEqual(signupusername) {
            signupusername.text = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string.lowercaseString)
            return false
        }
        
        if textField.isEqual(loginusername) {
            loginusername.text = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string.lowercaseString)
            return false
        }
        
        if string == "\n"
        {
            textField.resignFirstResponder()
            return false
        }
        
        
        
        
        return true
    }
    
    /*
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }*/
    
    
    
    @IBAction func loginAction(sender: AnyObject) {
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        PFUser.logInWithUsernameInBackground(usernameTF.text, password: passwordTF.text) { (getuser, error: NSError!) -> Void in
            if getuser != nil {
                currentuser = getuser
                if UIDevice.currentDevice().model != "iPhone Simulator" {
                    let currentInstallation = PFInstallation.currentInstallation()
                    currentInstallation["user"] = currentuser
                    currentInstallation.saveInBackground()
                }
                self.performSegueWithIdentifier("logintotab", sender: self)
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
    func displayAlert3(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func loginFb(sender: AnyObject) {
        
        //if Reachability.isConnectedToNetwork() == true {
           // println("Internet connection OK")
            
            MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            var permissions = ["public_profile"]
            
            PFFacebookUtils.logInWithPermissions(permissions, block: {
                (fbuser: PFUser!, error: NSError!) -> Void in
                if fbuser == nil {
                    NSLog("Uh oh. The user cancelled the Facebook login.")
                    MBProgressHUD.hideHUDForView(self.view, animated: true)
                } else if fbuser.isNew {
                    NSLog("User signed up and logged in through Facebook!")
                    justSignedUp = true
                    currentuser = fbuser
                    self.createFbUser()
                    
                } else if fbuser != nil{
                    NSLog("User logged in through Facebook!")
                    currentuser = fbuser
                    
                    
                    
                    
                    if UIDevice.currentDevice().model != "iPhone Simulator" {
                        let currentInstallation = PFInstallation.currentInstallation()
                        currentInstallation["user"] = currentuser
                        currentInstallation.saveInBackground()
                    }
                    MBProgressHUD.hideHUDForView(self.view, animated: true)
                    
                    
                    var query69 = PFQuery(className: "followers")
                    query69.whereKey("follower", equalTo: currentuser.objectId)
                    query69.getFirstObjectInBackgroundWithBlock { (userinfoobject, NSError) -> Void in
                        
                        if userinfoobject != nil {
                            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                            
                            
                            appDelegate.userinfo = userinfoobject
                            self.performSegueWithIdentifier("logintotab", sender: self)
                            
                        } else {
                            self.performSegueWithIdentifier("newusersegue", sender: self)
                            
                        }
                        
                    }
                    
                } else {
                    MBProgressHUD.hideHUDForView(self.view, animated: true)
                    if let errorString = error.userInfo?["error"] as? NSString {
                        var alert = UIAlertView(title: "Error", message: errorString as String, delegate: self, cancelButtonTitle: "okay")
                        alert.show()
                    }
                }
            })
            
            
        /*} else {
            println("Internet connection FAILED")
            var alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }*/
        
    }
    
    

    
    func createFbUser() {
        
        FBRequestConnection.startWithGraphPath("me", completionHandler: { (connection, fbuser, error) -> Void in
            
            //if let useremail = fbuser.objectForKey("email") as? String {
            //    currentuser.email = useremail
            //}
            
            currentuser["fname"] = fbuser.name // full name
            
            if let gender = fbuser.objectForKey("gender") as? String {
                if gender == "male" {
                    currentuser["gender"] = 1
                    
                } else  if gender == "female" {
                    currentuser["gender"] = 2
                    
                }
            }
            
            var id = fbuser.objectID as String
            var url = NSURL(string: "https://graph.facebook.com/\(id)/picture?width=640&height=640")!
            var data = NSData(contentsOfURL: url)
            var image = UIImage(data: data!)
            var imageL = scaleImage(image!, and: 320) // save 640x640 image
            var imageS = scaleImage(image!, and: 60)
            var dataL = UIImageJPEGRepresentation(imageL, 0.9)
            var dataS = UIImageJPEGRepresentation(imageS, 0.9)
            //currentuser["dpLarge"] = PFFile(name: "dpLarge.jpg", data: dataL)
            currentuser["dpSmall"] = PFFile(name: "dpSmall.jpg", data: dataS)
            currentuser["name"] = fbuser.first_name as String
            currentuser["fbId"] = fbuser.objectID as String
            
            //currentuser["age"] = 18
            
            
            
            //currentuser.incrementKey("uservotecount", byAmount: 0)
            //currentuser.incrementKey("reportedOtherscount", byAmount: 0)
            //currentuser.incrementKey("PostNumber", byAmount: 0)
            
            //TAKE OUT LATER
            //currentuser.incrementKey("fbfriendcount", byAmount: 0)
            
            currentuser.saveInBackgroundWithBlock({ (done, error) -> Void in
                if !(error != nil) {
                    if UIDevice.currentDevice().model != "iPhone Simulator" {
                        let currentInstallation = PFInstallation.currentInstallation()
                        currentInstallation["user"] = currentuser
                        currentInstallation.saveInBackground()
                        
                        
                        
                    }
                    MBProgressHUD.hideHUDForView(self.view, animated: true)
                    
                    
                    self.performSegueWithIdentifier("newusersegue", sender: self)
                } else {
                    println(error)
                    MBProgressHUD.hideHUDForView(self.view, animated: true)
                    
                }
            })
        })
        
    }
    
    
    
    
    
    
    /*
    func createUser() {
        
        
        PFUser().signUpInBackgroundWithBlock {
            (succeeded, error) -> Void in
            if error == nil {
                self.performSegueWithIdentifier("signedup", sender: self)
            } else {
                if let errorString = error.userInfo?["error"] as? NSString {
                    var alert = UIAlertView(title: "Error", message: errorString as String, delegate: self, cancelButtonTitle: "okay")
                    alert.show()
                }
                
            }
        }
        
        
    }*/
    
    @IBAction func prompt(sender: AnyObject) {
        
        self.displayAlert3("Can't Login?", message: "Peer Goggles uses Facebook Login to verify if your human. In order to use Peer Goggles, goto your iPhone settings. Under 'Facebook' enable Peer Goggles to login using your Facebook account. If error persists check your internet connection.")
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
