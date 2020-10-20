//
//  EditProfileViewController.swift
//  Finder
//
//  Created by djay mac on 27/01/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class EditProfileViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate, UITextViewDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    
    @IBOutlet weak var aboutText: UITextView!
    @IBOutlet weak var ageTF: UITextField!
    
    var manager:CLLocationManager = CLLocationManager()

    // add photos
    
    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var photo3: UIImageView!
    @IBOutlet weak var photo4: UIImageView!
    
    var buttonclicked:Int! // which button clickd
    
    // what changed
    var profileImageChanged:Bool = false
    var photo1Changed = false
    var photo2Changed = false
    var photo3Changed = false
    var photo4Changed = false
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = backColor

        nameTF.text = currentuser.objectForKey("name") as! String
        
        var age: AnyObject! = currentuser.objectForKey("age")
        if let gender = currentuser.objectForKey("gender") as? Int {
            ageTF.text = "\(age)"
            genderSegment.selectedSegmentIndex = gender - 1
        }

        
        
        getImage("dpSmall",profileImage)
        getImage("pic1",photo1)
        getImage("pic2",photo2)
        getImage("pic3",photo3)
        getImage("pic4",photo4)
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        if iOS8 {
            manager.requestWhenInUseAuthorization()
        }
        
        manager.startUpdatingLocation()
        aboutText.delegate = self
    }


    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        var textlength = (textView.text as NSString).length + (text as NSString).length - range.length
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return (textlength > 150) ? false : true
    }
    
    
    
    func showpicker(num:Int) {
        buttonclicked = num
        var mediapicker = UIImagePickerController()
        mediapicker.allowsEditing = true
        mediapicker.delegate = self
        mediapicker.sourceType = .PhotoLibrary
        self.presentViewController(mediapicker, animated: true, completion: nil)
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if locations.count > 0 {
            self.manager.stopUpdatingLocation()
            let location = locations[0] as! CLLocation
            currentuser["location"] = PFGeoPoint(location: location)
        }
    }
    
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    @IBAction func profiledpTapped(sender: AnyObject) {
        self.showpicker(0)
        
    }
    
    
    @IBAction func photo1Tapped(sender: AnyObject) {
        self.showpicker(1)

    }
    
    
    
    
    @IBAction func photo2Tapped(sender: AnyObject) {
        self.showpicker(2)

    }
    
    
    
    @IBAction func photo3Tapped(sender: AnyObject) {
        self.showpicker(3)

    }
    
    
    
    @IBAction func photo4Tapped(sender: AnyObject) {
        self.showpicker(4)

    }
    
    
    // MARK: - Table view data source

    @IBAction func saveTapped(sender: AnyObject) {
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        if nameTF.text.isEmpty || aboutText.text.isEmpty {
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            var alert = UIAlertView(title: "Error", message: "Name or About Cannot be Empty", delegate: self, cancelButtonTitle: "okay")
            alert.show()
        } else if ageTF.text.isEmpty {

            MBProgressHUD.hideHUDForView(self.view, animated: true)
            var alert = UIAlertView(title: "Error", message: "Age Cannot be Empty", delegate: self, cancelButtonTitle: "okay")
            alert.show()
        } else {
            currentuser["name"] = nameTF.text
        
            currentuser["gender"] = genderSegment.selectedSegmentIndex + 1
            currentuser["age"] = ageTF.text.toInt()
            
            if profileImageChanged == true {
                var imageL = scaleImage(self.profileImage.image!, and: 320)
                var imageSmall = scaleImage(self.profileImage.image!, and: 60)
                var dataL = UIImageJPEGRepresentation(imageL, 0.7)
                var dataS = UIImageJPEGRepresentation(imageSmall, 0.7)
                currentuser["dpLarge"] = PFFile(name: "image.jpg", data: dataL)
                currentuser["dpSmall"] = PFFile(name: "image.jpg", data: dataS)
                currentuser.saveInBackground()
            }
            
            if photo1Changed == true {
                var imageL = scaleImage(self.photo1.image!, and: 320)
                var dataL = UIImageJPEGRepresentation(imageL, 0.7)
                currentuser["pic1"] = PFFile(name: "image.jpg", data: dataL)
                currentuser.saveInBackground()
            }
            
            
            if photo2Changed == true {
                var imageL = scaleImage(self.photo2.image!, and: 320)
                var dataL = UIImageJPEGRepresentation(imageL, 0.7)
                currentuser["pic2"] = PFFile(name: "image.jpg", data: dataL)
                currentuser.saveInBackground()
            }
            
            
            
            if photo3Changed == true {
                var imageL = scaleImage(self.photo3.image!, and: 320)
                var dataL = UIImageJPEGRepresentation(imageL, 0.7)
                currentuser["pic3"] = PFFile(name: "image.jpg", data: dataL)
                currentuser.saveInBackground()
            }
            
            
            
            if photo4Changed == true {
                var imageL = scaleImage(self.photo4.image!, and: 320)
                var dataL = UIImageJPEGRepresentation(imageL, 0.7)
                currentuser["pic4"] = PFFile(name: "image.jpg", data: dataL)
                currentuser.saveInBackground()
            }
            
            
            currentuser.saveInBackgroundWithBlock({ (done:Bool, error:NSError!) -> Void in
                if error == nil {
                    self.dismissViewControllerAnimated(true, completion: nil)
                    MBProgressHUD.hideHUDForView(self.view, animated: true)
                } else {
                    MBProgressHUD.hideHUDForView(self.view, animated: true)
                }
            })
            
            
            
            
        }
        
    }
    
    
    
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var pickedImg = info[UIImagePickerControllerEditedImage] as! UIImage
        if buttonclicked == 0 { // change main dp
            profileImageChanged = true
            profileImage.image = pickedImg
        } else if buttonclicked == 1 { // change photo1
            photo1Changed = true
            photo1.image = pickedImg
        } else if buttonclicked == 2 { // change photo2
            photo2Changed = true
            photo2.image = pickedImg
        } else if buttonclicked == 3 { // change photo3
            photo3Changed = true
            photo3.image = pickedImg
        } else if buttonclicked == 4 { // change photo4
            photo4Changed = true
            photo4.image = pickedImg
        }
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
   
    

    

}
