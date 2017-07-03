//
//  YourAdviseViewController.swift
//  Finder
//
//  Created by Ivan Khau on 7/9/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class YourAdviseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var privatepublic = ""
    var singlevoteresult1 = [String]()
    var singlevoteresult2 = [String]()
    var doublevoteresult1 = [String]()
    var doublevoteresult2 = [String]()
    var usernames3 = [String]()
    var messages = [String]()
    var usernames = [String]()
    var usernames2 = [String]()
    var imageFiles = [PFFile]()
    var imageFiles2 = [PFFile]()
    var users = [String: String]()
    var which = UITableViewCell()
    
    var feedback: [String]?
    @IBOutlet weak var tableView: UITableView!
    

    //var rowcount = Int()
    

    //@IBOutlet weak var gsdgg: UITableView!


    
    //@IBOutlet weak var vvxcvxcv: UITableViewCell!

    
    @IBAction func deleteaction(sender: AnyObject) {
        /*
        let button = sender as! UIButton
        let view = button.superview!
        let cell = view.superview as! YourAdviseControllerCell
        button.setImage(UIImage(named:"deleted.png"),forState:UIControlState.Normal)
        //cell.deletebuttonoutlet.setImage(UIImage(named:"deleted.png"),forState:UIControlState.Normal)
        tableView.reloadData()*/
    }

    var activityIndicator = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.topItem?.title = "Public"
        //self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 18)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame)
        activityIndicator.backgroundColor = UIColor.clearColor()
        //(white: 1.0, alpha: 0.5)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        /*
        self.navigationController?.navigationBar.topItem?.title = "Your Advise Posts"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 18)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        */
        
        
        tableView.allowsSelection = false
        
        //if privatepublic == "public" {
        self.navigationItem.title = "Posts"
        //} else {
        //    self.navigationItem.title = "Private Posts"
        //}
        
        //if privatepublic == "public" {
            var query = PFQuery(className: "Post")
            query.orderByDescending("createdAt")
            
            query.whereKey("userId", equalTo: PFUser.currentUser()!.objectId!)
            
            //query.whereKey("ViewedUsers", notEqualTo: PFUser.currentUser()!.objectId!)
            
            query.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                
                if error == nil {
                    
                    if let objects = objects  {
                        
                        
                        for object in objects {
                            
                            self.messages.append(object.objectId as String)
                            
                            self.imageFiles.append(object["imageFile1"] as! PFFile)
                            
                            //self.imageFiles2.append(object["imageFile2"] as! PFFile)
                            
                            self.usernames.append(object["message"] as! String)
                            
                            //self.usernames2.append(object["declaration"] as! String)
                            
                            //self.usernames3.append(object["whichbutton"] as! String)
                            
                            //self.feedback.append(object["Comments"] as! [String])
                            
                            
                            
                            //if object.objectForKey("Comments") != nil {
                                
                                
                            //    self.feedback = object.objectForKey("Comments") as! [String]
                                
                            //}
                            
                            //println("\(stringData)")
                            
                            //self.feedback.append(object.objectForKey("Comments") as! NSArray)
                            
                            //self.feedback.addObjectsFromArray(objects["whichbutton"])
                            
                            
                            //if object["Vote1"] != nil {
                            var votes:Int? = object["Vote1"] as? Int
                            //}
                            //if object["Vote2"] != nil {
                            //cell?.catVotesLabel?.text = "\(votes!) votes"
                            var votes2:Int? = object["Vote2"] as? Int
                            //}
                            
                            
                            
                            
                            
                            
                            0
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
                            
                            
                            
                            
                            
                            self.singlevoteresult1.append("\(votes!) (\(vote1percentage)%)" as String)
                            
                            self.singlevoteresult2.append("\(votes2!) (\(vote2percentage)%)" as String)
                            //self.doublevoteresult1.append("\(votes!) (\(vote1percentage)%)" as String)
                            
                           // self.doublevoteresult2.append("\(votes2!) (\(vote2percentage)%)" as String)
                            
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                self.tableView.reloadData()
                                self.activityIndicator.stopAnimating()
                            })
                            
                        }
                        
                    }
                }
                
                
            })
