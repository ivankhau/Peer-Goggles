//
//  CardView.swift
//  Finder
//
//  Created by djay mac on 28/01/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit
import CoreLocation


class CardView: MDCSwipeToChooseView {
    
    
    var userimage:UIImageView = UIImageView()
    var userdetails:DetailsUser!
    var toUser:PFObject!
    var navController = UINavigationController()
    var user1pic:UIImage!
    var button = UIButton()
    
    
    
    init(frame:CGRect,user:PFObject,options:MDCSwipeToChooseViewOptions) {
        super.init(frame: frame,options:options)
        
        //if self.frame.height > 400.00 {
        //    self.frame.origin.y = self.frame.origin.y + (self.frame.height - 400)/2
        //    self.frame.size.height = 400.00
        //}
        //self.layer.borderColor = UIColor(red: 196 / 255.0, green: 203 / 255.0, blue: 201 / 255.0, alpha: 1.0).CGColor
        self.layer.borderColor = UIColor.grayColor().CGColor
        

        
        
        
        
        userdetails = NSBundle.mainBundle().loadNibNamed("UserDetails", owner: self, options: nil).last as? DetailsUser
        toUser = user
        
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        
        
        //userimage.frame = CGRectMake(5, 5, self.bounds.width - 10, self.bounds.width - 10)
        
        //userimage.frame = CGRectMake(1, 1, self.bounds.width - 2, self.bounds.width - 2)
        
        userimage.frame = CGRectMake(0, 0, self.bounds.width - 0, self.bounds.width - 0)

        
        self.insertSubview(userimage, belowSubview: self.imageView)
        

        
        
        //userimage.layer.borderColor = UIColor(red: 113 / 255.0, green: 129 / 255.0, blue: 125 / 255.0, alpha: 0.5).CGColor
        //userimage.layer.borderWidth = 1
        userimage.layer.cornerRadius = 4
        userimage.layer.masksToBounds = true
        
        
        userdetails.frame = CGRectMake(0, self.bounds.height - 80, self.bounds.width, 80)
        self.addSubview(userdetails)
        
        button = UIButton(frame: CGRectMake(0, 0, self.bounds.width, self.bounds.height))
        
        self.addSubview(button)
        getUserDetails(user)
        

    }

    
    func getUserDetails(forUser:PFObject) {
        
        //var name = forUser.objectForKey("name") as! String
        //var age = forUser.objectForKey("age") as! Int
        var about = forUser.objectForKey("message") as! String

        //userdetails.nameAge.text = "\(name), \(age)"
        userdetails.about.text = "\(about)"
        userdetails.about.layer.masksToBounds = true
        
        //if let mygeo = currentuser.objectForKey("location") as? PFGeoPoint {
        //       let getUsergeo = forUser.objectForKey("location") as! PFGeoPoint
        //    let distance:Double = mygeo.distanceInKilometersTo(getUsergeo)
            
       //     userdetails.distance.text = "📍\(Int(distance)) Km"
        //} else {
        //    userdetails.distance.text = "📍0.6 Km"

        //}
        
        // get user  pics
        if let pica = forUser.objectForKey("imageFile1") as? PFFile {
            pica.getDataInBackgroundWithBlock({ (data:NSData!, error:NSError!) -> Void in
                if error == nil {
                    self.user1pic = UIImage(data: data)
                    self.userimage.image = self.user1pic
                    
                    /*
                    var imageToBlur = CIImage(image: UIImage(data: data))
                    var blurfilter = CIFilter(name: "CIGaussianBlur")
                    blurfilter.setValue(imageToBlur, forKey: "inputImage")
                    var resultImage = blurfilter.valueForKey("outputImage") as! CIImage
                    var blurredImage = UIImage(CIImage: resultImage)
                    self.userimage.image = blurredImage
                    */
                    
                    /*
                    let originalImage = CIImage(image: UIImage(data: data))
                    var filter = CIFilter(name: "CIMedianFilter")
                    filter.setValue(originalImage, forKey: kCIInputImageKey)
                    let context = CIContext(options: [kCIContextUseSoftwareRenderer: true])
                    let outputImage = context.createCGImage(filter.outputImage, fromRect: filter.outputImage.extent())
                    var newImage = UIImage(CGImage: outputImage)
                    self.userimage.image = newImage
                    */
                    
                    


                    
                }
            })
        }
        
    }

    
    
    override func awakeFromNib() {
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    

    
    
    func viewUsera(sender:UIButton) {

        let matchvc = storyb.instantiateViewControllerWithIdentifier("matchfoundvc") as! MatchFoundViewController
        matchvc.navController = self.navController

        self.window?.rootViewController?.presentViewController(matchvc, animated: true, completion: nil)
        

    }
    
    
    
    
    
    
    
    
    
    
}
