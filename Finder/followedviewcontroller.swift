//
//  followedviewcontroller.swift
//  Finder
//
//  Created by Ivan Khau on 9/16/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class followedviewcontroller: UITableViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    var toUser:PFObject!
    var whichsort: String = "Followed"
    
    @IBOutlet weak var topbar: UISegmentedControl!
    
    
    @IBAction func topbaraction(sender: AnyObject) {
        self.alias.removeAll(keepCapacity: true)
        self.followobjectid.removeAll(keepCapacity: true)
        tableView.reloadData()
        
        self.topbar.userInteractionEnabled = false
        
        
        if topbar.selectedSegmentIndex == 0 {
            whichsort = "Followed"
            
            
            refresh()
            
            
            
            
        }
        
        if topbar.selectedSegmentIndex == 1 {
            whichsort = "Followers"
            
            refresh()
            
        }
        
        
        
        
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        view.addGestureRecognizer(tap)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        view.removeGestureRecognizer(tap)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField.isEqual(findtext) {
            findtext.text = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string.lowercaseString)
            return false
        }
        
        if string == "\n"
        {
            textField.resignFirstResponder()
            return false
        }
        
        return true
    }
    
    
    @IBOutlet weak var findtext: UITextField!
    
    
    @IBOutlet weak var searchbutton: UIButton!
    
    @IBAction func searchaction(sender: AnyObject) {
        
        let countletters = count(findtext.text)

        if findtext != "" && countletters > 3 && countletters < 15 {
        
        var query = PFQuery(className: "Post")
        
        query.whereKey("alias", equalTo: findtext.text)
        
        query.getFirstObjectInBackgroundWithBlock { (toUserObject, NSError) -> Void in
            
            if NSError == nil {
            self.toUser = toUserObject
            self.performSegueWithIdentifier("followedtoprofile", sender: self)
            } else {
               self.displayAlert("Unable to Find User", message: "Profiles are hidden until the user creates a non-anonymous post.")
            }
            
            
        }
        } else {
            self.displayAlert("Unable to Find User", message: "Profiles are hidden until the user creates a non-anonymous post.")
        }
        
        
    }
    
    
    
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            

            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func allpostsbutton(sender: AnyObject) {
        
        
        self.performSegueWithIdentifier("mainsegue", sender: self)
        
        
    }
    
    @IBAction func returntomain(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {})
        
    }
    
    //let imageOriginHeight: CGFloat = 240 + 64 + 31 + 31 + 31
    // it is the height of the 2 frames? 496 if 6p, ~ 397 other devices?
    //let tableViewController = UITableViewController()
    
    
    let imageView = UIImageView(image: UIImage(named: "topimage1.png")!)
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        /*
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.frame = CGRectMake(0, -self.tableView.frame.size.width/2, self.tableView.frame.size.width, self.tableView.frame.size.width/2)
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.tableView.delegate = self
        self.tableView.addSubview(imageView)
        println(self.followobjectid)*/
    }
    

    var alias = [String]()
    var followobjectid = [String]()
    
    
    var isFollowing = ["":false]
    
    var refresher: UIRefreshControl!
    
    
    @IBAction func menonlyaction(sender: AnyObject) {
        PFUser.query()
        
        
        if PFUser.currentUser()["gender"] as! Int == 1 {
            
            println("yesmale")
            
            self.performSegueWithIdentifier("hissegue", sender: self)
            
        } else {
            
            self.displayAlert("Boys Only", message: "KEEP OUT!")
            
            
        }
        
        
        
    }
    
    
    @IBAction func womenonlyaction(sender: AnyObject) {
        PFUser.query()
        
        
        if PFUser.currentUser()["gender"] as! Int == 2 {
            
            println("yesfemale")
            
            self.performSegueWithIdentifier("hersegue1", sender: self)
            
        } else {
            
            self.displayAlert("Girls Only", message: "KEEP OUT!")
            
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    @IBOutlet weak var followlabel: UILabel!
    
    
    var activityIndicator = UIActivityIndicatorView()

    
    
    func refresh() {
        
        
        var query = PFQuery(className: "followers")
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let userinfo = appDelegate.userinfo

        
        
        
        if whichsort == "Followed" {
        query.whereKey("follower", containedIn: userinfo["following"] as! Array)
        }
        
        if whichsort == "Followers" {
        query.whereKey("follower", containedIn: userinfo["followedby"] as! Array)
        }
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if let objects = objects {
                
                var postycount = objects.count as Int
                
                self.alias.removeAll(keepCapacity: true)
                self.followobjectid.removeAll(keepCapacity: true)
                //if self.whichsort == "Followed" {
                
                
                if objects.count != 1 {
                    self.followlabel.text = "\(postycount) Users" as String
                } else {
                    self.followlabel.text = "\(postycount) User" as String
                }
                
                if objects.count == 0 {
                    self.tableView.reloadData()
                    self.topbar.userInteractionEnabled = true
                    self.activityIndicator.stopAnimating()
                    self.refresher.endRefreshing()


                }
                
                //} else {
                    //self.followlabel.text = "Followers: \(postycount)" as String
                //}
                
                for object in objects {
                    

                    self.alias.append(object["alias"] as! String)
                    
                    self.followobjectid.append(object["follower"] as! String)
                    
                    
                    self.tableView.reloadData()
                    self.topbar.userInteractionEnabled = true
                    self.activityIndicator.stopAnimating()
                    self.refresher.endRefreshing()
                    
                    
                    
                    
                }
            }
            
        }
        
        
        
        //}
        
        
        
        //})
        
        
        
        
        
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    /*
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if let letterRange = string.rangeOfCharacterFromSet(NSCharacterSet.lowercaseLetterCharacterSet()){
            return true
        }else if string != "" {
            return false }; return true
    }*/
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        if(yOffset < -self.tableView.frame.size.width/2) {
            var imageFrame = imageView.frame
            imageFrame.origin.y = yOffset
            imageFrame.size.height = -yOffset
            
            imageView.frame = imageFrame
        }
    }
    
    var tap: UITapGestureRecognizer = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        tap = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        
        
        
        findtext.delegate = self
        
        
        searchbutton.layer.cornerRadius = 4
        searchbutton.layer.masksToBounds = true
        
        
        refresher = UIRefreshControl()
        
        
        refresher.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        
        self.tableView.addSubview(refresher)

        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        backButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20)!], forState: UIControlState.Normal)
        navigationItem.backBarButtonItem = backButton
        
        
        
        self.navigationController?.navigationBar.topItem?.title = "Categories"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        

        
        refresh()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return alias.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("followercell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = alias[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.font = UIFont(name: "AvenirNext-Regular", size: 15.0)
        cell.textLabel!.textColor = UIColor.darkGrayColor()
        //cell.textLabel!.font = UIFont.systemFontOfSize(14.0)
        
        
        
        
        
        return cell
    }
    


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        println("wtf")
        var query = PFQuery(className: "Post")
        query.whereKey("userId", equalTo: followobjectid[indexPath.row])
        query.whereKey("alias", notEqualTo: "Anonymous")
        
        query.getFirstObjectInBackgroundWithBlock { (toUserObject, NSError) -> Void in
    
            if toUserObject == nil {
            self.displayAlert("Profile is Hidden", message: "Profiles are hidden until the user creates a non-anonymous post.")
            } else {
            self.toUser = toUserObject
            self.performSegueWithIdentifier("followedtoprofile", sender: self)
            }
        }

        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        
        
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if(segue.identifier == "followedtoprofile"){
            
            let nav = segue.destinationViewController as! UINavigationController
            
            let destinationViewController = nav.topViewController as! YourPrivateViewController
            destinationViewController.toUser = toUser
            
            
        }
        
        
        
    }
}