/*
        } else {
            var query = PFQuery(className: "PrivatePost")
            query.orderByDescending("createdAt")
            
            query.whereKey("userId", equalTo: PFUser.currentUser()!.objectId!)
            
            //query.whereKey("ViewedUsers", notEqualTo: PFUser.currentUser()!.objectId!)
            
            query.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                
                if error == nil {
                    
                    if let objects = objects  {
                        
                        
                        for object in objects {
                            
                            self.messages.append(object.objectId as String)
                            
                            self.imageFiles.append(object["imageFile1"] as! PFFile)
                            
                            //self.imageFiles2.append(object["imageFile2"] as! PFFile)
                            
                            self.usernames.append(object["message"] as! String)
                            
                            //self.usernames2.append(object["declaration"] as! String)
                            
                            //self.usernames3.append(object["whichbutton"] as! String)
                            
                            //self.feedback.append(object["Comments"] as! [String])
                            
                            
                            
                            //if object.objectForKey("Comments") != nil {
                                
                                
                               // self.feedback = object.objectForKey("Comments") as! [String]
                                
                           // }
                            
                            //println("\(stringData)")
                            
                            //self.feedback.append(object.objectForKey("Comments") as! NSArray)
                            
                            //self.feedback.addObjectsFromArray(objects["whichbutton"])
                            
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
                            
                            
                            
                            
                            
                            self.singlevoteresult1.append("\(votes!) (\(vote1percentage)%)" as String)
                            
                            self.singlevoteresult2.append("\(votes2!) (\(vote2percentage)%)" as String)
                            //self.doublevoteresult1.append("\(votes!) (\(vote1percentage)%)" as String)
                            
                            //self.doublevoteresult2.append("\(votes2!) (\(vote2percentage)%)" as String)
                            
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                self.tableView.reloadData()
                                self.activityIndicator.stopAnimating()
                            })
                            
                        }
                        
                    }
                }
                
                
            })

        }*/
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showfeedbacksegue"){
            //let indexPath = self.tableView.indexPathForSelectedRow()
            let button = sender as! UIButton
            let view = button.superview!
            let cell = view.superview as! YourAdviseControllerCell
            
            let indexPath = tableView.indexPathForCell(cell)
            
            let row = indexPath?.row

            
            var query = PFQuery(className: "Post")
            //query.whereKey("objectId", equalTo: cell.NewFeedLabel2.text!)
            var messages = query.findObjects()
            let obj = query.getObjectWithId(cell.NewFeedLabel2.text)
            
            //println(query.getFirstObject())
            //cell.NewFeedLabel2.text
            
            
            let navVC = segue.destinationViewController as! advisefeedbackviewcontroller
            
            navVC.feedback = obj
        }
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
        /*if (tableView == self.tableView){
            
            let rowcount = usernames.count
            return rowcount
            
        } else {
            if feedback?.count != nil {
                if let rowcount = feedback?.count{
                    return rowcount}
            } else {
                
            }
        }
        
        
        return 0*/
        return usernames.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        

        let myCell2 = tableView.dequeueReusableCellWithIdentifier("feedcell1", forIndexPath: indexPath) as! YourAdviseControllerCell
        
        imageFiles[indexPath.row].getDataInBackgroundWithBlock { (data, error) -> Void in
        if let downloadedImage = UIImage(data: data!) {
                
                //myCell2.NewFeedImageView.image = downloadedImage
            
                myCell2.NewFeedImageView3.image = downloadedImage
                
            }
            
        }
        
        /*
        imageFiles2[indexPath.row].getDataInBackgroundWithBlock { (data, error) -> Void in
            
            if let downloadedImage2 = UIImage(data: data!) {
                
                //myCell2.NewFeedImageView2.image = downloadedImage2
                
            }
            
        }*/
        //myCell2.declarationoutlet.text = usernames2[indexPath.row]
        //myCell2.useridoutlet.text = usernames3[indexPath.row]
        
        //myCell2.deletedmessage.hidden = true
        
        
        //myCell2.NewFeedLabel1.text = usernames[indexPath.row]
        myCell2.NewFeedLabel3.text = usernames[indexPath.row]
        
        
        //myCell2.feedbacktextview.text = feedback?[indexPath.row] ?? ""
        
        //myCell2.NewFeedImageView3.layer.cornerRadius = 4
        //myCell2.NewFeedImageView3.layer.masksToBounds = true
        
        //myCell2.NewFeedLabel3.layer.cornerRadius = 4
        //myCell2.NewFeedLabel3.layer.masksToBounds = true
        
        
        //myCell2.dafeed.text = feedback![indexPath.row]
        
        
        
        
        
        //myCell2.backdroplabel.layer.masksToBounds = true
        //myCell2.backdroplabel.layer.cornerRadius = 4
        
        
        
        myCell2.NewFeedLabel2.text = messages[indexPath.row]
        
        myCell2.voteResult1Outlet.text = singlevoteresult1[indexPath.row]
        myCell2.voteResult2Outlet.text = singlevoteresult2[indexPath.row]
        //myCell2.dualVoteResult1Outlet.text = doublevoteresult1[indexPath.row]
        //myCell2.dualVoteResult2Outlet.text = doublevoteresult2[indexPath.row]
        
        //if myCell2.declarationoutlet.text == String("single") {
        /*if usernames2[indexPath.row] as String == "single" {
            //myCell2.NewFeedImageView.hidden = true
            myCell2.NewFeedImageView2.hidden = true
            myCell2.NewFeedLabel1.hidden = true
            myCell2.voteResult1Outlet.hidden = false
            myCell2.voteResult2Outlet.hidden = false
            myCell2.greencheckoutlet.hidden = false
            myCell2.redcrossoutlet.hidden = false
            
            myCell2.NewFeedImageView3.hidden = false
            myCell2.NewFeedLabel3.hidden = false
            myCell2.dualVoteResult1Outlet.hidden = true
            myCell2.dualVoteResult2Outlet.hidden = true
            
            //if myCell2.useridoutlet.text == String("onetwo") {
            if usernames3[indexPath.row] as String == "onetwo" {
                myCell2.greencheckoutlet.image = UIImage(named: "greentwo.png")
                myCell2.redcrossoutlet.image = UIImage(named: "redone.png")
            }else{
                myCell2.greencheckoutlet.image = UIImage(named:"greencheck.png")
                myCell2.redcrossoutlet.image = UIImage(named:"redcross.png")
            }
            
        } else {
            myCell2.NewFeedImageView.hidden = false
            myCell2.NewFeedImageView2.hidden = false
            myCell2.NewFeedLabel1.hidden = false
            myCell2.voteResult1Outlet.hidden = true
            myCell2.voteResult2Outlet.hidden = true
            myCell2.greencheckoutlet.hidden = true
            myCell2.redcrossoutlet.hidden = true
            
            myCell2.NewFeedImageView3.hidden = true
            myCell2.NewFeedLabel3.hidden = true
            myCell2.dualVoteResult1Outlet.hidden = false
            myCell2.dualVoteResult2Outlet.hidden = false
        }*/
        
        
        //myCell2.messagebuttonoutlet.layer.cornerRadius = 4
        
        
                
        //myCell2.voteResult2Outlet.layer.cornerRadius = 28
        //myCell2.voteResult1Outlet.layer.cornerRadius = 28
        //myCell2.voteResult2Outlet.layer.masksToBounds = true
        //myCell2.voteResult1Outlet.layer.masksToBounds = true
        
        
        /*
        myCell2.dualVoteResult1Outlet.layer.cornerRadius = 8
        myCell2.dualVoteResult2Outlet.layer.cornerRadius = 8
        myCell2.NewFeedImageView3.layer.cornerRadius = 8
        myCell2.NewFeedImageView2.layer.cornerRadius = 8
        myCell2.NewFeedImageView.layer.cornerRadius = 8
        
        myCell2.NewFeedLabel1.layer.cornerRadius = 4
        myCell2.NewFeedLabel3.layer.cornerRadius = 4
        
        
        myCell2.dualVoteResult1Outlet.layer.masksToBounds = true
        myCell2.dualVoteResult2Outlet.layer.masksToBounds = true
        myCell2.NewFeedImageView3.layer.masksToBounds = true
        myCell2.NewFeedImageView2.layer.masksToBounds = true
        myCell2.NewFeedImageView.layer.masksToBounds = true
        myCell2.NewFeedLabel1.layer.masksToBounds = true
        myCell2.NewFeedLabel3.layer.masksToBounds = true
        */

        
        //myCell2.commenttextview.text = self.feedback![indexPath.row]
        //which = myCell2
        return myCell2
        
            
            
        /*
        } else {
        //let messagecell = tableView.dequeueReusableCellWithIdentifier("messagecell", forIndexPath: indexPath) as! feedbackTableViewCell
            
                let messagecell = tableView.dequeueReusableCellWithIdentifier("messagecell", forIndexPath: indexPath) as! feedbackTableViewCell

            
            //let row = indexPath.row
            
            //messagecell.textLabel!.text = feedback[row] as? String
            
            //var user = feedback[indexPath.row]
            //var username = user.username as String
            
            
            messagecell.textLabel?.text = feedback![indexPath.row]
            

            
            //messagecell.feedbacklabel?.text = self.feedback![indexPath.row]
            
            return messagecell
            //which = messagecell
            
        }*/
        
      
    }
    /*
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let myCell2 = tableView.dequeueReusableCellWithIdentifier("feedcell1", forIndexPath: indexPath) as! YourAdviseControllerCell
        
    }*/
    
    
    
    
    /*func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.bounds.size.height
    }
    */
}