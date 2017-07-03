//
//  CreatePostViewController.swift
//  Finder
//
//  Created by Ivan Khau on 6/30/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit
import CoreImage

class CompareImagePostViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate, UITextViewDelegate {
    
    var lastviewed1 = ""
    
    private var currentLocation: PFGeoPoint?
    var manager:CLLocationManager = CLLocationManager()
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if locations.count > 0 {
            self.manager.stopUpdatingLocation()
            let location = locations[0] as! CLLocation
            currentLocation = PFGeoPoint(location: location)
        }
    }
    
    
    @IBAction func closeaction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    
    @IBOutlet weak var closebutton: UIButton!
    
    @IBOutlet weak var cleanrevert: UILabel!
    
    
    @IBOutlet weak var cleanrevert2: UILabel!
    
    
    
    
    //@IBOutlet weak var concealsquare1: UILabel!
    
    
    @IBOutlet weak var revertimage1: UIButton!
    
    @IBOutlet weak var revertimage2: UIButton!
    
    
    
    
    //@IBOutlet weak var filterback1: UILabel!
    
    
    @IBOutlet weak var backupimage1: UIImageView!
    
    
    @IBOutlet weak var backupimage2: UIImageView!
    
    
    
    @IBOutlet weak var what1: UIImageView!
    
    @IBOutlet weak var what2: UIImageView!
    
    @IBOutlet weak var what3: UIImageView!
    
    @IBOutlet weak var whatarrow: UIImageView!
    
    
    //@IBOutlet weak var concealface1: UILabel!
    
    //@IBOutlet weak var concealface2: UILabel!
    

    
    //@IBOutlet weak var firstaddphotolabel: UILabel!
    
    //@IBOutlet weak var secondaddphotolabel: UILabel!
    
    
    
    
    
    
    @IBOutlet weak var firstdetectbuttonoutlet: UIButton!
    
    @IBOutlet weak var firstblurbuttonoutlet: UIButton!
    
    @IBOutlet weak var seconddetectbuttonoutlet: UIButton!
    
    
    @IBOutlet weak var secondblurbuttonoutlet: UIButton!
    
    @IBOutlet weak var secondpostbuttonoutlet: UIButton!
    
    
    @IBOutlet weak var submitpostbuttonoutlet: UIButton!
    
    
    @IBOutlet weak var comparecancelbuttonoutlet: UIButton!
    
    @IBOutlet weak var firstimagepostbutton: UIButton!
    
    //@IBOutlet weak var flagwarn: UILabel!
    
    var activityIndicator = UIActivityIndicatorView()
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    
    

    
    @IBOutlet weak var firstimagepostview: UIImageView!
    
    
    
    
    
    
    
    //@IBOutlet weak var battleimagepostView: UIImageView!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cleanrevert.text = "nofilter"
        
        cleanrevert2.text = "nofilter"
        closebutton.layer.cornerRadius = 5
        
        firstimagepostview.layer.borderWidth = 8
        firstimagepostview.layer.borderColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0).CGColor
        
        secondimagepostview.layer.borderWidth = 2
        secondimagepostview.layer.borderColor = UIColor.blackColor().CGColor
        
        comparecomment.layer.borderWidth = 1.0
        comparecomment.layer.borderColor = UIColor.blackColor().CGColor
        comparecomment.layer.cornerRadius = 8
        comparecomment.alpha = 0.15
        
        
        comparecancelbuttonoutlet.alpha = 0.7
        
        //concealface1.layer.borderWidth = 1
        
        //concealface1.layer.borderColor = UIColor.blackColor().CGColor
        
        //filterback1.layer.borderWidth = 1
        
        //filterback1.layer.borderColor = UIColor.blackColor().CGColor
        
        secondpostbuttonoutlet.hidden = true
        
        comparecomment.editable = false
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        if iOS8 {
            manager.requestWhenInUseAuthorization()
        }
        
        manager.startUpdatingLocation()
        
        what2.hidden = true
        what3.hidden = true
        whatarrow.hidden = true
        
        //concealface1.alpha = 0.2
        //concealface2.alpha = 0.2
        secondimagepostview.alpha = 0.15

        
        
        //flagwarn.hidden = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        var quero = PFQuery(className: "Post")
        
        quero.whereKey("userId", equalTo: currentuser.objectId)
        quero.whereKey("Reportcount", greaterThan: 6)
        if quero.findObjects().count > 6 {
            //flagwarn.hidden = false
            //firstimagepostbutton.enabled = false
            //submitpostbuttonoutlet.enabled = false
            
            currentuser.incrementKey("reviewneeded")
            currentuser.saveInBackground()
            
            self.displayAlert("Your Account is Under Review", message: "Please try again Later.")


            //self.performSegueWithIdentifier("doubletotab", sender: self)
        }
        
        //firstaddphotolabel.layer.cornerRadius = 10
        
        //comparecancelbuttonoutlet.layer.cornerRadius = 8
        
        //seconddetectbuttonoutlet.hidden = true
        //secondblurbuttonoutlet.hidden = true
        
        
    
        submitpostbuttonoutlet.layer.cornerRadius = 10
        
        //gooberboobbutt
        //gooberboobbutt
        //gooberboobbutt
        
        //submitpostbuttonoutlet.layer.borderWidth = 5
        //submitpostbuttonoutlet.layer.borderColor = UIColor.blueColor().CGColor
        
        //gooberboobbutt
        //gooberboobbutt
        //gooberboobbutt
        
        
       
        
        
        firstdetectbuttonoutlet.enabled = false
        firstblurbuttonoutlet.enabled = false
        firstdetectbuttonoutlet.alpha = 0.15
        firstblurbuttonoutlet.alpha = 0.15

        
        
        //firstdetectbuttonoutlet.hidden = true
        //firstblurbuttonoutlet.hidden = true
        
        
        revertimage1.enabled = false
        revertimage1.alpha = 0.15
        //revertimage1.hidden = true
        
        revertimage2.enabled = false
        revertimage2.alpha = 0.15
        //revertimage2.hidden = true
        
        
        seconddetectbuttonoutlet.enabled = false
        secondblurbuttonoutlet.enabled = false
        secondpostbuttonoutlet.enabled = false
        submitpostbuttonoutlet.enabled = false
        
        seconddetectbuttonoutlet.alpha = 0.15
        secondblurbuttonoutlet.alpha = 0.15
        
        firstdetectbuttonoutlet.alpha = 0.15
        firstdetectbuttonoutlet.alpha = 0.15
        
        //secondaddphotolabel.alpha = 0.5
        //secondpostbuttonoutlet.alpha = 0.5
        submitpostbuttonoutlet.alpha = 0.15
        
        
        //comparecomment.enabled = false
        self.comparecomment.delegate = self

        // Do any additional setup after loading the view, typically from a nib.
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        //self.comparecomment.delegate = self
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 190
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 190
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
    
    
    @IBAction func firstActionTakePicture(sender: AnyObject) {
    
    //@IBAction func buttonActionTakePicture(sender: AnyObject) {
        
        // fetch image from image picker
        ImagePickerManager.sharedManager.presentImagePicker(self) { (image, source) -> () in
            
            //self.firstdetectbuttonoutlet.hidden = false
            //self.firstblurbuttonoutlet.hidden = false
            //self.filterback1.hidden = false
            
            self.revertimage1.enabled = true
            self.revertimage1.alpha = 1
            //self.revertimage1.hidden = false
            
            self.firstimagepostview.image = image
            self.backupimage1.image = image
            self.firstdetectbuttonoutlet.enabled = true
            self.firstblurbuttonoutlet.enabled = true
            self.secondpostbuttonoutlet.enabled = true
            //self.secondpostbuttonoutlet.alpha = 1
            //self.secondaddphotolabel.alpha = 1
            //self.concealface1.alpha = 1
            self.secondimagepostview.alpha = 1
            
            self.firstdetectbuttonoutlet.alpha = 1
            self.firstblurbuttonoutlet.alpha = 1
            
            
            self.what1.hidden = true
            self.what2.hidden = false
            
            //self.firstimagepostbutton.hidden = true
            self.firstimagepostbutton.backgroundColor = UIColor.clearColor()
            //self.firstimagepostbutton.alpha = 0.1
            self.firstimagepostbutton.setTitle("", forState: UIControlState.Normal)
            
            
            //self.firstimagepostbutton.hidden = true
            
            //self.firstimagepostbutton.opaque = 0
            
            
            self.secondpostbuttonoutlet.hidden = false
            
            self.firstimagepostview.layer.borderColor = UIColor.blackColor().CGColor
            
            self.secondimagepostview.layer.borderColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0).CGColor
            
            
            self.firstimagepostview.layer.borderWidth = 2
            
            self.secondimagepostview.layer.borderWidth = 8
            
            
            
            //self.firstimagepostview.layer.borderWidth=1.0
            //self.firstimagepostview.layer.borderColor = UIColor.blackColor().CGColor

        }
        
    }
    
    @IBAction func revertimage1(sender: AnyObject) {
        
        if cleanrevert.text == "nofilter" {
            
            //@IBAction func blurbutton(sender: AnyObject) {
            var ciImage  = CIImage(CGImage:firstimagepostview.image!.CGImage)
            var ciDetector = CIDetector(ofType:CIDetectorTypeFace
                ,context:nil
                ,options:[
                    CIDetectorAccuracy:CIDetectorAccuracyHigh,
                    CIDetectorSmile:true
                ]
            )
            var features = ciDetector.featuresInImage(ciImage)
            
            UIGraphicsBeginImageContext(firstimagepostview.image!.size)
            firstimagepostview.image!.drawInRect(CGRectMake(0,0,firstimagepostview.image!.size.width,firstimagepostview.image!.size.height))
            
            for feature in features{
                
                //context
                var drawCtxt = UIGraphicsGetCurrentContext()
                
                //face
                var faceRect = (feature as! CIFaceFeature).bounds
                faceRect.origin.y = firstimagepostview.image!.size.height - faceRect.origin.y - faceRect.size.height
                //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.redColor().CGColor)
                //CGContextStrokeRect(drawCtxt,faceRect)
                
                //mouse
                if((feature.hasMouthPosition) != nil){
                    var mouseRectY = firstimagepostview.image!.size.height - feature.mouthPosition.y
                    var mouseRect  = CGRectMake(feature.mouthPosition.x - 5,mouseRectY - 5,10,10)
                    //CGContextSetStrokeColorWithColor(drawCtxt,UIColor.blueColor().CGColor)
                    //CGContextStrokeRect(drawCtxt,mouseRect)
                }
                
                //hige
                var hige1Img      = UIImage(named:"dogfilter2.png")
                var mouseRectY = firstimagepostview.image!.size.height - feature.mouthPosition.y
                //ヒゲの横幅は顔の4/5程度
                var hige1Width  = faceRect.size.width //* 4/5
                var hige1Height = hige1Width //* 0.3 // 元画像が100:30なのでWidthの30%が縦幅
                var hige1Rect  = CGRectMake(feature.mouthPosition.x - hige1Width/1.6,mouseRectY - hige1Width/1,hige1Width*1.3,hige1Height*1.3)
                CGContextDrawImage(drawCtxt,hige1Rect,hige1Img!.CGImage)
                
                //leftEye
                if((feature.hasLeftEyePosition) != nil){
                    var leftEyeRectY = firstimagepostview.image!.size.height - feature.leftEyePosition.y
                    var leftEyeRect  = CGRectMake(feature.leftEyePosition.x - 5,leftEyeRectY - 5,10,10)
                    //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                    //CGContextStrokeRect(drawCtxt,leftEyeRect)
                }
                
                //rightEye
                if((feature.hasRightEyePosition) != nil){
                    var rightEyeRectY = firstimagepostview.image!.size.height - feature.rightEyePosition.y
                    var rightEyeRect  = CGRectMake(feature.rightEyePosition.x - 5,rightEyeRectY - 5,10,10)
                    //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                    //CGContextStrokeRect(drawCtxt,rightEyeRect)
                }
            }
            var drawedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            firstimagepostview.image = drawedImage
            
            self.cleanrevert.text = "yesfilter"
            
        } else {
            
            self.firstimagepostview.image = backupimage1.image
            
            self.cleanrevert.text = "nofilter"
            
            
        }
    
        
    }
    
    
    func displayAlert3(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    
    @IBAction func firstdetectButton(sender: AnyObject) {
    
    
        if cleanrevert.text == "nofilter" {
        
        var ciImage  = CIImage(CGImage:firstimagepostview.image!.CGImage)
        var ciDetector = CIDetector(ofType:CIDetectorTypeFace
            ,context:nil
            ,options:[
                CIDetectorAccuracy:CIDetectorAccuracyHigh,
                CIDetectorSmile:true
            ]
        )
        var features = ciDetector.featuresInImage(ciImage)
        
        UIGraphicsBeginImageContext(firstimagepostview.image!.size)
        firstimagepostview.image!.drawInRect(CGRectMake(0,0,firstimagepostview.image!.size.width,firstimagepostview.image!.size.height))
        
        for feature in features{
            
            //context
            var drawCtxt = UIGraphicsGetCurrentContext()
            
            //face
            var faceRect = (feature as! CIFaceFeature).bounds
            faceRect.origin.y = firstimagepostview.image!.size.height - faceRect.origin.y - faceRect.size.height
            //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.redColor().CGColor)
            //CGContextStrokeRect(drawCtxt,faceRect)
            
            //mouse
            if((feature.hasMouthPosition) != nil){
                var mouseRectY = firstimagepostview.image!.size.height - feature.mouthPosition.y
                var mouseRect  = CGRectMake(feature.mouthPosition.x - 5,mouseRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt,UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,mouseRect)
            }
            
            //hige
            var higeImg      = UIImage(named:"hige_100.png")
            var mouseRectY = firstimagepostview.image!.size.height - feature.mouthPosition.y
            //ヒゲの横幅は顔の4/5程度
            var higeWidth  = faceRect.size.width * 4/5
            var higeHeight = higeWidth * 0.3 // 元画像が100:30なのでWidthの30%が縦幅
            var higeRect  = CGRectMake(feature.mouthPosition.x - higeWidth/2,mouseRectY - higeHeight/2,higeWidth,higeHeight)
            CGContextDrawImage(drawCtxt,higeRect,higeImg!.CGImage)
            
            //leftEye
            if((feature.hasLeftEyePosition) != nil){
                var leftEyeRectY = firstimagepostview.image!.size.height - feature.leftEyePosition.y
                var leftEyeRect  = CGRectMake(feature.leftEyePosition.x - 5,leftEyeRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,leftEyeRect)
            }
            
            //rightEye
            if((feature.hasRightEyePosition) != nil){
                var rightEyeRectY = firstimagepostview.image!.size.height - feature.rightEyePosition.y
                var rightEyeRect  = CGRectMake(feature.rightEyePosition.x - 5,rightEyeRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,rightEyeRect)
            }
        }
        var drawedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        firstimagepostview.image = drawedImage
            
            self.cleanrevert.text = "yesfilter"
            
        } else {
            
            self.firstimagepostview.image = backupimage1.image
            
            self.cleanrevert.text = "nofilter"
            
            
        }
    }
    
    
    @IBAction func firstblurbutton(sender: AnyObject) {
        
        if cleanrevert.text == "nofilter" {
    
    //@IBAction func blurbutton(sender: AnyObject) {
        var ciImage  = CIImage(CGImage:firstimagepostview.image!.CGImage)
        var ciDetector = CIDetector(ofType:CIDetectorTypeFace
            ,context:nil
            ,options:[
                CIDetectorAccuracy:CIDetectorAccuracyHigh,
                CIDetectorSmile:true
            ]
        )
        var features = ciDetector.featuresInImage(ciImage)
        
        UIGraphicsBeginImageContext(firstimagepostview.image!.size)
        firstimagepostview.image!.drawInRect(CGRectMake(0,0,firstimagepostview.image!.size.width,firstimagepostview.image!.size.height))
        
        for feature in features{
            
            //context
            var drawCtxt = UIGraphicsGetCurrentContext()
            
            //face
            var faceRect = (feature as! CIFaceFeature).bounds
            faceRect.origin.y = firstimagepostview.image!.size.height - faceRect.origin.y - faceRect.size.height
            //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.redColor().CGColor)
            //CGContextStrokeRect(drawCtxt,faceRect)
            
            //mouse
            if((feature.hasMouthPosition) != nil){
                var mouseRectY = firstimagepostview.image!.size.height - feature.mouthPosition.y
                var mouseRect  = CGRectMake(feature.mouthPosition.x - 5,mouseRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt,UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,mouseRect)
            }
            
            //hige
            var hige1Img      = UIImage(named:"dogfilter.png")
            var mouseRectY = firstimagepostview.image!.size.height - feature.mouthPosition.y
            //ヒゲの横幅は顔の4/5程度
            var hige1Width  = faceRect.size.width //* 4/5
            var hige1Height = hige1Width //* 0.3 // 元画像が100:30なのでWidthの30%が縦幅
            var hige1Rect  = CGRectMake(feature.mouthPosition.x - hige1Width/1.6,mouseRectY - hige1Width/1,hige1Width*1.3,hige1Height*1.3)
            CGContextDrawImage(drawCtxt,hige1Rect,hige1Img!.CGImage)
            
            //leftEye
            if((feature.hasLeftEyePosition) != nil){
                var leftEyeRectY = firstimagepostview.image!.size.height - feature.leftEyePosition.y
                var leftEyeRect  = CGRectMake(feature.leftEyePosition.x - 5,leftEyeRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,leftEyeRect)
            }
            
            //rightEye
            if((feature.hasRightEyePosition) != nil){
                var rightEyeRectY = firstimagepostview.image!.size.height - feature.rightEyePosition.y
                var rightEyeRect  = CGRectMake(feature.rightEyePosition.x - 5,rightEyeRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,rightEyeRect)
            }
        }
        var drawedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        firstimagepostview.image = drawedImage
            
            self.cleanrevert.text = "yesfilter"
            
        } else {
            
            self.firstimagepostview.image = backupimage1.image
            
            self.cleanrevert.text = "nofilter"
            
            
        }
    }
    
    
    
    /*
    func reply() {
    yak?.addObject(commentView?.text, forKey: "comments")
    yak?.saveInBackground()
    if let tmpText = commentView?.text {
    comments?.append(tmpText)
    }
    commentView?.text = ""
    println(comments?.count)
    self.commentView?.resignFirstResponder()
    self.tableView.reloadData()
    */
    
    @IBOutlet weak var comparecomment: UITextView!
    //@IBOutlet weak var battlecomment: UITextField!
    
    func textViewDidEndEditing(textView: UITextView) {
    //submitpostbuttonoutlet.enabled = true
    //submitpostbuttonoutlet.alpha = 1
        
        self.whatarrow.hidden = false
        self.comparecomment.textColor = UIColor.lightGrayColor()
        self.comparecomment.layer.borderWidth = 1
        self.submitpostbuttonoutlet.enabled = true
        self.submitpostbuttonoutlet.alpha = 1
        
        self.comparecomment.layer.borderColor = UIColor.blackColor().CGColor
        self.submitpostbuttonoutlet.backgroundColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)
        //self.comparecomment.layer.borderWidth = 1
        
        //self.comparecomment.backgroundColor = UIColor.whiteColor()
        
        //self.comparecomment.layer.borderColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0).CGColor
        
        
    
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        //self.comparecomment.backgroundColor = UIColor.whiteColor()
        //self.what3.image = UIImage(named: "what-arrow.png")
        
        self.comparecomment.textAlignment = .Left
        self.comparecomment.textColor = UIColor.blackColor()
        self.comparecomment.text = ""
        self.comparecomment.layer.borderWidth = 2
        self.comparecomment.font = UIFont(name: "AvenirNext-Regular", size: 20)
        self.what3.hidden = true
        
        
    }
    
    
    
    
    @IBAction func comparepost(sender: AnyObject) {
    //@IBAction func battlepost(sender: AnyObject) {
        
        
        
        if comparecomment.text != "" {
            
            self.whatarrow.hidden = true
            
        //self.submitpostbuttonoutlet.backgroundColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)
        
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame)
        activityIndicator.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        
        
        var post = PFObject(className: "Post")
        
        post["message"] = comparecomment.text
        
        post["userId"] = PFUser.currentUser()!.objectId!
        
        if currentLocation != nil {
        post["location"] = currentLocation
        }
        
        let firstcompareimageData = UIImageJPEGRepresentation(firstimagepostview.image, 0.45)
        
        let firstcompareimageFile = PFFile(name: "image1.jpeg", data: firstcompareimageData)
        
        post["imageFile1"] = firstcompareimageFile
        
        post.incrementKey("Vote1", byAmount: 0)
        
        post.incrementKey("Vote2", byAmount: 0)
        
        //post.incrementKey("totalvotes", byAmount: 0)
        
        post.incrementKey("Reportcount", byAmount: 0)
        
        post.incrementKey("inappropriatePost", byAmount: 0)
        
        post.incrementKey("lamePost", byAmount: 0)
        
        post["whichbutton"] = "yesno"
        
            
            if lastviewed1 == "" || lastviewed1 == "Peer Goggles" {
                post["postcategory"] = "Peer Goggles"
            } else {
        post["postcategory"] = lastviewed1
            }

        
        let secondcompareimageData = UIImageJPEGRepresentation(secondimagepostview.image, 0.45)
        
        let secondcompareimageFile = PFFile(name: "image2.jpeg", data: secondcompareimageData)
        
        post["imageFile2"] = secondcompareimageFile
        
        post["declaration"] = "double"
        
        
        
        post.saveInBackgroundWithBlock{(success, error) -> Void in
            
            self.activityIndicator.stopAnimating()
            
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
            
            if error == nil {
                
                self.displayAlert("Images Posted!", message: "Your images have been posted successfully.")
                
                //self.firstimagepostview.image = UIImage(named: "315px-Blank_woman_placeholder.svg.png")
                
                //self.comparecomment.text = ""
                
            } else {
                
                self.displayAlert("Could not post images.", message: "Please try again later.")
            
                
            }
            
        }
        
        currentuser.incrementKey("PostNumber")
        currentuser.saveInBackground()
            
        } else {
            self.displayAlert3("Hold Up", message: "You forgot to enter a caption!")

        }

        
    }
    
    //SECOND PIC POST
    //SECOND PIC POST
    //SECOND PIC POST
    
    
    
    @IBOutlet weak var secondimagepostview: UIImageView!
    //@IBOutlet weak var firstimagepostview: UIImageView!
    //@IBOutlet weak var battleimagepostView: UIImageView!
    
    
    @IBAction func secondActionTakePicture(sender: AnyObject) {
    
    //@IBAction func firstActionTakePicture(sender: AnyObject) {
        
        //@IBAction func buttonActionTakePicture(sender: AnyObject) {
        
        // fetch image from image picker
        ImagePickerManager.sharedManager.presentImagePicker(self) { (image, source) -> () in
            
            //self.comparecomment.enabled = true
            self.secondimagepostview.image = image
            self.backupimage2.image = image
            
            //self.seconddetectbuttonoutlet.enabled = false
            //self.secondblurbuttonoutlet.enabled = false
            //self.seconddetectbuttonoutlet.hidden = false
            //self.secondblurbuttonoutlet.hidden = false
            
            //self.revertimage2.hidden = false
            self.revertimage2.enabled = true
            self.revertimage2.alpha = 1
            
            
            
            
            self.seconddetectbuttonoutlet.enabled = true
            self.secondblurbuttonoutlet.enabled = true
            
            self.seconddetectbuttonoutlet.alpha = 1
            self.secondblurbuttonoutlet.alpha = 1
            
            self.comparecomment.alpha = 1
            
            
            
            
            //self.concealface2.alpha = 1
            
            self.what2.hidden = true
            
            self.comparecomment.editable = true
            
            self.what3.hidden = false

            
            //if self.comparecomment.text == "" {
            //self.what3.hidden = false
            //} else {
            //    self.whatarrow.hidden = false
            //}
            
            //self.secondaddphotolabel.hidden = true
            //self.secondpostbuttonoutlet.alpha = 0
            
            //self.secondpostbuttonoutlet.alpha = 0.1
            self.secondpostbuttonoutlet.backgroundColor = UIColor.clearColor()
            self.secondpostbuttonoutlet.setTitle("", forState: UIControlState.Normal)
            
            self.secondimagepostview.layer.borderWidth=1.0
            self.secondimagepostview.layer.borderColor = UIColor.blackColor().CGColor
            
            //self.secondimagepostview.layer.borderColor = UIColor.blackColor().CGColor
            
            
            self.comparecomment.layer.borderColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0).CGColor
            
            
            self.secondimagepostview.layer.borderWidth = 2
            
            self.comparecomment.layer.borderWidth = 5.0
            
            //self.comparecomment.attributedPlaceholder = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)
            
            //var myTextField = UITextField(frame:CGRectMake(0, 0, 200, 30))
            self.comparecomment.backgroundColor = UIColor.whiteColor()
            

        }
        
    }
    
    
    @IBAction func revertimage2(sender: AnyObject) {
        
        if cleanrevert2.text == "nofilter" {
            var ciImage  = CIImage(CGImage:secondimagepostview.image!.CGImage)
            var ciDetector = CIDetector(ofType:CIDetectorTypeFace
                ,context:nil
                ,options:[
                    CIDetectorAccuracy:CIDetectorAccuracyHigh,
                    CIDetectorSmile:true
                ]
            )
            var features = ciDetector.featuresInImage(ciImage)
            
            UIGraphicsBeginImageContext(secondimagepostview.image!.size)
            secondimagepostview.image!.drawInRect(CGRectMake(0,0,secondimagepostview.image!.size.width,secondimagepostview.image!.size.height))
            
            for feature in features{
                
                //context
                var drawCtxt = UIGraphicsGetCurrentContext()
                
                //face
                var faceRect = (feature as! CIFaceFeature).bounds
                faceRect.origin.y = secondimagepostview.image!.size.height - faceRect.origin.y - faceRect.size.height
                //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.redColor().CGColor)
                //CGContextStrokeRect(drawCtxt,faceRect)
                
                //mouse
                if((feature.hasMouthPosition) != nil){
                    var mouseRectY = secondimagepostview.image!.size.height - feature.mouthPosition.y
                    var mouseRect  = CGRectMake(feature.mouthPosition.x - 5,mouseRectY - 5,10,10)
                    //CGContextSetStrokeColorWithColor(drawCtxt,UIColor.blueColor().CGColor)
                    //CGContextStrokeRect(drawCtxt,mouseRect)
                }
                
                //hige
                var hige1Img      = UIImage(named:"dogfilter2.png")
                var mouseRectY = secondimagepostview.image!.size.height - feature.mouthPosition.y
                //ヒゲの横幅は顔の4/5程度
                var hige1Width  = faceRect.size.width //* 4/5
                var hige1Height = hige1Width //* 0.3 // 元画像が100:30なのでWidthの30%が縦幅
                var hige1Rect  = CGRectMake(feature.mouthPosition.x - hige1Width/1.6,mouseRectY - hige1Width/1,hige1Width*1.3,hige1Height*1.3)
                CGContextDrawImage(drawCtxt,hige1Rect,hige1Img!.CGImage)
                
                //leftEye
                if((feature.hasLeftEyePosition) != nil){
                    var leftEyeRectY = secondimagepostview.image!.size.height - feature.leftEyePosition.y
                    var leftEyeRect  = CGRectMake(feature.leftEyePosition.x - 5,leftEyeRectY - 5,10,10)
                    //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                    //CGContextStrokeRect(drawCtxt,leftEyeRect)
                }
                
                //rightEye
                if((feature.hasRightEyePosition) != nil){
                    var rightEyeRectY = secondimagepostview.image!.size.height - feature.rightEyePosition.y
                    var rightEyeRect  = CGRectMake(feature.rightEyePosition.x - 5,rightEyeRectY - 5,10,10)
                    //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                    //CGContextStrokeRect(drawCtxt,rightEyeRect)
                }
            }
            var drawedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            secondimagepostview.image = drawedImage
            self.cleanrevert2.text = "yesfilter"
            
        } else {
            
            self.secondimagepostview.image = backupimage2.image
            
            self.cleanrevert2.text = "nofilter"
            
            
        }
    
        
    }
    
    
    
    @IBAction func seconddetectbutton(sender: AnyObject) {
    
    
        if cleanrevert2.text == "nofilter" {
        
        var ciImage  = CIImage(CGImage:secondimagepostview.image!.CGImage)
        var ciDetector = CIDetector(ofType:CIDetectorTypeFace
            ,context:nil
            ,options:[
                CIDetectorAccuracy:CIDetectorAccuracyHigh,
                CIDetectorSmile:true
            ]
        )
        var features = ciDetector.featuresInImage(ciImage)
        
        UIGraphicsBeginImageContext(secondimagepostview.image!.size)
        secondimagepostview.image!.drawInRect(CGRectMake(0,0,secondimagepostview.image!.size.width,secondimagepostview.image!.size.height))
        
        for feature in features{
            
            //context
            var drawCtxt = UIGraphicsGetCurrentContext()
            
            //face
            var faceRect = (feature as! CIFaceFeature).bounds
            faceRect.origin.y = secondimagepostview.image!.size.height - faceRect.origin.y - faceRect.size.height
            //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.redColor().CGColor)
            //CGContextStrokeRect(drawCtxt,faceRect)
            
            //mouse
            if((feature.hasMouthPosition) != nil){
                var mouseRectY = secondimagepostview.image!.size.height - feature.mouthPosition.y
                var mouseRect  = CGRectMake(feature.mouthPosition.x - 5,mouseRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt,UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,mouseRect)
            }
            
            //hige
            var higeImg      = UIImage(named:"hige_100.png")
            var mouseRectY = secondimagepostview.image!.size.height - feature.mouthPosition.y
            //ヒゲの横幅は顔の4/5程度
            var higeWidth  = faceRect.size.width * 4/5
            var higeHeight = higeWidth * 0.3 // 元画像が100:30なのでWidthの30%が縦幅
            var higeRect  = CGRectMake(feature.mouthPosition.x - higeWidth/2,mouseRectY - higeHeight/2,higeWidth,higeHeight)
            CGContextDrawImage(drawCtxt,higeRect,higeImg!.CGImage)
            
            //leftEye
            if((feature.hasLeftEyePosition) != nil){
                var leftEyeRectY = secondimagepostview.image!.size.height - feature.leftEyePosition.y
                var leftEyeRect  = CGRectMake(feature.leftEyePosition.x - 5,leftEyeRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,leftEyeRect)
            }
            
            //rightEye
            if((feature.hasRightEyePosition) != nil){
                var rightEyeRectY = secondimagepostview.image!.size.height - feature.rightEyePosition.y
                var rightEyeRect  = CGRectMake(feature.rightEyePosition.x - 5,rightEyeRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,rightEyeRect)
            }
        }
        var drawedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        secondimagepostview.image = drawedImage
            self.cleanrevert2.text = "yesfilter"
            
        } else {
            
            self.secondimagepostview.image = backupimage2.image
            
            self.cleanrevert2.text = "nofilter"
            
            
        }
    }
    
    
    @IBAction func secondblurbotton(sender: AnyObject) {
    
    
        if cleanrevert2.text == "nofilter" {
        var ciImage  = CIImage(CGImage:secondimagepostview.image!.CGImage)
        var ciDetector = CIDetector(ofType:CIDetectorTypeFace
            ,context:nil
            ,options:[
                CIDetectorAccuracy:CIDetectorAccuracyHigh,
                CIDetectorSmile:true
            ]
        )
        var features = ciDetector.featuresInImage(ciImage)
        
        UIGraphicsBeginImageContext(secondimagepostview.image!.size)
        secondimagepostview.image!.drawInRect(CGRectMake(0,0,secondimagepostview.image!.size.width,secondimagepostview.image!.size.height))
        
        for feature in features{
            
            //context
            var drawCtxt = UIGraphicsGetCurrentContext()
            
            //face
            var faceRect = (feature as! CIFaceFeature).bounds
            faceRect.origin.y = secondimagepostview.image!.size.height - faceRect.origin.y - faceRect.size.height
            //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.redColor().CGColor)
            //CGContextStrokeRect(drawCtxt,faceRect)
            
            //mouse
            if((feature.hasMouthPosition) != nil){
                var mouseRectY = secondimagepostview.image!.size.height - feature.mouthPosition.y
                var mouseRect  = CGRectMake(feature.mouthPosition.x - 5,mouseRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt,UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,mouseRect)
            }
            
            //hige
            var hige1Img      = UIImage(named:"dogfilter.png")
            var mouseRectY = secondimagepostview.image!.size.height - feature.mouthPosition.y
            //ヒゲの横幅は顔の4/5程度
            var hige1Width  = faceRect.size.width //* 4/5
            var hige1Height = hige1Width //* 0.3 // 元画像が100:30なのでWidthの30%が縦幅
            var hige1Rect  = CGRectMake(feature.mouthPosition.x - hige1Width/1.6,mouseRectY - hige1Width/1,hige1Width*1.3,hige1Height*1.3)
            CGContextDrawImage(drawCtxt,hige1Rect,hige1Img!.CGImage)
            
            //leftEye
            if((feature.hasLeftEyePosition) != nil){
                var leftEyeRectY = secondimagepostview.image!.size.height - feature.leftEyePosition.y
                var leftEyeRect  = CGRectMake(feature.leftEyePosition.x - 5,leftEyeRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,leftEyeRect)
            }
            
            //rightEye
            if((feature.hasRightEyePosition) != nil){
                var rightEyeRectY = secondimagepostview.image!.size.height - feature.rightEyePosition.y
                var rightEyeRect  = CGRectMake(feature.rightEyePosition.x - 5,rightEyeRectY - 5,10,10)
                //CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                //CGContextStrokeRect(drawCtxt,rightEyeRect)
            }
        }
        var drawedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        secondimagepostview.image = drawedImage
            self.cleanrevert2.text = "yesfilter"
            
        } else {
            
            self.secondimagepostview.image = backupimage2.image
            
            self.cleanrevert2.text = "nofilter"
            
            
        }
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
    }
    
    //dismiss view controller after post
    
    
}





