//
//  NewFeedViewController.swift
//  Finder
//
//  Created by Ivan Khau on 7/6/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit


class NewFeedViewController: UIViewController, UITableViewDelegate, UIActionSheetDelegate {
    
    //@IBOutlet weak var topvoteoutlet: UIButton!
    
    
    @IBOutlet weak var messageview: UIView!
    
    
    
    
    
    
    @IBOutlet weak var topview: UIView!
    

    var lastviewed = ""

    @IBOutlet weak var refetch: UIButton!
    
    
    @IBOutlet weak var catlabel: UILabel!
    
    
    //@IBOutlet weak var refreshbuttonoutlet: UIBarButtonItem!
    
    //@IBOutlet weak var feedcelloutlet: NewFeedControllerCell!
    
    //@IBAction func testtttyyy(sender: AnyObject) {
        
    //    println("testyyyyy")
        
    //}
    
    

    
    var xper1 = [String]()
    var xres1 = [String]()
    
    var yper1 = [String]()
    var yres1 = [String]()
    
    
    
    
    @IBOutlet weak var postbuttonoutlet: UIBarButtonItem!
    var singlevoteresult1 = [String]()
    var singlevoteresult2 = [String]()
    var doublevoteresult1 = [String]()
    var doublevoteresult2 = [String]()
    
    var activityIndicator = UIActivityIndicatorView()
    
    
    
    
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
            
