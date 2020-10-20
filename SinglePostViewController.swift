//
//  SinglePostViewController.swift
//  Finder
//
//  Created by Ivan Khau on 7/7/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit
import CoreImage

/*
extension UIImage {
    func imageWithColors(tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext() as CGContextRef
        CGContextTranslateCTM(context, 0, self.size.height)
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextSetBlendMode(context, kCGBlendModeNormal)
        
        let rect = CGRectMake(0, 0, self.size.width, self.size.height) as CGRect
        CGContextClipToMask(context, rect, self.CGImage)
        tintColor.setFill()
        CGContextFillRect(context, rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}*/


class SinglePostViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate, UITextFieldDelegate {  //, CLLocationManagerDelegate {
    @IBOutlet weak var changecategory: UIButton!
    
    @IBOutlet weak var addsecond: UIButton!
    var lastviewed1 = ""
    
   // private var currentLocation: PFGeoPoint?
    var manager:CLLocationManager = CLLocationManager()

    @IBOutlet weak var addusername: UIView!
    
    /*
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if locations.count > 0 {
            self.manager.stopUpdatingLocation()
            let location = locations[0] as! CLLocation
            currentLocation = PFGeoPoint(location: location)
        }
    }*/
    @IBOutlet weak var questiontypelabel: UILabel!
    
    //@IBOutlet weak var questiontypeoutlet: UIButton!
    
    
    @IBAction func openquestionview(sender: AnyObject) {
        
        self.questiontypeview.hidden = false
        
        
        
        
    }
    
    @IBAction func closequestiontype(sender: AnyObject) {
        
        self.questiontypeview.hidden = true
        
    }
    
    @IBAction func should(sender: AnyObject) {
        self.questiontypelabel.text = "#ShouldI?"
        //self.questiontypeoutlet.setTitle("#ShoudI?", forState: .Normal)
        self.questiontypeview.hidden = true
        should.alpha = 1
        would.alpha = 0.5
        have.alpha = 0.5
        did.alpha = 0.5
        hate.alpha = 0.5
        love.alpha = 0.5
        like.alpha = 0.5
        remember.alpha = 0.5
        
    }
    
    @IBAction func would(sender: AnyObject) {
        self.questiontypelabel.text = "#WouldYou?"
        //self.questiontypeoutlet.setTitle("#WouldYou?", forState: .Normal)
        self.questiontypeview.hidden = true
        should.alpha = 0.5
        would.alpha = 1
        have.alpha = 0.5
        did.alpha = 0.5
        hate.alpha = 0.5
        love.alpha = 0.5
        like.alpha = 0.5
        remember.alpha = 0.5
        
    }
    
    @IBAction func have(sender: AnyObject) {
        self.questiontypelabel.text = "#HaveYou?"
        //self.questiontypeoutlet.setTitle("#HaveYou?", forState: .Normal)
        self.questiontypeview.hidden = true
        should.alpha = 0.5
        would.alpha = 0.5
        have.alpha = 1
        did.alpha = 0.5
        hate.alpha = 0.5
        love.alpha = 0.5
        like.alpha = 0.5
        remember.alpha = 0.5
        
    }
    
    @IBAction func did(sender: AnyObject) {
        self.questiontypelabel.text = "#DidYou?"
        //self.questiontypeoutlet.setTitle("#DidYou?", forState: .Normal)
        self.questiontypeview.hidden = true
        should.alpha = 0.5
        would.alpha = 0.5
        have.alpha = 0.5
        did.alpha = 1
        hate.alpha = 0.5
        love.alpha = 0.5
        like.alpha = 0.5
        remember.alpha = 0.5
        
    }
    
    @IBAction func hate(sender: AnyObject) {
        self.questiontypelabel.text = "#HateThis?"
        //self.questiontypeoutlet.setTitle("#HateThis?", forState: .Normal)
        self.questiontypeview.hidden = true
        should.alpha = 0.5
        would.alpha = 0.5
        have.alpha = 0.5
        did.alpha = 0.5
        hate.alpha = 1
        love.alpha = 0.5
        like.alpha = 0.5
        remember.alpha = 0.5
        
    }
    
    @IBAction func love(sender: AnyObject) {
        self.questiontypelabel.text = "#LoveThis?"
        //self.questiontypeoutlet.setTitle("#LoveThis?", forState: .Normal)
        self.questiontypeview.hidden = true
        should.alpha = 0.5
        would.alpha = 0.5
        have.alpha = 0.5
        did.alpha = 0.5
        hate.alpha = 0.5
        love.alpha = 1
        like.alpha = 0.5
        remember.alpha = 0.5
        
    }
    
    @IBAction func like(sender: AnyObject) {
        self.questiontypelabel.text = "#LikeThis?"
        //self.questiontypeoutlet.setTitle("#LikeThis?", forState: .Normal)
        self.questiontypeview.hidden = true
        should.alpha = 0.5
        would.alpha = 0.5
        have.alpha = 0.5
        did.alpha = 0.5
        hate.alpha = 0.5
        love.alpha = 0.5
        like.alpha = 1
        remember.alpha = 0.5
        
    }
    
