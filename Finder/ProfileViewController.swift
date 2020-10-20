//
//  ProfileViewController.swift
//  Finder
//
//  Created by djay mac on 27/01/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit
import CoreLocation
import Social

class ProfileViewController: UITableViewController, CLLocationManagerDelegate, UIActionSheetDelegate {
    
    
    //@IBOutlet weak var myPostsCell: UITableViewCell!
    
    //@IBOutlet weak var aboutview: UIView!
    
    @IBOutlet weak var myPostsCell: UITableViewCell!
    
    @IBOutlet weak var nameLocationCell: UITableViewCell!

    
    @IBOutlet weak var profilepic: UIImageView!
    //@IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    //@IBOutlet weak var photoScroll: UIScrollView!
    //@IBOutlet weak var noPhotosLabel: UILabel!
    //@IBOutlet weak var aboutText: UILabel!
    var userpics:[UIImage] = []
    
    var manager:CLLocationManager = CLLocationManager()
    
    
    @IBOutlet weak var aboutpeergogglesview: UIView!
    
    //@IBOutlet weak var summarybackground: UILabel!
    
    //@IBOutlet weak var summarytext: UILabel!
    
    
    //@IBOutlet weak var summarytext: UITextView!
    
    
    @IBAction func showsummary(sender: AnyObject) {
        
        
        //summarybackground.hidden = false
        //summarytext.hidden = false
        //closesummary.enabled = true
        //closesummary.hidden = false
        showsummaryoutlet.hidden = true
        showsummaryoutlet.enabled = false
        //captionoutlet.hidden = true
        
    }
    
    @IBOutlet weak var showsummaryoutlet: UIButton!
    
    //@IBOutlet weak var closesummary: UIButton!
    /*
    @IBAction func closesummarybutton(sender: AnyObject) {
        //summarybackground.hidden = true
        summarytext.hidden = true
        closesummary.enabled = false
        closesummary.hidden = true
        showsummaryoutlet.hidden = false
        showsummaryoutlet.enabled = true
        //captionoutlet.hidden = false

    }*/
    
    
    //@IBOutlet weak var captionoutlet: UIImageView!
    
    let imageView = UIImageView(image: UIImage(named: "topimage3.png")!)
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        if(yOffset < -self.tableView.frame.size.width/2) {
            var imageFrame = imageView.frame
            imageFrame.origin.y = yOffset
            imageFrame.size.height = -yOffset
            
            imageView.frame = imageFrame
        }
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //func drawTextInRect(rect: CGRect) {
        //var insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        //aboutpeergogglesview.summarytext(UIEdgeInsetsInsetRect(rect, insets))
            
        //}
        
        
        /*
        
        var query1 = PFQuery(className: "followers")
        
        
        query1.whereKey("follower", equalTo: currentuser.objectId)
        query1.getFirstObjectInBackgroundWithBlock { (PFObject, NSError) -> Void in
            
            
            
            
            
            if (PFObject.objectForKey("followedby") as! NSArray).containsObject("ANVLw4Qfuo") {
                
                println("working")
                
                
            }
      
        }*/
        
        
        
        
        
        
        
        
        
        //captionoutlet.hidden = true
        
        //summarybackground.hidden = true
        //summarytext.hidden = true
        
        //closesummary.enabled = false
       // closesummary.hidden = true
        
        
        //myPostsCell.userInteractionEnabled = false
        
        myPostsCell.selectionStyle = UITableViewCellSelectionStyle.None
        
        nameLocationCell.selectionStyle = UITableViewCellSelectionStyle.None
        //tableView.allowsSelection = false
        //var name = currentuser.objectForKey("name") as! String
        
        
        //self.navigationController?.navigationBar.topItem?.title = "\(name)"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        aboutpeergogglesview.backgroundColor = UIColor.clearColor()
        
        if UIScreen.mainScreen().bounds.size.height == 480.0 {
            self.tableView.backgroundView = UIImageView(image: UIImage(named: "backgroundtab4iphone4"))
        }
        
        
        if UIScreen.mainScreen().bounds.size.height == 568.0 {
            self.tableView.backgroundView = UIImageView(image: UIImage(named: "backgroundtab4iphone5"))
            
            
        }
        
        if UIScreen.mainScreen().bounds.size.height == 667.0 {
            self.tableView.backgroundView = UIImageView(image: UIImage(named: "backgroundtab4iphone6"))
            
        }
        