            self.performSegueWithIdentifier("postimage1segue", sender: self)
            
            
            
        } else if buttonIndex == 2 { // Post 2 Pic
            
            self.performSegueWithIdentifier("postimage2segue", sender: self)
            
        }
    }
    
    
    
    
    
    
    
    /*
    func postpic1(sender:UIButton) {
        self.performSegueWithIdentifier("postimage1segue", sender: self)
    }
    
    func postpic2 (sender:UIButton) {
        self.performSegueWithIdentifier("postimage2segue", sender: self)
    }
    */
    
    
    @IBAction func flaggednextpostbutton(sender: AnyObject) {
        let button = sender as! UIButton
        let view = button.superview!
        let cell = view.superview as! NewFeedControllerCell
        
        let indexPath = tableView.indexPathForCell(cell)
        
        let row = indexPath?.row
        
        if row!+1 == tableView.numberOfRowsInSection(indexPath!.section){
            
//self.testy.hidden = false
            //self.testy.frame.size.height = self.view.frame.height
            //tableView.setContentOffset(CGPointZero, animated:true)
            //refreshbuttonoutlet.enabled = true
            
            var offset = CGPointMake(0, tableView.contentSize.height -     tableView.frame.size.height + 20)
            tableView.setContentOffset(offset, animated:true)
        
            
            
        }
        else{
            tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: row!+1, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
            
        }
        
        
        
        
    }
    
    
    
    
    @IBAction func scrolltonextbutton(sender: AnyObject) {
        
        let button = sender as! UIButton
        let view = button.superview!
        let cell = view.superview as! NewFeedControllerCell
        
        let indexPath = tableView.indexPathForCell(cell)
        
        let row = indexPath?.row
        
        
        
        if row!+1 == tableView.numberOfRowsInSection(indexPath!.section){
            
        //PFQuery(className: "Post").getObjectWithId(messages[indexPath!.row]).saveInBackground()
            //self.performSegueWithIdentifier("nomorerefreshsegue", sender: self)
            
            //self.testy.hidden = false
            //self.testy.frame.size.height = self.view.frame.height
            //tableView.setContentOffset(CGPointZero, animated:true)
            //refreshbuttonoutlet.enabled = true
            
            var offset = CGPointMake(0, tableView.contentSize.height -     tableView.frame.size.height)
            tableView.setContentOffset(offset, animated:true)
            
           
            //self.navigationController!.navigationBar.frame.size.height
            
            
            
            
            
            /*
            
            var screenRect:CGRect = UIScreen.mainScreen().bounds
            var screenWidth:CGFloat = screenRect.size.width
            var screenHeight:CGFloat = screenRect.size.height
            
            */
            



            
        
        
        }
        else{
            
            
            let seconds = 1.0
            let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            //dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                
                tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: row!+1, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
                
                // here code perfomed with delay
                
            //})
            
            
            //self.userids.removeAll(keepCapacity: true)
            //self.imageFiles.removeAtIndex(row!)
            //self.imageFiles2.removeAtIndex(row!)
            
            //tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: row!+1, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
            
        }
    }
    
    

    
    //var poopy = testy
    
    

    @IBOutlet weak var testy: UIView!
    

    @IBAction func refetchaction(sender: AnyObject) {
        self.performSegueWithIdentifier("refetchsegue", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        
        let seconds = 1.0
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        catlabel.text = lastviewed
        
        if lastviewed == "" {
            let lastviewed = "Peer Goggles"
        }
        
        catlabel.text = lastviewed
        catlabel.hidden = true
        
        //catlabel.text = lastviewed
        
        //refetch.layer.cornerRadius = self.refetch.frame.size.height / 2
        

        
        tableView.frame.size.height = UIScreen.mainScreen().bounds.size.height
        
        tableView.rowHeight = UIScreen.mainScreen().bounds.size.height
        
        topview.frame.size.height = UIScreen.mainScreen().bounds.size.height
        
        super.viewDidLoad()
        
        
        
        
        self.testy.frame.size.height = UIScreen.mainScreen().bounds.size.height
        
        
        //refreshbuttonoutlet.enabled = false
        
        
        self.view.layoutMargins = UIEdgeInsetsZero
        
        
        
        
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame)
        activityIndicator.backgroundColor = UIColor.clearColor()
        //(white: 1.0, alpha: 0.5)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        //UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        //testy.frame.size.height = 0
        if lastviewed == "" {
        self.navigationController?.navigationBar.topItem?.title = "Peer Goggles"
        } else {
        self.navigationController?.navigationBar.topItem?.title = "\(lastviewed)"
        }
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        
        //let button = sender as! UIButton
        //let view = button.superview!
        //let cell = self.superview as! NewFeedControllerCell
        //let indexPath = tableView.indexPathForCell(cell)
        //let row = indexPath?.row
        
        //if row == nil {
        
        //    self.testy.hidden = false
        //    testy.frame.size.height = testy.frame.size.height

            
        //} else {
        
                //}

        

        
        
        
        
        
        
        //NewFeedControllerCell.selectionStyle = UITableViewCellSelectionStyleNone
        
        //UIImage(named: "write-simple-7.png")
        //var query = PFUser.query()
        
        //query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                        
            
            
            // TRITONS TRITONS TRITONS
            // TRITONS TRITONS TRITONS
            // TRITONS TRITONS TRITONS
            
            //var quero = PFQuery(className: "Post")
            //var limitlocation = 1 as Double
            
            //if let usergeo = currentuser.objectForKey("location") as? PFGeoPoint {
            //    query.whereKey("location", nearGeoPoint: usergeo, withinKilometers: limitlocation)
            //}
            
            // TRITONS TRITONS TRITONS
            // TRITONS TRITONS TRITONS
            // TRITONS TRITONS TRITONS

            
            
            var query = PFQuery(className: "Post")
            
            //query.limit = 1
            
            
            
            
            
            // TRITONS TRITONS TRITONS
            // TRITONS TRITONS TRITONS
            // TRITONS TRITONS TRITONS
            
            //query.whereKey("objectId", doesNotMatchKey: "objectId", inQuery: quero)
            
            // TRITONS TRITONS TRITONS
            // TRITONS TRITONS TRITONS
            // TRITONS TRITONS TRITONS
            
            
            
            
            
            
            
            
            
            query.orderByDescending("createdAt")
            
            //query.whereKey("userId", equalTo: followedUser)
        
            if lastviewed == "" || lastviewed == "Peer Goggles" {
                if PFUser.currentUser()["gender"] as! Int == 1 {
                query.whereKey("postcategory", notEqualTo: "Her Eyes Only")
                }else{
                query.whereKey("postcategory", notEqualTo: "His Eyes Only")
                }
            
        
            } else {
            query.whereKey("postcategory", equalTo: "\(lastviewed)")
            }
        
        
        
        
    
            query.whereKey("userId", notEqualTo: PFUser.currentUser()!.objectId!)
            
            query.whereKey("ViewedUsers", notEqualTo: PFUser.currentUser()!.objectId!)
        
            if lastviewed == "" || lastviewed == "Peer Goggles"{
            query.whereKey("posttomain", notEqualTo: "no")
             }
        
            //query.whereKey("inappropriatePost", lessThan: 3)
            
            //query.whereKey("lamePost", lessThan: 5)
            
            query.whereKey("Reportcount", lessThan: 8)
            
            
            //var limitlocation = -1000 as Double
            
            //if let usergeo = currentuser.objectForKey("location") as? PFGeoPoint {
            //    query.whereKey("location", nearGeoPoint: usergeo, withinKilometers: limitlocation)
            //}
            
            //query.whereKey
            
            
            query.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                
                if let objects = objects {
                    
                    if query.countObjects() as Int == 0 {
                        
                        
                        
                        //self.refreshbuttonoutlet.enabled = true
                        
                        //var vc = self.storyboard?.instantiateViewControllerWithIdentifier("testt") as! testy
                        //self.presentViewController(vc, animated: true, completion: nil)
                        //self.testy.frame.size.height = 1000

                        
                        //self.testy.hidden = false
                        //self.testy.frame.size.height = self.view.frame.height
                        
                        
                        
                        //self.testy.hidden = false
                        //self.testy.frame.size.height = self.testy.frame.height
                        
                        self.activityIndicator.stopAnimating()
                        
                        //UIApplication.sharedApplication().endIgnoringInteractionEvents()
                        
                        var offset1 = CGPointMake(0, self.tableView.contentSize.height -     self.tableView.frame.size.height)
                        self.tableView.setContentOffset(offset1, animated:true)
                        
                        
                        self.refetch.layer.cornerRadius = self.refetch.frame.size.height / 2
                        
                        
                        
                        
                    } else {
                        
                        //self.testy.hidden = true
                        //self.testy.frame.size.height = 0
                        self.tableView.allowsSelection = false
                        self.refetch.layer.cornerRadius = self.refetch.frame.size.height / 2

                        
                        
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
                        
                            
                            
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.tableView.reloadData()
                            
                            
                            self.activityIndicator.stopAnimating()
                            //tableView.contentSize.height -     tableView.frame.size.height + 20
                            var offset = CGPointMake(0, self.topview.frame.size.height)
                            self.tableView.setContentOffset(offset, animated:true)
                        })
                        
                        
                        //dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                            
                            
                            
                            // here code perfomed with delay
                            

                        
                        //})
                        //UIApplication.sharedApplication().endIgnoringInteractionEvents()

                        }
                    }
                    
                }
                
                
            })
            //}
            
            //}
            
            //}
            
        //})
        
        //self.activityIndicator.stopAnimating()
        
        //UIApplication.sharedApplication().endIgnoringInteractionEvents()
        


        
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
    
    
    /*
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
        
    }*/


    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        let myCell2 = tableView.dequeueReusableCellWithIdentifier("feedcell", forIndexPath: indexPath) as! NewFeedControllerCell
        
        myCell2.flagbuttonoutlet.hidden = false
        myCell2.declarationoutlet.text = usernames2[indexPath.row]
        myCell2.useridoutlet.text = usernames3[indexPath.row]
        
        tableView.separatorInset = UIEdgeInsetsZero
        myCell2.messageview.hidden = true
        
        
        
        
        
            tableView.layoutMargins = UIEdgeInsetsZero
        
        
        
            myCell2.layoutMargins = UIEdgeInsetsZero
        
        
        imageFiles[indexPath.row].getDataInBackgroundWithBlock { (data, error) -> Void in
            
            if let downloadedImage = UIImage(data: data!) {
                
                myCell2.NewFeedImageView.layer.masksToBounds = true
                
                myCell2.NewFeedImageView3.layer.masksToBounds = true
                
                myCell2.NewFeedImageView.layer.cornerRadius = 7
           
                myCell2.NewFeedImageView3.layer.cornerRadius = 7
                
                myCell2.NewFeedImageView.image = downloadedImage
                myCell2.NewFeedImageView3.image = downloadedImage
          
            }
            
        }
        
        imageFiles2[indexPath.row].getDataInBackgroundWithBlock { (data, error) -> Void in
            
            if let downloadedImage2 = UIImage(data: data!) {
                
                
                myCell2.NewFeedImageView2.layer.masksToBounds = true
          
                
           
                myCell2.NewFeedImageView2.layer.cornerRadius = 7
          
                
                myCell2.NewFeedImageView2.image = downloadedImage2
                
            }
            
        }
        
        myCell2.dualVoteResult1Outlet.textColor = UIColor.whiteColor()
        myCell2.dualVoteResult2Outlet.textColor = UIColor.whiteColor()
        
        myCell2.xperc1.text = xper1[indexPath.row]
        myCell2.xresult1.text = xres1[indexPath.row]
        myCell2.yperc1.text = yper1[indexPath.row]
        myCell2.yresult1.text = yres1[indexPath.row]
        
        myCell2.flagpromptoutlet.hidden = true
        myCell2.flagpromptoutlet.enabled = false
        
        myCell2.NewFeedLabel1.text = usernames[indexPath.row]
        myCell2.NewFeedLabel3.text = usernames[indexPath.row]
        
        myCell2.voteResult1Outlet.text = ""
        myCell2.voteResult2Outlet.text = ""
        
        
        myCell2.dualVoteResult1Outlet.text = doublevoteresult1[indexPath.row]
        myCell2.dualVoteResult2Outlet.text = doublevoteresult2[indexPath.row]
        
        myCell2.NewFeedLabel2.text = messages[indexPath.row]
        myCell2.voteResult1Outlet.hidden = true
        myCell2.voteResult2Outlet.hidden = true
        myCell2.dualVoteResult1Outlet.hidden = true
        myCell2.dualVoteResult2Outlet.hidden = true
        myCell2.nextpostbuttonoutlet.enabled = false
        
        myCell2.xperc1.hidden = true
        myCell2.yperc1.hidden = true
        myCell2.xresult1.hidden = true
        myCell2.yresult1.hidden = true
        
        
        
            
        if usernames2[indexPath.row] as String == "single" {
        
        //if myCell2.declarationoutlet.text == String("single") {
            myCell2.NewFeedImageView.hidden = true
            myCell2.NewFeedImageView2.hidden = true
            myCell2.votebutton1outlet.enabled = false
            myCell2.votebutton2outlet.enabled = false
            myCell2.NewFeedLabel1.hidden = true
            
            myCell2.NewFeedImageView3.hidden = false
            myCell2.nobuttonoutlet.enabled = true
            myCell2.yesbuttonoutlet.enabled = true
            myCell2.nobuttonoutlet.hidden = false
            myCell2.yesbuttonoutlet.hidden = false
            myCell2.NewFeedLabel3.hidden = false
            
            myCell2.backtop.hidden = false
            myCell2.backcorner.hidden = false
            myCell2.filter1.hidden = false
            
            //if myCell2.useridoutlet.text == String("onetwo") {
            
            if usernames3[indexPath.row] as String == "onetwo" {
                myCell2.yesbuttonoutlet.setImage(UIImage(named:"greentwo.png"),forState:UIControlState.Normal)
                myCell2.nobuttonoutlet.setImage(UIImage(named:"redone.png"),forState:UIControlState.Normal)
            }else{
                myCell2.yesbuttonoutlet.setImage(UIImage(named:"greencheck.png"),forState:UIControlState.Normal)
                myCell2.nobuttonoutlet.setImage(UIImage(named:"redcross.png"),forState:UIControlState.Normal)
                
            }
        
        
        } else /*if myCell2.declarationoutlet.text == String("double")*/ {
            
            myCell2.NewFeedImageView.hidden = false
            myCell2.NewFeedImageView2.hidden = false
            myCell2.votebutton1outlet.enabled = true
            myCell2.votebutton2outlet.enabled = true
            myCell2.NewFeedLabel1.hidden = false
            
            myCell2.NewFeedImageView3.hidden = true
            myCell2.nobuttonoutlet.enabled = false
            myCell2.yesbuttonoutlet.enabled = false
            myCell2.nobuttonoutlet.hidden = true
            myCell2.yesbuttonoutlet.hidden = true
            myCell2.NewFeedLabel3.hidden = true
            
            myCell2.backtop.hidden = true
            myCell2.backcorner.hidden = true
            myCell2.filter1.hidden = true
            
        }
        
        myCell2.voteResult1Outlet.layer.masksToBounds = true
        myCell2.voteResult2Outlet.layer.masksToBounds = true
        
        myCell2.voteResult1Outlet.layer.cornerRadius = 20
        myCell2.voteResult2Outlet.layer.cornerRadius = 20
        
        myCell2.messagesend.layer.masksToBounds = true
        myCell2.messagesend.layer.cornerRadius = 7
        
        myCell2.messagetext.layer.cornerRadius = 7
        myCell2.openmessageboxoutlet.hidden = false
        
        //myCell2.backtop.layer.masksToBounds = true
        myCell2.backcorner.layer.masksToBounds = true
        
        //myCell2.backtop.layer.cornerRadius = 17
        myCell2.backcorner.layer.cornerRadius = 7
        
        /*
        myCell2.NewFeedImageView.layer.masksToBounds = true
        myCell2.NewFeedImageView2.layer.masksToBounds = true
        myCell2.NewFeedImageView3.layer.masksToBounds = true

        myCell2.NewFeedImageView.layer.cornerRadius = 7
        myCell2.NewFeedImageView2.layer.cornerRadius = 7
        myCell2.NewFeedImageView3.layer.cornerRadius = 7
        */

        myCell2.dualVoteResult1Outlet.layer.masksToBounds = true
        myCell2.dualVoteResult2Outlet.layer.masksToBounds = true

        myCell2.dualVoteResult1Outlet.layer.cornerRadius = 7
        myCell2.dualVoteResult2Outlet.layer.cornerRadius = 7
        
        
        myCell2.filter1.layer.cornerRadius = 7
        
        
        myCell2.filter1.layer.masksToBounds = true
        
        
        myCell2.messagesend.enabled = true
    myCell2.messagesend.setTitle("Send", forState: .Normal)
        
        myCell2.messagesend.backgroundColor = UIColor.blueColor()
        myCell2.closemessageboxoutlet.enabled = true
        myCell2.messagetext.editable = true
        
        myCell2.feedbackdelivered.hidden = true
        
        myCell2.feedbackdelivered.layer.cornerRadius = 7
        
        
        myCell2.feedbackdelivered.layer.masksToBounds = true
        
        myCell2.feedbackdelivered.layer.cornerRadius = 7
        
        
        myCell2.feedbackdelivered.layer.masksToBounds = true
        
        
        myCell2.nobuttonoutlet.userInteractionEnabled = true
        myCell2.yesbuttonoutlet.userInteractionEnabled = true
        myCell2.votebutton1outlet.userInteractionEnabled = true
        myCell2.votebutton2outlet.userInteractionEnabled = true
        

        
        //myCell2.messageview.frame.size.height = UIScreen.mainScreen().bounds.size.height
        // myCell2.messageview.frame.size.width = UIScreen.mainScreen().bounds.size.width
        
        
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
        
        
        
        //myCell2.NewFeedImageView.image = view.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        //myCell2.NewFeedImageView.tintColor = UIColor.blueColor()
        
        //myCell2.NewFeedImageView2.image = view.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        //myCell2.NewFeedImageView2.tintColor = UIColor.blueColor()
        
        //myCell2.NewFeedImageView3.image = view.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        //myCell2.NewFeedImageView3.tintColor = UIColor.blueColor()
        
        
        return myCell2
    }
    /*
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UIScreen.mainScreen().bounds.size.height
    }*/
    
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let myCell2 = tableView.dequeueReusableCellWithIdentifier("feedcell", forIndexPath: indexPath) as! NewFeedControllerCell
        
        
        
        
        
        
        
        
        
        if tableView.respondsToSelector("setSeparatorInset:") {
            tableView.separatorInset = UIEdgeInsetsZero
        }
        
        if tableView.respondsToSelector("setLayoutMargins:"){
            tableView.layoutMargins = UIEdgeInsetsZero
        }
        
        if cell.respondsToSelector("setLayoutMargins:"){
            cell.layoutMargins = UIEdgeInsetsZero
        }
        
        myCell2.openmessageboxoutlet.hidden = false
        
        myCell2.messagesend.enabled = true
        myCell2.messagesend.setTitle("Send", forState: .Normal)
        myCell2.messagesend.backgroundColor = UIColor.blueColor()
        
        myCell2.closemessageboxoutlet.enabled = true
        myCell2.messagetext.editable = true
        
        myCell2.feedbackdelivered.hidden = true
        
        myCell2.dualVoteResult1Outlet.hidden = true
        myCell2.dualVoteResult2Outlet.hidden = true
        
        myCell2.nextpostbuttonoutlet.enabled = false
        
        myCell2.dualVoteResult1Outlet.textColor = UIColor.whiteColor()
        myCell2.dualVoteResult2Outlet.textColor = UIColor.whiteColor()
        
        myCell2.voteResult1Outlet.hidden = true
        myCell2.voteResult2Outlet.hidden = true
        myCell2.xperc1.hidden = true
        myCell2.yperc1.hidden = true
        myCell2.xresult1.hidden = true
        myCell2.yresult1.hidden = true
        
        if usernames3[indexPath.row] as String == "onetwo" {
            myCell2.yesbuttonoutlet.setImage(UIImage(named:"greentwo.png"),forState:UIControlState.Normal)
            myCell2.nobuttonoutlet.setImage(UIImage(named:"redone.png"),forState:UIControlState.Normal)
        }else{
            myCell2.yesbuttonoutlet.setImage(UIImage(named:"greencheck.png"),forState:UIControlState.Normal)
            myCell2.nobuttonoutlet.setImage(UIImage(named:"redcross.png"),forState:UIControlState.Normal)
        }
        
        myCell2.nobuttonoutlet.userInteractionEnabled = true
        myCell2.yesbuttonoutlet.userInteractionEnabled = true
        myCell2.votebutton1outlet.userInteractionEnabled = true
        myCell2.votebutton2outlet.userInteractionEnabled = true




    }
    
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "postimage1segue"){
            let lastviewed1 = lastviewed
            
            let navVC = segue.destinationViewController as! SinglePostViewController
            
            if lastviewed == "" || lastviewed == "Peer Goggles" {
                navVC.lastviewed1 = "Peer Goggles"
            } else {
            
            navVC.lastviewed1 = lastviewed1
            }
        }
        
        if(segue.identifier == "postimage2segue"){
            let lastviewed1 = lastviewed
            let navVC = segue.destinationViewController as! CompareImagePostViewController
            if lastviewed == "" || lastviewed == "Peer Goggles" {
                navVC.lastviewed1 = "Peer Goggles"
            } else {
                
                navVC.lastviewed1 = lastviewed1
            }
            
        }
        if(segue.identifier == "refetchsegue"){
            let indexPath = self.tableView.indexPathForSelectedRow()
            
            

            let barViewControllers = segue.destinationViewController as! UITabBarController
            let nav = barViewControllers.viewControllers![0] as! UINavigationController
            let destinationViewController = nav.topViewController as! NewFeedViewController
            destinationViewController.lastviewed = lastviewed
 
            
            
            
            println(lastviewed)
            
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