    @IBAction func remember(sender: AnyObject) {
        self.questiontypelabel.text = "RememberThis?"
        //self.questiontypeoutlet.setTitle("RememberThis?", forState: .Normal)
        self.questiontypeview.hidden = true
        should.alpha = 0.5
        would.alpha = 0.5
        have.alpha = 0.5
        did.alpha = 0.5
        hate.alpha = 0.5
        love.alpha = 0.5
        like.alpha = 0.5
        remember.alpha = 1
        
    }
    
    @IBOutlet weak var should: UIButton!
    @IBOutlet weak var would: UIButton!
    @IBOutlet weak var have: UIButton!
    @IBOutlet weak var did: UIButton!
    @IBOutlet weak var hate: UIButton!
    @IBOutlet weak var love: UIButton!
    @IBOutlet weak var like: UIButton!
    @IBOutlet weak var remember: UIButton!
    
    
    

    
    
    @IBOutlet weak var posttypetext: UILabel!
    @IBOutlet weak var posttype: UISegmentedControl!
    
    @IBAction func posttypeaction(sender: AnyObject) {
        
        if posttype.selectedSegmentIndex == 1 {
            println("selected")
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            let userinfo = appDelegate.userinfo
            if userinfo["alias"] == nil {
                addusername.hidden = false
                println("no username")
            }
            
            
        }
        
    }
    
    
    
    @IBOutlet weak var usernametext: UITextField!
    
    @IBAction func usernamesubmit(sender: AnyObject) {
        let countletters = count(usernametext.text)
        
        
        
        if usernametext != "" && countletters > 3 && countletters < 15 {
            var query = PFQuery(className: "followers")
            query.whereKey("alias", equalTo: usernametext.text)
            query.findObjectsInBackgroundWithBlock { (objects:[AnyObject]!, error:NSError!) -> Void in
                
                println(objects.count)
                if objects.count == 0 {
                    
                    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    
                    let userinfo = appDelegate.userinfo
                
            
                userinfo["alias"] = self.usernametext.text
                userinfo.saveInBackground()
                self.addusername.hidden = true
            } else {
            
                self.displayAlert3("Invalid Username", message: "Username is taken.")
                    
                }
            }
        } else {
            self.displayAlert3("Invalid Username", message: "Usernames have to be 4-14 characters long.")
        }
        
        
    
        
    
    
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField.isEqual(usernametext) {
            usernametext.text = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string.lowercaseString)
            return false
        }
        
        if string == "\n"
        {
            textField.resignFirstResponder()
            return false
        }
        
