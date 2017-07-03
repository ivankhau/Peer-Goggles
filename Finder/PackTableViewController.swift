//
//  PackTableViewController.swift
//  Finder
//
//  Created by Ivan Khau on 7/14/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class PackTableViewController: UITableViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    var firstViewController : SinglePostViewController?
    
    var findController : FindViewController?
    
    var fromwhere = ""

    @IBOutlet weak var topview: UIView!
    var usernames = [String]()
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func allpostsbutton(sender: AnyObject) {
        
        
        //self.performSegueWithIdentifier("mainsegue", sender: self)
        
        if fromwhere == "frompost" {
            self.fromwhere = ""
            firstViewController?.lastviewed1 = ""
            self.dismissViewControllerAnimated(true, completion: {})
            
            
        } else if fromwhere == "fromfind" {
            //self.performSegueWithIdentifier("packtofeedsegue", sender: self)
            
            self.fromwhere = ""
            findController?.lastviewed = ""
            findController?.newcat = "true"
            self.dismissViewControllerAnimated(true, completion: {})
            
            
            
        }
        
        
    }
    
    @IBAction func returntomain(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {})
        
    }
    
    //let imageOriginHeight: CGFloat = 240 + 64 + 31 + 31 + 31
    // it is the height of the 2 frames? 496 if 6p, ~ 397 other devices?
    //let tableViewController = UITableViewController()
    
    
    let imageView = UIImageView(image: UIImage(named: "topimage1.png")!)
    

    
    override func viewDidAppear(animated: Bool) {
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.frame = CGRectMake(0, -self.tableView.frame.size.width/2, self.tableView.frame.size.width, self.tableView.frame.size.width/2)
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.tableView.delegate = self
        self.tableView.addSubview(imageView)
        
    }
    
    //375 x 667
    
    
    
    // - 44 + 10 for iphone 5s, UIScreen.mainScreen().bounds.size.height/2 - 44 for 6 + 6p, - 44 - 5 for 4s !! prob just wants picture ratio
    
    

    
    
    
    
    
    
    @IBOutlet weak var menbutton: UIButton!
    
    
    @IBOutlet weak var womenbutton: UIButton!
    
    @IBOutlet weak var captionview: UIView!
    
    
    @IBOutlet weak var gobuttonoutlet: UIButton!
    
    
    //@IBOutlet weak var lastviewedlabeloutlet: UILabel!
    

    //@IBOutlet weak var lastviewedoutlet: UIButton!
    
    
    //@IBOutlet weak var searchbaroutlet: UITextField!
    
    
    /*@IBAction func searchbutton(sender: AnyObject) {
        
        var query1 = PFQuery(className: "Categories")
        query1.whereKey("catname", equalTo: searchbaroutlet.text)
        query1.findObjectsInBackgroundWithBlock { (catnames, error) -> Void in
            if catnames.count != 0 {
                for catname in catnames {
                    PFUser.currentUser()["lasviewed"] = self.searchbaroutlet.text as String
                    //userpf["lastviewed"] = userids[indexPath.row] as String
                    currentuser.saveInBackground()

                    catname.incrementKey("viewcount")
                    catname.saveInBackground()
                    //let currentcount = catname["viewcount"] as! Int
                    //catname.setValue(currentcount+1, forKey: "viewcount")
                    //catname.saveInBackground()
                    if error == nil {
                        self.performSegueWithIdentifier("packtofeedsegue", sender: self)
                    }
                    
                }
                
            } else {
                self.displayAlert("Group Does Not Exist", message: "Create one, or try again.")

            }
        }

    }*/
    
    
    
    
    
    
    
    
    
    
    var userids = [String]()
    var isFollowing = ["":false]
    
    var refresher: UIRefreshControl!
    
    
    @IBAction func menonlyaction(sender: AnyObject) {
        PFUser.query()
        
        
        if PFUser.currentUser()["gender"] as! Int == 1 {
            
            println("yesmale")
            
            
            
            //self.performSegueWithIdentifier("hissegue", sender: self)
            if fromwhere == "frompost" {
                self.fromwhere = ""
                firstViewController?.lastviewed1 = "His Eyes Only"
                self.dismissViewControllerAnimated(true, completion: {})
                
                
            } else if fromwhere == "fromfind" {
                //self.performSegueWithIdentifier("packtofeedsegue", sender: self)
                
                self.fromwhere = ""
                findController?.lastviewed = "His Eyes Only"
                findController?.newcat = "true"
                self.dismissViewControllerAnimated(true, completion: {})
                
                
                
            }
            
            
            
            
            
        } else {
            
            self.displayAlert("Boys Only", message: "KEEP OUT!")
            
            
        }

        
        
    }
    
    
    @IBAction func womenonlyaction(sender: AnyObject) {
        PFUser.query()
        
        
        if PFUser.currentUser()["gender"] as! Int == 2 {
            
            println("yesfemale")
            
            //self.performSegueWithIdentifier("hersegue1", sender: self)
            if fromwhere == "frompost" {
                self.fromwhere = ""
                firstViewController?.lastviewed1 = "Her Eyes Only"
                self.dismissViewControllerAnimated(true, completion: {})
                
                
            } else if fromwhere == "fromfind" {
                //self.performSegueWithIdentifier("packtofeedsegue", sender: self)
                
                self.fromwhere = ""
                findController?.lastviewed = "Her Eyes Only"
                findController?.newcat = "true"
                self.dismissViewControllerAnimated(true, completion: {})
                
                
                
            }
            
        } else {
            
            self.displayAlert("Girls Only", message: "KEEP OUT!")
            
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var topView: UIView!
    
    
    func refresh() {
        
        
        var query = PFQuery(className: "Categories")
        
        query.orderByDescending("postcount")
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if let objects = objects {
                
                self.userids.removeAll(keepCapacity: true)

                
                for object in objects {
                    
                    //let array:NSArray = self.userids.reverseObjectEnumerator().allObjects
                    //self.queryobjectsArray = NSMutableArray(array: array)
                    

                    
                    //self.usernames.append(user.username!)
                    self.userids.append(object["catname"] as! String)
                    
                    //self.usernames.append(object["objectId"] as! String)
                    
                    self.tableView.reloadData()
                    
                    //self.topView.reloadInputViews()
                    
                    self.refresher.endRefreshing()
                    
                    
                    /*
                    var query = PFQuery(className: "Categories")
                    
                    //query.whereKey("follower", equalTo: PFUser.currentUser()!.objectId!)
                    //query.whereKey("following", equalTo: user.objectId!)
                    
                    query.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                    
                    if let objects = objects {
                    
                    if objects.count > 0 {
                    
                    self.isFollowing[object["catname"] as! String] = true
                    
                    } else {
                    
                    self.isFollowing[object["catname"] as! String] = false
                    
                    }
                    }
                    
                    /*if self.isFollowing.count == self.usernames.count {
                    
                    self.tableView.reloadData()
                    
                    self.refresher.endRefreshing()
                    
                    }*/
                    
                    
                    })*/
                    
                    
                    
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
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if let letterRange = string.rangeOfCharacterFromSet(NSCharacterSet.lowercaseLetterCharacterSet()){
            return true
        }else if string != "" {
            return false }; return true
    }

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
        
        //view.addSubview(self.tableView)
        
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        backButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20)!], forState: UIControlState.Normal)
        navigationItem.backBarButtonItem = backButton

        
        //view.backgroundColor = UIColor(patternImage: UIImage(named:"groupbackground")!)
        
        //self.view.backgroundColor = UIColor(patternImage: scaleImage("groupbackground", and: self.view.frame.size))
        
        //self.captionview.backgroundColor = UIColor.clearColor()
        
        //self.tableView.backgroundView = UIImageView(image: UIImage(named: "secondtabbar4"))
        
        self.navigationController?.navigationBar.topItem?.title = "Categories"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        menbutton.layer.cornerRadius = 5
        
        womenbutton.layer.cornerRadius = 5
        
        
        //lastviewedoutlet.layer.cornerRadius = 5
        
        //gobuttonoutlet.layer.cornerRadius = 5
        
        //self.searchbaroutlet.delegate = self
        
        //var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        //view.addGestureRecognizer(tap)



        
        //lastviewedoutlet.setTitle(lastviewed, forState: .Normal)
        
        refresher = UIRefreshControl()
        
        
        
        //refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        
        //refresher.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        
        //self.tableView.addSubview(refresher)
        
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
        return userids.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("packcell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = userids[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.font = UIFont(name: "AvenirNext-Regular", size: 15.0)
        cell.textLabel!.textColor = UIColor.darkGrayColor()
        //cell.textLabel!.font = UIFont.systemFontOfSize(14.0)
        

        
        
        
        return cell
    }
    /*
    override func viewDidAppear(animated: Bool) {
        let lastviewed = PFUser.currentUser()!["lasviewed"] as? String
        lastviewedoutlet.setTitle(lastviewed, forState: .Normal)
    }*/
    
    @IBAction func backFromModal(segue: UIStoryboardSegue) {
        println("and we are back")
        // Switch to the second tab (tabs are numbered 0, 1, 2)
        self.tabBarController?.selectedIndex = 1
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        

        if fromwhere == "frompost" {
            self.fromwhere = ""
            firstViewController?.lastviewed1 = userids[indexPath.row]
            self.dismissViewControllerAnimated(true, completion: {})
            
            
        } else if fromwhere == "fromfind" {
            //self.performSegueWithIdentifier("packtofeedsegue", sender: self)
            
            self.fromwhere = ""
            findController?.lastviewed = userids[indexPath.row]
            findController?.newcat = "true"
            self.dismissViewControllerAnimated(true, completion: {})
            
            
            
        }


    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "packtofeedsegue"){
            let indexPath = self.tableView.indexPathForSelectedRow()

            
            let lastviewed = userids[indexPath!.row]
            
            //let navVC = segue.destinationViewController as! UINavigationController
            //let detailVC = navVC.topViewController as! PackFeedViewController
            //detailVC.lastviewed = lastviewed
            
            
            let barViewControllers = segue.destinationViewController as! UITabBarController
            let nav = barViewControllers.viewControllers![0] as! UINavigationController
            let destinationViewController = nav.topViewController as! FindViewController
            destinationViewController.lastviewed = userids[indexPath!.row]
            //destinationViewController.lastviewed = userids[indexPath!.row]
            
            
            
            println(lastviewed)
            
            
        }
        
        if(segue.identifier == "hissegue"){
            //let navVC = segue.destinationViewController as! UINavigationController
            //let detailVC = navVC.topViewController as! PackFeedViewController
            
            
            
            let barViewControllers = segue.destinationViewController as! UITabBarController
            let nav = barViewControllers.viewControllers![0] as! UINavigationController
            let destinationViewController = nav.topViewController as! FindViewController
            destinationViewController.lastviewed = "His Eyes Only"
            
            
        }
        
        if(segue.identifier == "hersegue1"){
            //let navVC = segue.destinationViewController as! UINavigationController
            //let detailVC = navVC.topViewController as! PackFeedViewController
            
            let barViewControllers = segue.destinationViewController as! UITabBarController
            let nav = barViewControllers.viewControllers![0] as! UINavigationController
            let destinationViewController = nav.topViewController as! FindViewController
            destinationViewController.lastviewed = "Her Eyes Only"
            
            
        }
        
        if(segue.identifier == "mainsegue"){
            //let navVC = segue.destinationViewController as! UINavigationController
            //let detailVC = navVC.topViewController as! PackFeedViewController
            
            let barViewControllers = segue.destinationViewController as! UITabBarController
            let nav = barViewControllers.viewControllers![0] as! UINavigationController
            let destinationViewController = nav.topViewController as! FindViewController
            destinationViewController.lastviewed = "Peer Goggles"
            
            
        }

        
        
    }
}
