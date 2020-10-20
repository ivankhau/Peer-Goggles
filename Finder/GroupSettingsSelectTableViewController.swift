//
//  GroupSettingsSelectTableViewController.swift
//  Finder
//
//  Created by Ivan Khau on 8/4/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class GroupSettingsSelectTableViewController: UITableViewController {
    
    var usernames = [String]()
    
    //@IBOutlet weak var catobjectid: UILabel!
    
    var objectid = [String]()
    
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    
    @IBOutlet weak var privatecaptionview: UIView!
    
    
    //@IBOutlet weak var createoraddoutlet: UIButton!
    
    
    //@IBOutlet weak var groupsettingsoutlet: UIButton!
    
    
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
    
    func refresh() {
        
        
        var query = PFQuery(className: "PrivateGroups")
        
        //query.whereKey("privatename", equalTo: PFUser.currentUser()["memberofgroup"])
        
        query.whereKey("members", equalTo: PFUser.currentUser()!.objectId!)
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if let objects = objects {
                
                self.userids.removeAll(keepCapacity: true)
                
                
                for object in objects {
                    
                    //self.usernames.append(user.username!)
                    self.userids.append(object["privatename"] as! String)
                    
                    //self.usernames.append(object["objectId"] as! String)
                    
                    
                    //self.usernames.append(object["objectId"] as! String)
                    
                    self.tableView.reloadData()
                    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.privatecaptionview.backgroundColor = UIColor.clearColor()
        
        //self.tableView.backgroundView = UIImageView(image: UIImage(named: "thirdtabbar4"))
        
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        backButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 20)!], forState: UIControlState.Normal)
        navigationItem.backBarButtonItem = backButton
        
        
        //self.tableView.backgroundView = UIImageView(image: UIImage(named: "groupbackground"))
        
        //groupsettingsoutlet.layer.cornerRadius = 5
        
        //createoraddoutlet.layer.cornerRadius = 5
        
        self.navigationController?.navigationBar.topItem?.title = "Groups"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        //let lastviewed = PFUser.currentUser()!["lasviewed"] as? String
        
        //lastviewedoutlet.setTitle(lastviewed, forState: .Normal)
        
        refresher = UIRefreshControl()
        
        //refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        
        //refresher.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        
        //vcxself.tableView.addSubview(refresher)
        
        //refresh()
        
    }
    
    override func viewDidAppear(animated: Bool) {
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
        let cell = tableView.dequeueReusableCellWithIdentifier("privatecell", forIndexPath: indexPath) as! UITableViewCell
        
        //cell.textl
        
        cell.textLabel?.text = userids[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.font = UIFont(name: "HelveticaNeue-Light", size: 15.0)
        
        //let followedObjectId = usernames[indexPath.row]
        
        
        
        
        
        
        
        
        return cell
    }
    
    
    
    
    @IBAction func backFromModal1(segue: UIStoryboardSegue) {
        println("and we are back")
        // Switch to the second tab (tabs are numbered 0, 1, 2)
        self.tabBarController?.selectedIndex = 2
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        //let followedObjectId = userids[indexPath.row]
        
        //PFUser.currentUser()["lasprivate"] = userids[indexPath.row] as String
        //userpf["lastviewed"] = userids[indexPath.row] as String
        //currentuser.saveInBackground()
        self.performSegueWithIdentifier("togroupsegue1", sender: self)
        
        
        /*
        var query1 = PFQuery(className: "Categories")
        query1.whereKey("catname", equalTo: userids[indexPath.row])
        query1.findObjectsInBackgroundWithBlock { (catnames, error) -> Void in
        if error == nil {
        for catname in catnames {
        
        catname.incrementKey("viewcount")
        catname.saveInBackground()
        //let currentcount = catname["viewcount"] as! Int
        //catname.setValue(currentcount+1, forKey: "viewcount")
        //catname.saveInBackground()
        if error == nil {
        self.performSegueWithIdentifier("packsegue", sender: self)
        }
        
        }
        }
        }*/
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "togroupsegue1"){
            //let indexPath = self.tableView.indexPathForSelectedRow()
            //let indes = tableView.indexPathForSelectedRow()
            //var lastviewed = userids[indexPath!.row]
            //let destination = segue.destinationViewController as! UINavigationController
            //let targetController = destinationNavigationController.topViewController
            //destination.lastviewed = userids[indexPath!.row]
            
            //var cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            
            //let lastviewed = userids[indexPath!.row]
            //let navVC = segue.destinationViewController as! UINavigationController
            //let detailVC = navVC.topViewController as! PrivateFeedViewController
            //detailVC.lastviewed = lastviewed
            
            
            //println(lastviewed)
            
            let indexPath = self.tableView.indexPathForSelectedRow()
            
            let lastviewed = userids[indexPath!.row]
            //let lastviewed = userids[indexPath!.row]
            let navVC = segue.destinationViewController as! GroupSettingsViewController
            //let detailVC = navVC.topViewController as! PackFeedViewController
            navVC.lastviewed = lastviewed
            
            
        }
    }
}