        return true
    }
    
    
    
    
    @IBOutlet weak var otherbutton: UIButton!
    
    @IBAction func otherbuttonaction(sender: AnyObject) {
        
        questiontype.selectedSegmentIndex = 2
        questiontypeview.hidden = false
        
    }
    
    
    
    
    @IBOutlet weak var questiontypetext: UILabel!
    @IBOutlet weak var questiontype: UISegmentedControl!
    
    @IBAction func questiontypeaction(sender: AnyObject) {
        
        //if questiontype.selectedSegmentIndex == 2 {
         //   questiontypeview.hidden = false
        //}
        
    }
    
    
    
    
    
    
    
    @IBOutlet weak var questiontypeview: UIView!
    
    
    //@IBOutlet weak var borderlabel: UILabel!
    
    //@IBOutlet weak var infobutton: UIButton!
    
    
    //@IBAction func infobuttonaction(sender: AnyObject) {
        
    //    infoimage.hidden = false
   //     infoimage.enabled = true
        
        
        
    //}
    
    //@IBOutlet weak var infoimage: UIButton!
    
    
    //@IBAction func infoimageaction(sender: AnyObject) {
        
   //     infoimage.hidden = true
    //    infoimage.enabled = false
        
    //}
    
    
    
    
    
    
    
    
    //@IBOutlet weak var infobutton: UIButton!
    
    
    @IBAction func closeaction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
    @IBOutlet weak var typelabel: UILabel!
    
    //@IBOutlet weak var thisthatoutlet: UIButton!
    
    //@IBOutlet weak var yesnooutlet: UIButton!
    
    
    //@IBOutlet weak var questiontype: UILabel!
    
    /*
    @IBAction func thisthatbutton(sender: AnyObject) {
        self.typelabel.text = "onetwo"
        
        self.thisthatoutlet.alpha = 1
        self.yesnooutlet.alpha = 0.4
        
    }
    
    @IBAction func yesnobutton(sender: AnyObject) {
        
        self.typelabel.text = "yesno"
        self.thisthatoutlet.alpha = 0.4
        self.yesnooutlet.alpha = 1
    }*/
   
    
    
    
    
    @IBOutlet weak var cleanrevert: UILabel!
    
    
    //GOOBERBOOBBUTT
    //GOOBERBOOBBUTT
    
    
    //var currentLocation = PFGeoPoint(location: location)
    
    //GOOBERBOOBBUTT
    //GOOBERBOOBBUTT
    
    
    @IBOutlet weak var revertimageview: UIImageView!
    @IBOutlet weak var revertimageview2: UIImageView!
    
    @IBOutlet weak var revertimageview3: UIImageView!
    @IBOutlet weak var what1: UIImageView!
    @IBOutlet weak var what2: UIImageView!
    @IBOutlet weak var what3: UIImageView!
    
    
    
    
    
    
    @IBOutlet weak var addphotooutlet: UIButton!
    //@IBOutlet weak var flagwarn2: UILabel!
    //@IBOutlet weak var greenCheckOutlet: UIButton!
    //@IBOutlet weak var redCrossOutlet: UIButton!
    //@IBOutlet weak var redOneOutlet: UIButton!
        
    //@IBOutlet weak var greenTwoOutlet: UIButton!
    //@IBOutlet weak var switchOutlet: UISwitch!
    /*
    @IBAction func switchAction(sender: AnyObject) {
        if switchOutlet.on {
        redOneOutlet.enabled = false
        greenTwoOutlet.enabled = false
        redCrossOutlet.enabled = true
        greenCheckOutlet.enabled = true
            switchOutlet.onTintColor = UIColor.lightGrayColor()
            switchOutlet.tintColor = UIColor.lightGrayColor()
        //switchOutlet.backgroundColor = UIColor.blueColor()
        
        }
        else
        {
        redOneOutlet.enabled = true
        greenTwoOutlet.enabled = true
        redCrossOutlet.enabled = false
        greenCheckOutlet.enabled = false
            switchOutlet.onTintColor = UIColor.lightGrayColor()
            switchOutlet.tintColor = UIColor.lightGrayColor()
        //switchOutlet.backgroundColor = UIColor.blueColor()
        }
        
    }*/
    

    
    
    
    @IBOutlet weak var singlepostcancelbuttonoutlet: UIButton!
    
    
    @IBOutlet weak var singlefirstdetectbuttonoutlet: UIButton!
    
    @IBOutlet weak var singlefirstblurbuttonoutlet: UIButton!
    
    @IBOutlet weak var singlesubmitpostbuttonoutlet: UIButton!
    
    @IBOutlet weak var placeholderimage: UIImageView!
    
    var activityIndicator = UIActivityIndicatorView()
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func displayAlert3(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    

    

    
    @IBOutlet weak var singlefirstimagepostview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        //blackimage.backgroundColor = UIColor.blackColor()
        
        //blackimage.image = UIImage(named: "blacktop")
        
        
        
        changecategory.layer.cornerRadius = 4
        changecategory.layer.borderColor = UIColor.lightGrayColor().CGColor
        changecategory.layer.borderWidth = 1
        changecategory.layer.masksToBounds = true
        
        usernametext.delegate = self
        
        
        
        
        
        
        otherbutton.hidden = true
        addusername.hidden = true
        //questiontypeoutlet.alpha = 0.15
        
        
        

        
        
        posttype.alpha = 0.15
        posttypetext.alpha = 0.15
        posttype.enabled = false
        
        questiontype.alpha = 0.15
        questiontypetext.alpha = 0.15
        questiontype.enabled = false
        
        questiontypeview.hidden = true
        
        undobutton.layer.cornerRadius = 4
        
        addsecond.layer.cornerRadius = 4
        
        undobutton.hidden = true
        
        addsecond.hidden = true
        //borderlabel.layer.borderWidth = 2
        //borderlabel.layer.borderColor = UIColor(red: 196 / 255.0, green: 203 / 255.0, blue: 201 / 255.0, alpha: 1.0).CGColor
        
        self.singlecomparecomment.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.singlecomparecomment.layer.borderWidth = 1
        
                //infoimage.hidden = true
        //infoimage.enabled = false
        singlecomparecomment.delegate = self
        
        //infobutton.enabled = false
        //infobutton.alpha = 0.15
        
        cleanrevert.text = "nofilter"
        
        //GOOBERBOOBBUTT
        //GOOBERBOOBBUTT
        /*
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        if iOS8 {
            manager.requestWhenInUseAuthorization()
        }
        
        manager.startUpdatingLocation()*/
        
        //GOOBERBOOBBUTT
        //GOOBERBOOBBUTT
        
        //switchOutlet.onTintColor = UIColor.lightGrayColor()
        //switchOutlet.tintColor = UIColor.lightGrayColor()
        //redOneOutlet.enabled = false
        //greenTwoOutlet.enabled = false
        //flagwarn2.hidden = true
        
        typelabel.text = "yesno"
        
        //thisthatoutlet.alpha = 0.15
        
       // yesnooutlet.alpha = 0.15
        
       // thisthatoutlet.enabled = false
        
      //  yesnooutlet.enabled = false
        
       // questiontype.alpha = 0.15
        
        singlepostcancelbuttonoutlet.layer.cornerRadius = 3
        singlesubmitpostbuttonoutlet.layer.cornerRadius = 5
        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    
        
        revertbuttonoutlet.enabled = false
        singlefirstdetectbuttonoutlet.enabled = false
        singlefirstblurbuttonoutlet.enabled = false
        singlesubmitpostbuttonoutlet.enabled = false
        //singlecomparecomment.enabled = false
        singlecomparecomment.editable = false
        revertbuttonoutlet.alpha = 0.15
        singlefirstdetectbuttonoutlet.alpha = 0.15
        singlefirstblurbuttonoutlet.alpha = 0.15
        singlesubmitpostbuttonoutlet.alpha = 0.15
        singlecomparecomment.alpha = 0.15
        
        what2.hidden = true
        what3.hidden = true
        
        
        self.singlefirstimagepostview.layer.borderWidth = 2
        self.singlefirstimagepostview.layer.borderColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0).CGColor
        

        /*
        var quero = PFQuery(className: "Post")

        quero.whereKey("userId", equalTo: currentuser.objectId)
        quero.whereKey("Reportcount", greaterThan: 6)
        if quero.findObjects().count > 6 {
            //flagwarn2.hidden = false
            //addphotooutlet.enabled = false
            //submitpostbuttonoutlet.enabled = false
            currentuser.incrementKey("reviewneeded")
            currentuser.saveInBackground()
            self.displayAlert("Your Account is Under Review", message: "Please try again later.")

            //self.performSegueWithIdentifier("doubletotab", sender: self)
        }*/
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        //self.singlecomparecomment.delegate = self
    }
    

    
    //private var currentLocation: PFGeoPoint?
    
    //
    /*
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if locations.count > 0 {
            self.manager.stopUpdatingLocation()
            let location = locations[0] as! CLLocation
            currentuser["location"] = PFGeoPoint(location: location)
            //var post = PFObject(className: "Post")
            //post["location"] = PFGeoPoint(location: location)
            //println(PFGeoPoint(location: location))

            
            
            
            //private var currentLocation: CLLocation?
            
            //return location
            
            
            currentLocation = PFGeoPoint(location: location)
            
            //singlecomparepost(self)
            
            
            //return currentLocation
        }
    }
    */

    
    func keyboardWillShow(sender: NSNotification) {
        //self.view.frame.origin.y -= 190
        /*
        if UIScreen.mainScreen().bounds.size.height == 480.0 {
            self.view.frame.origin.y -= 204
            
            
        }
        
        
        if UIScreen.mainScreen().bounds.size.height == 568.0 {
            self.view.frame.origin.y -= 204

            
        }
        
        if UIScreen.mainScreen().bounds.size.height == 667.0 {
            self.view.frame.origin.y -= 204
            
            
        }
        
        if UIScreen.mainScreen().bounds.size.height == 736.0 {
            
            self.view.frame.origin.y -= 204
            
        }
        */

        
        
    }
    @IBOutlet weak var keyboardHeightLayoutConstraint: NSLayoutConstraint!
    
    func keyboardWillHide(sender: NSNotification) {
        //self.view.frame.origin.y += 190
        
       
        /*
        
        if UIScreen.mainScreen().bounds.size.height == 480.0 {
            self.view.frame.origin.y += 204
            
            
        }
        
        
        
        if UIScreen.mainScreen().bounds.size.height == 568.0 {
            self.view.frame.origin.y += 204
            
            
        }
        
        if UIScreen.mainScreen().bounds.size.height == 667.0 {
            self.view.frame.origin.y += 204
            
            
        }
        
        if UIScreen.mainScreen().bounds.size.height == 736.0 {
            self.view.frame.origin.y += 204
            
            
        }*/
    }
    
    //Calls this function when the tap is recognized.
    
    

    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
     
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func singlefirstActionTakePicture(sender: AnyObject) {
        
        //@IBAction func buttonActionTakePicture(sender: AnyObject) {
        
        // fetch image from image picker
        ImagePickerManager.sharedManager.presentImagePicker(self) { (image, source) -> () in
            self.singlefirstimagepostview.image = image
            self.singlefirstdetectbuttonoutlet.enabled = true
            self.singlefirstblurbuttonoutlet.enabled = true
            //self.singlecomparecomment.enabled = true
            self.revertimageview3.image = image
            
            self.revertimageview.image = image
            
            self.addphotooutlet.backgroundColor = UIColor.clearColor()

            self.addphotooutlet.setTitle("", forState: UIControlState.Normal)
            
            
            self.revertbuttonoutlet.enabled = true
            self.singlefirstdetectbuttonoutlet.enabled = true
            self.singlefirstblurbuttonoutlet.enabled = true
            self.singlecomparecomment.editable = true
            
            self.revertbuttonoutlet.alpha = 1
            self.singlefirstdetectbuttonoutlet.alpha = 1
            self.singlefirstblurbuttonoutlet.alpha = 1
            self.singlecomparecomment.alpha = 1
            
            self.what1.hidden = true
            self.what2.hidden = false
            
            
            self.singlefirstimagepostview.layer.borderWidth = 3
            self.singlefirstimagepostview.layer.borderColor = UIColor.blackColor().CGColor

            
            self.singlecomparecomment.layer.borderWidth = 1
            self.singlecomparecomment.layer.borderColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0).CGColor
            
          //  self.questiontypeoutlet.alpha = 1
            
          //  self.thisthatoutlet.alpha = 0.40
            
         //   self.yesnooutlet.alpha = 1
            
         //   self.thisthatoutlet.enabled = true
            
          //  self.yesnooutlet.enabled = true
            
          //  self.questiontype.alpha = 1
            
          //  self.infobutton.enabled = true
          //  self.infobutton.alpha = 1
            
            self.singlecomparecomment.textColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)
            self.addsecond.hidden = false
            //self.addphotooutlet.hidden = true
            
            self.posttype.enabled = true
            self.posttype.alpha = 1
            self.posttypetext.alpha = 1
            
            self.questiontype.enabled = true
            self.questiontype.alpha = 1
            self.questiontypetext.alpha = 1
            self.otherbutton.hidden = false
            
            /*
            var query1 = PFQuery(className: "followers")
            query1.whereKey("follower", equalTo: currentuser.objectId)
            query1.getFirstObjectInBackgroundWithBlock { (followObject, NSError) -> Void in
                
                if followObject != nil {
                    if followObject.objectForKey("reported") as! Int > 99 {
                        self.displayAlert2("Hold up!", message: "Your account is flagged for review. Please try posting again later.")
                    }
                    
                    
                }
                
            }*/

            
            
            
            
            
            
        }
        
    }
    var blackimage = UIImage(named: "blacktop")
    
    @IBAction func secondactiontakepicture(sender: AnyObject) {
        ImagePickerManager.sharedManager.presentImagePicker(self) { (image, source) -> () in
        self.revertimageview2.image = image
            
            
            
            /*
            var size = CGSize(width: self.singlefirstimagepostview.frame.width*1.5, height: self.singlefirstimagepostview.frame.height*1.5)
            UIGraphicsBeginImageContext(size)
            let areaSize = CGRect(x: 0, y: 0, width: size.width/2, height: size.height)
            
            
            var leftimage = CGImageCreateWithImageInRect(self.revertimageview.image!.CGImage, CGRectMake(self.revertimageview.image!.size.width*0.25, 0, self.revertimageview.image!.size.width/2 , self.revertimageview.image!.size.height))
            
            var rightimage = CGImageCreateWithImageInRect(self.revertimageview2.image!.CGImage, CGRectMake(self.revertimageview2.image!.size.width*0.25, 0, self.revertimageview2.image!.size.width/2 , self.revertimageview2.image!.size.height))
            
            
            let leftyimage = UIImage(CGImage: leftimage)
            let rightyimage = UIImage(CGImage: rightimage)

            leftyimage!.drawInRect(areaSize)

            let areaSize2 = CGRect(x: size.width/2, y: 0, width: size.width/2, height: size.height)

            rightyimage!.drawInRect(areaSize2, blendMode: kCGBlendModeNormal, alpha: 1)
            
            var newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            self.singlefirstimagepostview.image = newImage
            self.revertimageview.image = newImage
            
            self.addsecond.hidden = true
            self.undobutton.hidden = false
           */
            
            
            var size = CGSize(width: self.singlefirstimagepostview.frame.width*1.5, height: self.singlefirstimagepostview.frame.height*1.5)
            UIGraphicsBeginImageContext(size)
            let areaSize = CGRect(x: 0, y: size.width * 0.25, width: size.width/2, height: size.height * 0.5)
            
            
            
            
            /*
            var leftimage = CGImageCreateWithImageInRect(self.revertimageview.image!.CGImage, CGRectMake(self.revertimageview.image!.size.width*0.25, 0, self.revertimageview.image!.size.width/2 , self.revertimageview.image!.size.height))
            
            var rightimage = CGImageCreateWithImageInRect(self.revertimageview2.image!.CGImage, CGRectMake(self.revertimageview2.image!.size.width*0.25, 0, self.revertimageview2.image!.size.width/2 , self.revertimageview2.image!.size.height))
            */
            
            
            var leftimage = CGImageCreateWithImageInRect(self.revertimageview.image!.CGImage, CGRectMake(0, 0, self.revertimageview.image!.size.width , self.revertimageview.image!.size.height))
            
            var rightimage = CGImageCreateWithImageInRect(self.revertimageview2.image!.CGImage, CGRectMake(0, 0, self.revertimageview2.image!.size.width , self.revertimageview2.image!.size.height))
            
            
            
            
            
            
            var topimage = CGImageCreateWithImageInRect(self.blackimage!.CGImage, CGRectMake(0, 0, self.revertimageview.image!.size.width , self.revertimageview.image!.size.height))
            
            
            
            
            
            let leftyimage = UIImage(CGImage: leftimage)
            let rightyimage = UIImage(CGImage: rightimage)
            
            leftyimage!.drawInRect(areaSize)
            
            let areaSize2 = CGRect(x: size.width/2, y: size.width * 0.25, width: size.width/2, height: size.height * 0.5)
            
            rightyimage!.drawInRect(areaSize2, blendMode: kCGBlendModeNormal, alpha: 1)
            
            
            let areaSize3 = CGRect(x: 0, y: 0, width: size.width, height: size.height * 0.25)
            let areaSize4 = CGRect(x: 0, y: size.height * 0.75, width: size.width, height: size.height * 0.25)
            
            self.blackimage!.drawInRect(areaSize3, blendMode: kCGBlendModeNormal, alpha: 1)
            self.blackimage!.drawInRect(areaSize4, blendMode: kCGBlendModeNormal, alpha: 1)
            
            
            var newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            self.singlefirstimagepostview.image = newImage
            self.revertimageview.image = newImage
            
            self.addsecond.hidden = true
            self.undobutton.hidden = false
            
            
            

            
            
            
            
            
        }
        
    }
    
    
    @IBOutlet weak var undobutton: UIButton!
    
    @IBAction func undoaction(sender: AnyObject) {
        self.singlefirstimagepostview.image = self.revertimageview3.image
        self.revertimageview.image = self.revertimageview3.image
        self.addsecond.hidden = false
        self.undobutton.hidden = true
        
    }
    
    
    
    @IBOutlet weak var revertbuttonoutlet: UIButton!
    
    
    @IBAction func revertbuttonaction(sender: AnyObject) {
        
        if cleanrevert.text == "nofilter" {
            
            var ciImage  = CIImage(CGImage:singlefirstimagepostview.image!.CGImage)
            var ciDetector = CIDetector(ofType:CIDetectorTypeFace
                ,context:nil
                ,options:[
                    CIDetectorAccuracy:CIDetectorAccuracyHigh,
                    CIDetectorSmile:true
                ]
            )
            var features = ciDetector.featuresInImage(ciImage)
            
            UIGraphicsBeginImageContext(singlefirstimagepostview.image!.size)
            singlefirstimagepostview.image!.drawInRect(CGRectMake(0,0,singlefirstimagepostview.image!.size.width,singlefirstimagepostview.image!.size.height))
            
            for feature in features{
                
                var drawCtxt = UIGraphicsGetCurrentContext()
                
                // Face
                var faceRect = (feature as! CIFaceFeature).bounds
                faceRect.origin.y = singlefirstimagepostview.image!.size.height - faceRect.origin.y - faceRect.size.height
                
                
                // Mouth
                if((feature.hasMouthPosition) != nil){
                    var mouseRectY = singlefirstimagepostview.image!.size.height - feature.mouthPosition.y
                    var mouseRect  = CGRectMake(feature.mouthPosition.x - 5,mouseRectY - 5,10,10)
                    
                }
                
                // Dog Face
                var hige1Img      = UIImage(named:"dogfilter2.png")
                var mouseRectY = singlefirstimagepostview.image!.size.height - feature.mouthPosition.y
                var hige1Width  = faceRect.size.width
                var hige1Height = hige1Width
                var hige1Rect  = CGRectMake(feature.mouthPosition.x - hige1Width/1.6,mouseRectY - hige1Width/1,hige1Width*1.3,hige1Height*1.3)
                CGContextDrawImage(drawCtxt,hige1Rect,hige1Img!.CGImage)
                
                // Left Eye
                if((feature.hasLeftEyePosition) != nil){
                    var leftEyeRectY = singlefirstimagepostview.image!.size.height - feature.leftEyePosition.y
                    var leftEyeRect  = CGRectMake(feature.leftEyePosition.x - 5,leftEyeRectY - 5,10,10)
                    
                }
                
                //rightEye
                if((feature.hasRightEyePosition) != nil){
                    var rightEyeRectY = singlefirstimagepostview.image!.size.height - feature.rightEyePosition.y
                    var rightEyeRect  = CGRectMake(feature.rightEyePosition.x - 5,rightEyeRectY - 5,10,10)
                    
                }
            }
            var drawedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            singlefirstimagepostview.image = drawedImage
            self.cleanrevert.text = "yesfilter"
            
        } else {
            
            self.singlefirstimagepostview.image = revertimageview.image
            
            self.cleanrevert.text = "nofilter"
            
            
        }
        

    }
    
    var beforetextselect = "yes"
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        //self.view.frame.origin.y += 210
        view.endEditing(true)
    }
    
    struct MoveKeyboard {
        static let KEYBOARD_ANIMATION_DURATION : CGFloat = 0.3
        static let MINIMUM_SCROLL_FRACTION : CGFloat = 0.2;
        static let MAXIMUM_SCROLL_FRACTION : CGFloat = 0.8;
        static let PORTRAIT_KEYBOARD_HEIGHT : CGFloat = 216;
        static let LANDSCAPE_KEYBOARD_HEIGHT : CGFloat = 162;
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"
        {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    
    var animateDistance: CGFloat!
    
    func textViewDidBeginEditing(textView: UITextView) {
        //self.view.frame.origin.y -= 210
        let textFieldRect : CGRect = self.view.window!.convertRect(textView.bounds, fromView: textView)
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
        
        
        self.what2.hidden = true
        self.singlecomparecomment.textAlignment = .Left
        self.singlecomparecomment.textColor = UIColor.blackColor()
        if beforetextselect == "yes" {
        self.singlecomparecomment.text = ""
            beforetextselect = "no"
        }
        self.singlecomparecomment.layer.borderWidth = 2
        self.singlecomparecomment.font = UIFont(name: "AvenirNext-Regular", size: 14)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        
        var viewFrame : CGRect = self.view.frame
        viewFrame.origin.y += animateDistance
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        
        UIView.setAnimationDuration(NSTimeInterval(MoveKeyboard.KEYBOARD_ANIMATION_DURATION))
        
        self.view.frame = viewFrame
        
        UIView.commitAnimations()
        
        
        self.singlesubmitpostbuttonoutlet.backgroundColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)
        self.singlesubmitpostbuttonoutlet.enabled = true
        
        
        

        
        self.singlecomparecomment.layer.borderColor = UIColor.blackColor().CGColor
        self.singlecomparecomment.layer.borderWidth = 1
        //self.singlesubmitpostbuttonoutlet.alpha = 1
        //self.singlesubmitpostbuttonoutlet.enabled = true
        
        self.singlesubmitpostbuttonoutlet.alpha = 1
        self.singlecomparecomment.textColor = UIColor.blackColor()
        self.what3.hidden = false
    }
    
    
    
    @IBAction func singlefirstdetectButton(sender: AnyObject) {
        
        if cleanrevert.text == "nofilter" {
        
        var ciImage  = CIImage(CGImage:singlefirstimagepostview.image!.CGImage)
        var ciDetector = CIDetector(ofType:CIDetectorTypeFace
            ,context:nil
            ,options:[
                CIDetectorAccuracy:CIDetectorAccuracyHigh,
                CIDetectorSmile:true
            ]
        )
        var features = ciDetector.featuresInImage(ciImage)
        
        UIGraphicsBeginImageContext(singlefirstimagepostview.image!.size)
        singlefirstimagepostview.image!.drawInRect(CGRectMake(0,0,singlefirstimagepostview.image!.size.width,singlefirstimagepostview.image!.size.height))
        
        for feature in features{
            
         
            var drawCtxt = UIGraphicsGetCurrentContext()
            
            // Face
            var faceRect = (feature as! CIFaceFeature).bounds
            faceRect.origin.y = singlefirstimagepostview.image!.size.height - faceRect.origin.y - faceRect.size.height
            
            // Mouth
            if((feature.hasMouthPosition) != nil){
                var mouseRectY = singlefirstimagepostview.image!.size.height - feature.mouthPosition.y
                var mouseRect  = CGRectMake(feature.mouthPosition.x - 5,mouseRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt,UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,mouseRect)
            }
            
            // Mustache
            var higeImg      = UIImage(named:"hige_100.png")
            var mouseRectY = singlefirstimagepostview.image!.size.height - feature.mouthPosition.y
            var higeWidth  = faceRect.size.width * 4/5
            var higeHeight = higeWidth * 0.3 // 元画像が100:30なのでWidthの30%が縦幅
            var higeRect  = CGRectMake(feature.mouthPosition.x - higeWidth/2,mouseRectY - higeHeight/2,higeWidth,higeHeight)
            CGContextDrawImage(drawCtxt,higeRect,higeImg!.CGImage)
            
            // Left Eye
            if((feature.hasLeftEyePosition) != nil){
                var leftEyeRectY = singlefirstimagepostview.image!.size.height - feature.leftEyePosition.y
                var leftEyeRect  = CGRectMake(feature.leftEyePosition.x - 5,leftEyeRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,leftEyeRect)
            }
            
            // Right Eye
            if((feature.hasRightEyePosition) != nil){
                var rightEyeRectY = singlefirstimagepostview.image!.size.height - feature.rightEyePosition.y
                var rightEyeRect  = CGRectMake(feature.rightEyePosition.x - 5,rightEyeRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,rightEyeRect)
            }
        }
        var drawedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        singlefirstimagepostview.image = drawedImage
            
            self.cleanrevert.text = "yesfilter"
            
        } else {
            
            self.singlefirstimagepostview.image = revertimageview.image
            
            self.cleanrevert.text = "nofilter"
            
            
        }
    }
    
    
    @IBAction func singlefirstblurbutton(sender: AnyObject) {
        
        
        if cleanrevert.text == "nofilter" {
        
        var ciImage  = CIImage(CGImage:singlefirstimagepostview.image!.CGImage)
        var ciDetector = CIDetector(ofType:CIDetectorTypeFace
            ,context:nil
            ,options:[
                CIDetectorAccuracy:CIDetectorAccuracyHigh,
                CIDetectorSmile:true
            ]
        )
        var features = ciDetector.featuresInImage(ciImage)
        
        UIGraphicsBeginImageContext(singlefirstimagepostview.image!.size)
        singlefirstimagepostview.image!.drawInRect(CGRectMake(0,0,singlefirstimagepostview.image!.size.width,singlefirstimagepostview.image!.size.height))
        
        for feature in features{
            
            var drawCtxt = UIGraphicsGetCurrentContext()
            
            // Face
            var faceRect = (feature as! CIFaceFeature).bounds
            faceRect.origin.y = singlefirstimagepostview.image!.size.height - faceRect.origin.y - faceRect.size.height

            
            // Mouth
            if((feature.hasMouthPosition) != nil){
                var mouseRectY = singlefirstimagepostview.image!.size.height - feature.mouthPosition.y
                var mouseRect  = CGRectMake(feature.mouthPosition.x - 5,mouseRectY - 5,10,10)

            }
            
            // Dog Face
            var hige1Img      = UIImage(named:"dogfilter.png")
            var mouseRectY = singlefirstimagepostview.image!.size.height - feature.mouthPosition.y
            var hige1Width  = faceRect.size.width //* 4/5
            var hige1Height = hige1Width
            var hige1Rect  = CGRectMake(feature.mouthPosition.x - hige1Width/1.6,mouseRectY - hige1Width/1,hige1Width*1.3,hige1Height*1.3)
            CGContextDrawImage(drawCtxt,hige1Rect,hige1Img!.CGImage)
            
            // Left Eye
            if((feature.hasLeftEyePosition) != nil){
                var leftEyeRectY = singlefirstimagepostview.image!.size.height - feature.leftEyePosition.y
                var leftEyeRect  = CGRectMake(feature.leftEyePosition.x - 5,leftEyeRectY - 5,10,10)

            }
            
            //rightEye
            if((feature.hasRightEyePosition) != nil){
                var rightEyeRectY = singlefirstimagepostview.image!.size.height - feature.rightEyePosition.y
                var rightEyeRect  = CGRectMake(feature.rightEyePosition.x - 5,rightEyeRectY - 5,10,10)

            }
        }
        var drawedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        singlefirstimagepostview.image = drawedImage
            self.cleanrevert.text = "yesfilter"
            
        } else {
            
            self.singlefirstimagepostview.image = revertimageview.image
            
            self.cleanrevert.text = "nofilter"
            
            
        }
    }
    

    @IBOutlet weak var singlecomparecomment: UITextView!
    

    
    
    @IBAction func singlecomparepost(sender: AnyObject) {
        
        if singlecomparecomment.text != "" {
            
            self.what3.hidden = true

        
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame)
        activityIndicator.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        var post = PFObject(className: "Post")
            
        var typeo = ""
            
        if questiontype.selectedSegmentIndex == 0 {
            typeo = "#YesOrNo?"
            }
            
        if questiontype.selectedSegmentIndex == 1 {
                typeo = "#WhichOne?"
        }
            
        if questiontype.selectedSegmentIndex == 2 {
                typeo = self.questiontypelabel.text!
        }
        
        
        post["message"] = "\(typeo) \(singlecomparecomment.text)"
        
        //let location = currentLocation
        //post["location"] = location
        
        post["userId"] = PFUser.currentUser()!.objectId!
        
        let singlefirstcompareimageData = UIImageJPEGRepresentation(singlefirstimagepostview.image, 0.45)
        
        let singlefirstcompareimageFile = PFFile(name: "image3.jpeg", data: singlefirstcompareimageData)
        
        post["imageFile1"] = singlefirstcompareimageFile
        
        //let placeholderimageData = UIImagePNGRepresentation(placeholderimage.image)
        
        //let placeholderimageFile = PFFile(name: "placeholderimage.png", data: placeholderimageData)
        
        //post["imageFile2"] = placeholderimageFile
        
        //post["declaration"] = "single"
            
            if lastviewed1 == "" || lastviewed1 == "Peer Goggles" {
                post["postcategory"] = "Peer Goggles"
            } else {
                post["postcategory"] = lastviewed1
            }
        
        //post["testy"] = manager.location as CLLocation
        
        //GOOBERBOOBBUTT
        //GOOBERBOOBBUTT
      
            /*
        if currentLocation != nil {
        if let location = currentLocation {
            post["location"] = location
            println(location)
            post.saveInBackground()
            
            
            
        }
            }
            
            */
            
        
        
        //let location = locations[0] as! CLLocation
        /*
        if currentLocation != nil {
        post["location"] = currentLocation
        
        }*/
            
            
            //GOOBERBOOBBUTT
        //GOOBERBOOBBUTT
        
            if posttype.selectedSegmentIndex == 0 {
                post["alias"] = "Anonymous"
            
            } else {
                
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                
                let userinfo = appDelegate.userinfo
                post["alias"] = userinfo["alias"]
                
            }
        
        
            
        post.incrementKey("Vote1", byAmount: 0)
        
        post.incrementKey("Vote2", byAmount: 0)
        
        //post.incrementKey("totalvotes", byAmount: 0)
        
        //post.incrementKey("Reportcount", byAmount: 0)
        
        //post.incrementKey("inappropriatePost", byAmount: 0)
        
        //post.incrementKey("lamePost", byAmount: 0)
        
        //if switchOutlet.on {
            
        //if typelabel.text == "yesno" {
        //   post["whichbutton"] = "yesno"
        //}
        //else
        //{
            //post["whichbutton"] = "onetwo"
        //}
        if questiontype.selectedSegmentIndex == 0 {
            post["questionType"] = "#YesOrNo?"
        }
            
        if questiontype.selectedSegmentIndex == 1 {
            post["questionType"] = "#WhichOne?"
        }
            
        if questiontype.selectedSegmentIndex == 2 {
                post["questionType"] = questiontypelabel.text
        }
        
        post.saveInBackgroundWithBlock{(success, error) -> Void in
            
            self.activityIndicator.stopAnimating()
            
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
            
            if error == nil {
                
                self.displayAlert("Image Posted!", message: "Your image has been posted successfully")
                
                //self.firstimagepostview.image = UIImage(named: "315px-Blank_woman_placeholder.svg.png")
                
                //self.comparecomment.text = ""
                
            } else {
                
                self.displayAlert("Could not post image", message: "Please try again later")
                
                
            }
            
        }
        
        //currentuser.incrementKey("PostNumber")
        //currentuser.saveInBackground()
            
            
        } else {
            self.displayAlert3("Hold Up", message: "You forgot to enter a caption!")
        }

        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "choosepostcategory"){
            //let indexPath = self.tableView.indexPathForSelectedRow()
            
            
            
            let nav = segue.destinationViewController as! UINavigationController

            let destinationViewController = nav.topViewController as! PackTableViewController
            destinationViewController.fromwhere = "frompost"
            destinationViewController.firstViewController = self

            
            
        }
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        //self.changecategory.setTitle("Posting in: \(lastviewed1)", forState: .Normal)
        
        if lastviewed1 == "" || lastviewed1 == "Peer Goggles" {
            self.changecategory.setTitle("Posting in: Main Page", forState: .Normal)
        } else {
            self.changecategory.setTitle("Posting in: \(lastviewed1)", forState: .Normal)
        }
        
    }
    
}
