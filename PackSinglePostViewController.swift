//
//  PackSingePostViewController.swift
//  Finder
//
//  Created by Ivan Khau on 7/16/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit
import CoreImage

class PackSinglePostViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate, UITextFieldDelegate {
    
    func displayAlert3(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet weak var revertimageview: UIImageView!
    
    @IBOutlet weak var newdogfilteroutlet: UIButton!
    
    @IBAction func newdogfilteraction(sender: AnyObject) {
        
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
                var hige1Width  = faceRect.size.width //* 4/5
                var hige1Height = hige1Width //* 0.3 // 元画像が100:30なのでWidthの30%が縦幅
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
    
    @IBOutlet weak var what1: UIImageView!
    
    @IBOutlet weak var what2: UIImageView!
    
    @IBOutlet weak var what3: UIImageView!
    
    @IBOutlet weak var backgroundlabel1: UILabel!
    
    @IBOutlet weak var backgroundlabel2: UILabel!
    
    
    
    @IBOutlet weak var cleanrevert: UILabel!

    @IBOutlet weak var thisthat: UIButton!
    
    @IBAction func thisthataction(sender: AnyObject) {
        
        self.thisthat.alpha = 1
        self.yesno.alpha = 0.4
        self.typelabel.text = "onetwo"
        
    }
    
    @IBOutlet weak var yesno: UIButton!
    
    @IBAction func yesnoaction(sender: AnyObject) {
        
        self.typelabel.text = "yesno"
        self.thisthat.alpha = 0.4
        self.yesno.alpha = 1
    }
    
    @IBOutlet weak var questiontype: UILabel!
    
    
    @IBOutlet weak var typelabel: UILabel!
    
    
    @IBOutlet weak var infobutton: UIButton!
    
    
    @IBOutlet weak var posttomainpage: UILabel!
    
    
    
    
    private var currentLocation: PFGeoPoint?
    var manager:CLLocationManager = CLLocationManager()
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if locations.count > 0 {
            self.manager.stopUpdatingLocation()
            let location = locations[0] as! CLLocation
            currentLocation = PFGeoPoint(location: location)
        }
    }

    
    
    //@IBOutlet weak var mainpageoutlet: UILabel!
    
    var lastviewed1 = ""

    
    @IBOutlet weak var mainpageswitch: UISwitch!
    @IBAction func mainpageaction(sender: AnyObject) {
        if mainpageswitch.on {
            //mainpageoutlet.alpha = 1
            
        }
        else
        {
            //mainpageoutlet.alpha = 0.5
        }
    }
    
    @IBAction func packsinglecancelbutton(sender: AnyObject) {
        
        self.performSegueWithIdentifier("thepacksinglebacksegue", sender: self)
        
        
    }
    
    
    
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
            
            //self.dismissViewControllerAnimated(true, completion: nil)
        self.performSegueWithIdentifier("thepacksinglebacksegue", sender: self)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "thepacksinglebacksegue"){
            
            let navVC = segue.destinationViewController as! UINavigationController
            let detailVC = navVC.topViewController as! PackFeedViewController
            detailVC.lastviewed = lastviewed1
            
            
            
            
        }
    }

    
    
    @IBOutlet weak var singlefirstimagepostview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundlabel1.alpha = 0.15
        backgroundlabel2.alpha = 0.15
        posttomainpage.alpha = 0.15
        //mainpageswitch.alpha = 0.15
        mainpageswitch.on = false
        mainpageswitch.enabled = false
        
        mainpageswitch.tintColor = UIColor.redColor()
        mainpageswitch.backgroundColor = UIColor.redColor()
        mainpageswitch.layer.cornerRadius = 18.0
        
        if self.lastviewed1 == "His Eyes Only" {
            //mainpageoutlet.hidden = true
            //mainpageswitch.hidden = true
            posttomainpage.hidden = true
            mainpageswitch.hidden = true
            mainpageswitch.enabled = false
            backgroundlabel2.hidden = true
            
        }
        
        if self.lastviewed1 == "Her Eyes Only" {
            //mainpageoutlet.hidden = true
            //mainpageswitch.hidden = true
            posttomainpage.hidden = true
            mainpageswitch.hidden = true
            mainpageswitch.enabled = false
            backgroundlabel2.hidden = true

        }
        
        typelabel.text = "yesno"
        
        cleanrevert.text = "nofilter"
        
        newdogfilteroutlet.alpha = 0.15
        singlefirstblurbuttonoutlet.alpha = 0.15
        singlefirstdetectbuttonoutlet.alpha = 0.15
        questiontype.alpha = 0.15
        thisthat.alpha = 0.15
        yesno.alpha = 0.15
        singlecomparecomment.alpha = 0.15
        singlesubmitpostbuttonoutlet.alpha = 0.15
        infobutton.alpha = 0.15
        
        what2.hidden = true
        what3.hidden = true
        
        self.singlefirstimagepostview.layer.borderWidth = 8
        self.singlefirstimagepostview.layer.borderColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0).CGColor
        
        singlepostcancelbuttonoutlet.layer.cornerRadius = 5
        singlesubmitpostbuttonoutlet.layer.cornerRadius = 5
        
        singlefirstdetectbuttonoutlet.enabled = false
        singlefirstblurbuttonoutlet.enabled = false
        singlesubmitpostbuttonoutlet.enabled = false
        singlecomparecomment.enabled = false
        thisthat.enabled = false
        yesno.enabled = false
        infobutton.enabled = false
        newdogfilteroutlet.enabled = false
        
        

        
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        if iOS8 {
            manager.requestWhenInUseAuthorization()
        }
        
        manager.startUpdatingLocation()


        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        

        self.singlecomparecomment.delegate = self
        
        var quero = PFQuery(className: "Post")
        
        quero.whereKey("userId", equalTo: currentuser.objectId)
        quero.whereKey("Reportcount", greaterThan: 5)
        if quero.findObjects().count > 6 {
            //flagwarn2.hidden = false
            //addphotooutlet.enabled = false
            //submitpostbuttonoutlet.enabled = false
            currentuser.incrementKey("reviewneeded")
            currentuser.saveInBackground()
            //self.performSegueWithIdentifier("doubletotab", sender: self)
            self.displayAlert("Your Account is Under Review", message: "Please try again Later.")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        self.singlecomparecomment.delegate = self
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 150
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 150
    }
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
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
            self.singlecomparecomment.enabled = true
            self.thisthat.enabled = true
            self.yesno.enabled = true
            self.infobutton.enabled = true
            
            self.newdogfilteroutlet.enabled = true
            
            self.singlefirstdetectbuttonoutlet.alpha = 1
            self.singlefirstblurbuttonoutlet.alpha = 1
            self.singlecomparecomment.alpha = 1
            self.newdogfilteroutlet.alpha = 1
            self.questiontype.alpha = 1
            self.thisthat.alpha = 0.4
            self.yesno.alpha = 1
            self.infobutton.alpha = 1
            
            self.what1.hidden = true
            self.what2.hidden = false
            
            self.revertimageview.image = image
            
            
            self.addphotooutlet.backgroundColor = UIColor.clearColor()
            
            self.addphotooutlet.setTitle("", forState: UIControlState.Normal)
            self.singlefirstimagepostview.layer.borderWidth = 3
            self.singlefirstimagepostview.layer.borderColor = UIColor.blackColor().CGColor
            
            self.singlecomparecomment.layer.borderWidth = 1
            self.singlecomparecomment.layer.borderColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0).CGColor
            
            self.singlecomparecomment.attributedPlaceholder = NSAttributedString(string:"Enter a Question",
                attributes:[NSForegroundColorAttributeName: UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)])
            
            self.backgroundlabel1.alpha = 1
            
            
            if self.lastviewed1 != "His Eyes Only" && self.lastviewed1 != "Her Eyes Only" {
                
                self.posttomainpage.alpha = 1
                self.backgroundlabel2.alpha = 1
                self.mainpageswitch.alpha = 1
                self.mainpageswitch.enabled = true
            }
            
        }
        
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
                var hige1Height = hige1Width //* 0.3 // 元画像が100:30なのでWidthの30%が縦幅
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
    
    @IBOutlet weak var singlecomparecomment: UITextField!
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.singlesubmitpostbuttonoutlet.backgroundColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)
        self.singlesubmitpostbuttonoutlet.alpha = 1
        self.singlesubmitpostbuttonoutlet.enabled = true
        
        self.singlecomparecomment.layer.borderColor = UIColor.blackColor().CGColor
        
        
        self.singlecomparecomment.layer.borderWidth = 1
        
        
        
        self.what3.hidden = false

        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.what2.hidden = true
        self.singlecomparecomment.layer.borderWidth = 2
    }
    
    
    @IBAction func singlecomparepost(sender: AnyObject) {
        
        if singlecomparecomment.text != "" {
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame)
        activityIndicator.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        var post = PFObject(className: "Post")
        
        post["message"] = singlecomparecomment.text
        
        post["userId"] = PFUser.currentUser()!.objectId!
        
        //let location = currentLocation
        
        if currentLocation != nil {
        post["location"] = currentLocation

        }
        
        
        
        
        //PFUser.currentUser().refreshInBackgroundWithBlock { (object, error) -> Void in
            
          //  object.objectForKey("lastviewed")
            
        //post["postcategory"] = PFUser.currentUser()!["lasviewed"]!
        //}
        
        
        //PFUser.currentUser().fetchInBackgroundWithTarget("lasviewed", selector: Selector())
        //let lasviewed = PFUser.currentUser()!["lasviewed"] as? String
        post["postcategory"] = lastviewed1
        
        
        
        
        //post["category"] = lastviewed
        //}
        
        let singlefirstcompareimageData = UIImageJPEGRepresentation(singlefirstimagepostview.image, 0.45)
        
        let singlefirstcompareimageFile = PFFile(name: "image3.jpeg", data: singlefirstcompareimageData)
        
        post["imageFile1"] = singlefirstcompareimageFile
        
        let placeholderimageData = UIImagePNGRepresentation(placeholderimage.image)
        
        let placeholderimageFile = PFFile(name: "placeholderimage.png", data: placeholderimageData)
        
        post["imageFile2"] = placeholderimageFile
        
        post["declaration"] = "single"
        
        post.incrementKey("Vote1", byAmount: 0)
        
        post.incrementKey("Vote2", byAmount: 0)
        
        //post.incrementKey("totalvotes", byAmount: 0)
        
        post.incrementKey("Reportcount", byAmount: 0)
        
        post.incrementKey("inappropriatePost", byAmount: 0)
        
        post.incrementKey("lamePost", byAmount: 0)
        
        
        if typelabel.text == "yesno" {
            post["whichbutton"] = "yesno"
        }
        else
        {
            post["whichbutton"] = "onetwo"
        }
        
        
        
        if mainpageswitch.on {
            post["posttomain"] = "yes"
        }
        else
        {
            post["posttomain"] = "no"
        }
        
        
        /*
        var query = PFQuery(className: "Categories")
        query.whereKey("catname", equalTo: PFUser.currentUser()["lasviewed"])
        //var messages = query.findObjects()
        query.findObjects()
        query.getFirstObject().incrementKey("catpostcount")
        query.getFirstObject().saveInBackground()*/
        
        var query1 = PFQuery(className: "Categories")
        query1.whereKey("catname", equalTo: lastviewed1)
        query1.findObjectsInBackgroundWithBlock { (catnames, error) -> Void in
            if error == nil {
                for catname in catnames {
                    
                    catname.incrementKey("postcount")
                    catname.saveInBackground()
                    //let currentcount = catname["viewcount"] as! Int
                    //catname.setValue(currentcount+1, forKey: "viewcount")
                    //catname.saveInBackground()
                    //if error == nil {
                     //   self.performSegueWithIdentifier("packtofeedsegue", sender: self)
                    }
                    
                }
            }
        
        //println(query.getFirstObject())
        
        
        //let obj = query.getFirstObject() as! PFObject


        
        
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
        
        currentuser.incrementKey("PostNumber")
        currentuser.saveInBackground()
        } else {
            self.displayAlert3("Hold Up", message: "You forgot to enter a caption!")
        }
        
        
    }
}