        if UIScreen.mainScreen().bounds.size.height == 736.0 {
            self.tableView.backgroundView = UIImageView(image: UIImage(named: "backgroundtab4iphone6s"))
            
            
        }
        
        
        
        
        //self.tableView.backgroundView = UIImageView(image: UIImage(named: "firsttabbar4"))
        
        
        //let backImg: UIImage = UIImage(named: "blank")!
        //UIBarButtonItem.appearance().setBackButtonBackgroundImage(backImg, forState: .Normal, barMetrics: .Default)
        
        //let backItem = UIBarButtonItem(title: "", style: .Bordered, target: nil, action: nil)
        //navigationItem.backBarButtonItem = backItem
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        backButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20)!], forState: UIControlState.Normal)
        navigationItem.backBarButtonItem = backButton
        
        //var backImg: UIImage = UIImage(named: "backarroww22")!
        //backButton.setBackgroundImage(backImg, forState: .Normal, barMetrics: .Default)
        
        //let backImg: UIImage = UIImage(named: "backarroww22")!
        //UIBarButtonItem.appearance().setBackButtonBackgroundImage(backImg, forState: .Normal, barMetrics: .Default)
        
        //PFUser.currentUser()["location"] = PFGeoPoint(latitude: locality, longitude: administrativeArea)
        
        
        
        
        //PENIS
        //PENIS
        /*
        var friendsRequest : FBRequest = FBRequest.requestForMyFriends()
        friendsRequest.startWithCompletionHandler
            {
                (connection:FBRequestConnection!,   result:AnyObject!, error:NSError!) -> Void in
                var resultdict = result as! NSDictionary
                
                var totalCount: AnyObject? = resultdict.objectForKey("summary")!.objectForKey("total_count")!
                currentuser.setValue(totalCount, forKey: "fbfriendcount")
                //var testInt = totalCount as! NSString
                //println(totalCount)
                
                //var totalCount1 = resultdict.valueForKeyPath("summary.total_count")
                
                //println(totalCount1)
                                
                
                currentuser.saveInBackground()
                
                
                
        }
        */
        //PENIS
        //PENIS
        
        profilepic.layer.borderColor = UIColor.lightGrayColor().CGColor
        profilepic.layer.borderWidth = 1
        profilepic.layer.cornerRadius = 40
        profilepic.layer.masksToBounds = true
        
        
        //nameLabel.textColor = colorText
        locationLabel.textColor = colorText
        //aboutText.textColor = colorText
        
        //profilepic.layer.borderColor = colorText.CGColor
        
        
        //self.tableView.backgroundColor = UIColor.clearColor()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        if iOS8 {
            manager.requestWhenInUseAuthorization()
        }
        
        
        
    }

    override func viewDidAppear(animated: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let userinfo = appDelegate.userinfo
        var name = userinfo.objectForKey("alias")
        self.navigationController?.navigationBar.topItem?.title = "\(name)"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 18)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.frame = CGRectMake(0, -self.tableView.frame.size.width/2, self.tableView.frame.size.width, self.tableView.frame.size.width/2)
        
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.tableView.delegate = self
        self.tableView.addSubview(imageView)
        
        
        if justSignedUp {
            justSignedUp = false
            //self.performSegueWithIdentifier("showedit", sender: self)
        }
        manager.startUpdatingLocation()
        //var name = currentuser.objectForKey("name") as! String
        //aboutText.text = currentuser.objectForKey("about") as? String
        var age: AnyObject! = currentuser.objectForKey("age")
        
        //nameLabel.text = "\(name)"
        
        
        
        //getImage("dpSmall",profilepic)
        
        //getPhotos("pic1","pic2","pic3","pic4")
        
        
        
        //let userinfo = appDelegate.userinfo
        
        //println(userinfo)
        
        
        //userimage.image = userinfo.objectForKey("image") as? UIImage
        if let pic = userinfo.objectForKey("image") as? PFFile {
            pic.getDataInBackgroundWithBlock({ (data:NSData!, error:NSError!) -> Void in
                if error == nil {
                    self.profilepic.image = UIImage(data: data)
                }
            })
        }
        
        

    }
    
    //@IBAction func Edit1Button(sender: AnyObject) {
    //}
    
    
    /*func getPhotos(forKey:String...) {
        // get user  pics
        self.userpics.removeAll(keepCapacity: false)
        for f in forKey {
            if let pic = currentuser.objectForKey(f) as? PFFile {
            pic.getDataInBackgroundWithBlock({ (data:NSData!, error:NSError!) -> Void in
                if error == nil {
                    var image = UIImage(data: data!)
                   self.userpics.append(image!)
                    self.updatePics()
                    self.noPhotosLabel.hidden = true
                }
            })
        } else {
                if self.userpics.count == 0 {
                    self.noPhotosLabel.hidden = false
                }
            }
        }
        
    }*/

    /*func updatePics() {
        photoScroll.contentSize = CGSize(width: CGFloat(self.userpics.count*66), height: 64)
        for i in 1...self.userpics.count {
           var p = i - 1 as Int
            var position = CGFloat(p*66 + 10)
            var imgview = UIImageView(frame: CGRectMake(position, 0, 64, 64))
            imgview.image = self.userpics[p]
            photoScroll.addSubview(imgview)
            imgview.layer.cornerRadius = 32
            imgview.layer.masksToBounds = true
        }
        
    }*/
    
    





    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {

        let location = locations[0] as! CLLocation

        
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error) -> Void in
            if (error != nil) {
                println("Error:" + error.localizedDescription)
                return
              }
            if placemarks.count > 0 && locations.count > 0 {
                self.manager.stopUpdatingLocation()
                let pm = placemarks[0] as! CLPlacemark
                self.locationLabel.text = "📍 \(pm.locality), \(pm.administrativeArea)"
                
                //PFUser.currentUser()["location"] = PFGeoPoint(latitude: locality, longitude: administrativeArea)

            } else {
                println("Error with data")
                
            }
        })
    }
    


    
    /*@IBAction func didTapShare(sender: AnyObject) {
        var sheetShare = UIActionSheet(title: "Choose Network", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil)
        sheetShare.addButtonWithTitle("Facebook")
        sheetShare.addButtonWithTitle("Twitter")
        sheetShare.showInView(self.view)
    }*/
    
    /*
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {

        if buttonIndex == 1 { // Facebook
            
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
                
                var controller = SLComposeViewController(forServiceType:SLServiceTypeFacebook)
                
                controller.setInitialText(shareText)
                controller.addURL(NSURL(string: appUrl) )
                
                self.presentViewController(controller, animated: true, completion: nil)
                controller.completionHandler = { (result:SLComposeViewControllerResult) -> Void in
                    switch result {
                    case SLComposeViewControllerResult.Cancelled:
                        println("fb cancel")
                    case SLComposeViewControllerResult.Done:
                        println("done")
                    }
                }
                
            } else {
                
                var alert = UIAlertView(title: "No Facebook Account", message: "Oops, you've not added facebook account in your iphone settings", delegate: self, cancelButtonTitle: "Okay")
                alert.show()
                
            }
            
            
            
        } else if buttonIndex == 2 { // Twitter
            
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
                
                var controller = SLComposeViewController(forServiceType:SLServiceTypeTwitter)
                
                controller.setInitialText(shareText)
                controller.addURL(NSURL(string: appUrl) )
                
                self.presentViewController(controller, animated: true, completion: nil)
                controller.completionHandler = { (result:SLComposeViewControllerResult) -> Void in
                    switch result {
                    case SLComposeViewControllerResult.Cancelled:
                        println("fb cancel")
                    case SLComposeViewControllerResult.Done:
                        println("done")
                    }
                }
                
                
            } else {
                
                var alert = UIAlertView(title: "No Twitter Account", message: "Oops! Looks like you've not added Twitter account in your settings", delegate: self, cancelButtonTitle: "Okay")
                alert.show()
            }
            
        }
    }*/
    
    /*
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if tableView.respondsToSelector("setSeparatorInset:") {
            tableView.separatorInset = UIEdgeInsetsZero
        }
        
        if tableView.respondsToSelector("setLayoutMargins:"){
            tableView.layoutMargins = UIEdgeInsetsZero
        }
        
        if cell.respondsToSelector("setLayoutMargins:"){
            cell.layoutMargins = UIEdgeInsetsZero
        }
        
    }*/
    
    

    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "publicpostsegue"){
            //let indexPath = self.tableView.indexPathForSelectedRow()
            //let button = sender as! UIButton
            //let view = button.superview!
            //let cell = view.superview as! YourAdviseControllerCell
            
            //let indexPath = tableView.indexPathForCell(cell)
            
            //let row = indexPath?.row
            
            
            //var query = PFQuery(className: "Post")
            //query.whereKey("objectId", equalTo: cell.NewFeedLabel2.text!)
            //var messages = query.findObjects()
            //let obj = query.getObjectWithId(cell.NewFeedLabel2.text)
            
            //println(query.getFirstObject())
            //cell.NewFeedLabel2.text
            let obj = "public"
            
            let navVC = segue.destinationViewController as! YourAdviseViewController
            
            navVC.privatepublic = obj
        }
        
        if(segue.identifier == "privatepostsegue"){
            
            let obj = "private"
            
            let navVC = segue.destinationViewController as! YourAdviseViewController
            
            navVC.privatepublic = obj
        }
    }*/
    
    
    
}
