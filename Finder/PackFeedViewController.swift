//
//  PackFeedViewController.swift
//  Finder
//
//  Created by Ivan Khau on 7/15/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class PackFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate, UIPopoverPresentationControllerDelegate {
    
    
    var xper1 = [String]()
    var xres1 = [String]()
    
    var yper1 = [String]()
    var yres1 = [String]()
    
    
    var singlevoteresult1 = [String]()
    var singlevoteresult2 = [String]()
    var doublevoteresult1 = [String]()
    var doublevoteresult2 = [String]()
    
    var lastviewed = ""
    
    
    var usernames3 = [String]()
    var messages = [String]()
    var usernames = [String]()
    var usernames2 = [String]()
    var imageFiles = [PFFile]()
    var imageFiles2 = [PFFile]()
    var users = [String: String]()
    
    @IBOutlet weak var tableView: UITableView!
    
        
    
    @IBAction func dualpostbutton(sender: AnyObject) {
        
        var dualpost = UIActionSheet(title: "How Many Pictures?", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil)
        dualpost.addButtonWithTitle("One")
        dualpost.addButtonWithTitle("Two")
        dualpost.showInView(self.view)
    }
    
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 1 { // Post One Pic
            
            self.performSegueWithIdentifier("packpostimage1segue", sender: self)
            
            
            
        } else if buttonIndex == 2 { // Post 2 Pic
            
            self.performSegueWithIdentifier("packpostimage2segue", sender: self)
            
        }
    }
    
    
    @IBOutlet weak var testy: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(lastviewed)
        
        self.view.layoutMargins = UIEdgeInsetsZero
        
        
        testy.frame.size.height = 0
        //testy.hidden = true
        //testy.frame.size.height = 0
        //self.navigationController.navig
        self.navigationController!.navigationBar.topItem!.title = lastviewed
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 16)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        //self.testy.hidden = true
        
        
        //tableView.allowsSelection = false
        //NewFeedControllerCell.selectionStyle = UITableViewCellSelectionStyleNone
        
        //UIImage(named: "write-simple-7.png")
        //var query = PFUser.query()
        
        //query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            
            
            
            
            var query = PFQuery(className: "Post")
            
            //query.limit = 1
            
            query.orderByDescending("createdAt")
            
            //query.whereKey("userId", equalTo: followedUser)
            
            query.whereKey("userId", notEqualTo: PFUser.currentUser()!.objectId!)
            
            query.whereKey("ViewedUsers", notEqualTo: PFUser.currentUser()!.objectId!)
            
            //query.whereKey("inappropriatePost", lessThan: 3)
            
            //query.whereKey("lamePost", lessThan: 5)
            
            query.whereKey("Reportcount", lessThan: 8)
            
            query.whereKey("postcategory", equalTo: self.lastviewed)
            
            query.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                
                if let objects = objects {
                    
                    if query.countObjects() as Int == 0 {
                        
                        //var vc = self.storyboard?.instantiateViewControllerWithIdentifier("testt") as! testy
                        //self.presentViewController(vc, animated: true, completion: nil)
                        //self.testy.frame.size.height = 1000
                        
                        var screenRect:CGRect = UIScreen.mainScreen().bounds
                        var screenWidth:CGFloat = screenRect.size.width
                        var screenHeight:CGFloat = screenRect.size.height
                        
                        self.testy.hidden = false
                        self.testy.frame.size.height = self.view.frame.height
                        
                        
                        
                        
                    } else {
                        
                        self.testy.hidden = true
                        self.testy.frame.size.height = 0
                        self.tableView.allowsSelection = false
                        
                        
                        for object in objects {
                            
                            self.messages.append(object.objectId as String)
                            
                            self.imageFiles.append(object["imageFile1"] as! PFFile)
                            
                            self.imageFiles2.append(object["imageFile2"] as! PFFile)
                            
                            self.usernames.append(object["message"] as! String)
                            
                            self.usernames2.append(object["declaration"] as! String)
                            
                            self.usernames3.append(object["whichbutton"] as! String)
                            
                            //self.actualID1.append(object["userId"] as! String)
                            
                            
                            var votes:Int? = object["Vote1"] as? Int
                            
                            //cell?.catVotesLabel?.text = "\(votes!) votes"
                            var votes2:Int? = object["Vote2"] as? Int
                            
                            var totalvotes:Int? = votes! + votes2!
                            
                            if totalvotes == 0 {
                                totalvotes = 1 as Int
                                votes = 1 as Int
                                votes2 = 1 as Int
                                
                                
                            }
                            
                            
                            var vote1percentage = (votes! * 100) / totalvotes!
                            var vote2percentage = (votes2! * 100) / totalvotes!
                            
                            if votes == 1 && votes2 == 1 as Int {
                                vote1percentage = 50
                                vote2percentage = 50
                            }
                            
                            
                            if vote1percentage + vote2percentage != 100 && totalvotes != 1 {
                                vote2percentage = vote2percentage + 1
                            }
                            
                            
                            
                            //if totalvotes == 1 {
                            //    vote1percentage = ""
                            //    vote2percentage = ""
                            //}
                            
                            
                            
                            
                            
                            
                            if votes != nil {
                                
                                
                                
                                
                                
                                self.xres1.append("\(votes!)" as String)
                                self.xper1.append("\(vote1percentage)%" as String)
                                
                                self.doublevoteresult1.append("Votes: \(votes!)\n\(vote1percentage)%" as String)
                                
                                
                                
                                
                            } else {
                                self.singlevoteresult1.append("0" as String)
                                self.doublevoteresult1.append("Votes: 0" as String)
                                
                            }
                            
                            if votes2 != nil {
                                
                                
                                
                                
                                self.yres1.append("\(votes2!)" as String)
                                self.yper1.append("\(vote2percentage)%" as String)
                                
                                
                                
                                self.doublevoteresult2.append("Votes: \(votes2!)\n\(vote2percentage)%" as String)
                                
                                
                                
                                
                            } else {
                                self.singlevoteresult2.append("0" as String)
                                self.doublevoteresult2.append("Votes: 0" as String)
                                
                                
                                
                            }

                            
                            self.tableView.reloadData()
                        }
                    }
                    
                }
                
                
            })
            //}
            
            //}
            
            //}
            
        //})
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
   
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return usernames.count
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath)
    {
        
        // Remove seperator inset
        if cell.respondsToSelector("setSeparatorInset:") {
            cell.separatorInset = UIEdgeInsetsZero
        }
        
        // Prevent the cell from inheriting the Table View's margin settings
        if cell.respondsToSelector("setPreservesSuperviewLayoutMargins:") {
            cell.preservesSuperviewLayoutMargins = false
        }
        
        // Explictly set your cell's layout margins
        if cell.respondsToSelector("setLayoutMargins:") {
            cell.layoutMargins = UIEdgeInsetsZero
        }
        
        
        //cell.separatorInset = UIEdgeInsetsZero
        //cell.preservesSuperviewLayoutMargins = false
        //cell.layoutMargins = UIEdgeInsetsZero
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell2 = tableView.dequeueReusableCellWithIdentifier("packcell", forIndexPath: indexPath) as! PackFeedControllerCell
        
        imageFiles[indexPath.row].getDataInBackgroundWithBlock { (data, error) -> Void in
            
            if let downloadedImage = UIImage(data: data!) {
                
                myCell2.NewFeedImageView.image = downloadedImage
                myCell2.NewFeedImageView3.image = downloadedImage
                
            }
            
        }
        
        imageFiles2[indexPath.row].getDataInBackgroundWithBlock { (data, error) -> Void in
            
            if let downloadedImage2 = UIImage(data: data!) {
                
                myCell2.NewFeedImageView2.image = downloadedImage2
                
            }
            
        }
        
        myCell2.xperc1.text = xper1[indexPath.row]
        myCell2.xresult1.text = xres1[indexPath.row]
        myCell2.yperc1.text = yper1[indexPath.row]
        myCell2.yresult1.text = yres1[indexPath.row]
        
        if UIScreen.mainScreen().bounds.size.height == 568.0 {
            
            myCell2.xperc1.font = UIFont(name: "HelveticaNeue-Light", size: 12)
            myCell2.xresult1.font = UIFont(name: "HelveticaNeue-CondensedExtraBold", size: 16)
            
            myCell2.yperc1.font = UIFont(name: "HelveticaNeue-Light", size: 12)
            myCell2.yresult1.font = UIFont(name: "HelveticaNeue-CondensedExtraBold", size: 16)
            
        }
        
        if UIScreen.mainScreen().bounds.size.height == 736.0 {
            
            myCell2.xperc1.font = UIFont(name: "HelveticaNeue-Light", size: 18)
            myCell2.xresult1.font = UIFont(name: "HelveticaNeue-CondensedExtraBold", size: 33)
            
            myCell2.yperc1.font = UIFont(name: "HelveticaNeue-Light", size: 18)
            myCell2.yresult1.font = UIFont(name: "HelveticaNeue-CondensedExtraBold", size: 33)
            
        }
        
        myCell2.flagpromptoutlet.hidden = true
        myCell2.flagpromptoutlet.enabled = false
        
        //myCell2.actualID.text = actualID1[indexPath.row]
        
        myCell2.useridoutlet.text = usernames3[indexPath.row]
        myCell2.NewFeedLabel1.text = usernames[indexPath.row]
        myCell2.NewFeedLabel3.text = usernames[indexPath.row]
        myCell2.voteResult1Outlet.text = ""
        myCell2.voteResult2Outlet.text = ""
        myCell2.dualVoteResult1Outlet.text = doublevoteresult1[indexPath.row]
        myCell2.dualVoteResult2Outlet.text = doublevoteresult2[indexPath.row]
        myCell2.declarationoutlet.text = usernames2[indexPath.row]
        myCell2.NewFeedLabel2.text = messages[indexPath.row]
        myCell2.voteResult1Outlet.hidden = true
        myCell2.voteResult2Outlet.hidden = true
        myCell2.dualVoteResult1Outlet.hidden = true
        myCell2.dualVoteResult2Outlet.hidden = true
        myCell2.nextpostbuttonoutlet.enabled = false
        
        if myCell2.declarationoutlet.text != String("double") {
            myCell2.NewFeedImageView.hidden = true
            myCell2.NewFeedImageView2.hidden = true
            myCell2.votebutton1outlet.enabled = false
            myCell2.votebutton2outlet.enabled = false
            myCell2.NewFeedLabel1.hidden = true
            
        } else {
            
            myCell2.NewFeedImageView.hidden = false
            myCell2.NewFeedImageView2.hidden = false
            myCell2.votebutton1outlet.enabled = true
            myCell2.votebutton2outlet.enabled = true
            myCell2.NewFeedLabel1.hidden = false
            
        }
        
        if myCell2.declarationoutlet.text != String("single") {
            myCell2.NewFeedImageView3.hidden = true
            myCell2.nobuttonoutlet.enabled = false
            myCell2.yesbuttonoutlet.enabled = false
            myCell2.nobuttonoutlet.hidden = true
            myCell2.yesbuttonoutlet.hidden = true
            myCell2.NewFeedLabel3.hidden = true
            
        } else {
            myCell2.NewFeedImageView3.hidden = false
            myCell2.nobuttonoutlet.enabled = true
            myCell2.yesbuttonoutlet.enabled = true
            myCell2.nobuttonoutlet.hidden = false
            myCell2.yesbuttonoutlet.hidden = false
            myCell2.NewFeedLabel3.hidden = false
            
        }
        
        if myCell2.useridoutlet.text == String("onetwo") {
            myCell2.yesbuttonoutlet.setImage(UIImage(named:"greentwo.png"),forState:UIControlState.Normal)
            myCell2.nobuttonoutlet.setImage(UIImage(named:"redone.png"),forState:UIControlState.Normal)
        }else{
            myCell2.yesbuttonoutlet.setImage(UIImage(named:"greencheck.png"),forState:UIControlState.Normal)
            myCell2.nobuttonoutlet.setImage(UIImage(named:"redcross.png"),forState:UIControlState.Normal)
            
        }
        
        //PENIS
        //PENIS
        /*
        var count = currentuser.valueForKey("fbfriendcount") as! Int
        if count < 50 {
        myCell2.votebutton1outlet.enabled = false
        myCell2.votebutton2outlet.enabled = false
        myCell2.yesbuttonoutlet.enabled = false
        myCell2.nobuttonoutlet.enabled = false
        myCell2.flagpromptoutlet.enabled = false
        myCell2.flagbuttonoutlet.enabled = false
        postbuttonoutlet.enabled = false
        
        self.displayAlert("Could Not Verify Identity", message: "Your Facebook account did not pass our screening process. For the safety of users, functionality has been disabled.")
        }else{
        //tableView.hidden = false
        }
        
        //PENIS
        //PENIS
        */
        return myCell2
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.bounds.size.height
    }
    

    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func flaggednextpostbutton(sender: AnyObject) {
        
        let button = sender as! UIButton
        let view = button.superview!
        let cell = view.superview as! PackFeedControllerCell
        
        let indexPath = tableView.indexPathForCell(cell)
        
        let row = indexPath?.row
        
        if row!+1 == tableView.numberOfRowsInSection(indexPath!.section){
            
            //PFQuery(className: "Post").getObjectWithId(messages[indexPath!.row]).saveInBackground()
            //self.performSegueWithIdentifier("packfeedrefreshsegue", sender: self)
            self.testy.hidden = false
            self.testy.frame.size.height = self.view.frame.height
            tableView.setContentOffset(CGPointZero, animated:true)
            
            
            
        }
        else{
            tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: row!+1, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
            
        }
        
    }
    
    
    @IBAction func packnextpostbutton(sender: AnyObject) {
        
        let button = sender as! UIButton
        let view = button.superview!
        let cell = view.superview as! PackFeedControllerCell
        
        let indexPath = tableView.indexPathForCell(cell)
        
        let row = indexPath?.row
        
        if row!+1 == tableView.numberOfRowsInSection(indexPath!.section){
            
            //PFQuery(className: "Post").getObjectWithId(messages[indexPath!.row]).saveInBackground()
            //self.performSegueWithIdentifier("packfeedrefreshsegue", sender: self)
            self.testy.hidden = false
            self.testy.frame.size.height = self.view.frame.height
            tableView.setContentOffset(CGPointZero, animated:true)
            
            
            
        }
        else{
            tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: row!+1, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
            
        }

        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "packpostimage1segue"){
            let indexPath = self.tableView.indexPathForSelectedRow()

            let lastviewed1 = lastviewed

            let navVC = segue.destinationViewController as! PackSinglePostViewController
            navVC.lastviewed1 = lastviewed1
            
            
            println(lastviewed)
            
            
        }
        
        if(segue.identifier == "packpostimage2segue"){
            let indexPath = self.tableView.indexPathForSelectedRow()
            //let indes = tableView.indexPathForSelectedRow()
            //var lastviewed = userids[indexPath!.row]
            //let destination = segue.destinationViewController as! UINavigationController
            //let targetController = destinationNavigationController.topViewController
            //destination.lastviewed = userids[indexPath!.row]
            
            //var cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            let lastviewed1 = lastviewed
            let navVC = segue.destinationViewController as! PackDoublePostViewController
            navVC.lastviewed1 = lastviewed1
            
            
            println(lastviewed)
            
            
        }
        
        if(segue.identifier == "packfeedrefreshsegue"){
            let indexPath = self.tableView.indexPathForSelectedRow()
            //let indes = tableView.indexPathForSelectedRow()
            //var lastviewed = userids[indexPath!.row]
            //let destination = segue.destinationViewController as! UINavigationController
            //let targetController = destinationNavigationController.topViewController
            //destination.lastviewed = userids[indexPath!.row]
            
            //var cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            
            var lastviewed1 = lastviewed
            let navVC = segue.destinationViewController as! UINavigationController
            let detailVC = navVC.topViewController as! PackFeedViewController
            detailVC.lastviewed = lastviewed1
            
            
            println(lastviewed)
            
            
        }

        
        

    }

    
    
}
