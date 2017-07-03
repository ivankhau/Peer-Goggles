//
//  yourprofile.swift
//  Finder
//
//  Created by Ivan Khau on 9/13/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class yourprofile: UIViewController, UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate {
    var toUser:PFObject!
    var privatepublic = ""
    var singlevoteresult1 = [String]()
    var singlevoteresult2 = [String]()
    //var doublevoteresult1 = [String]()
    //var doublevoteresult2 = [String]()
    //var usernames3 = [String]()
    var messages = [String]()
    var usernames = [String]()
    //var usernames2 = [String]()
    var imageFiles = [PFFile]()
    //var imageFiles2 = [PFFile]()
    //var users = [String: String]()
    var which = UITableViewCell()
    
    var barwidth1 = [CGFloat]()
    var barwidth2 = [CGFloat]()
    var questiontype = [String]()
    var whatalias = [String]()
    
    var followed = "no"
    
    var isFollowing = ""
    var userids = ""
    
    @IBOutlet weak var followingnumber: UILabel!
    
    @IBOutlet weak var aliaslabel: UILabel!
    
    
    @IBAction func editbutton(sender: AnyObject) {
    }
    
    

    var rownumber = Int()

    
    @IBAction func deletebutton(sender: AnyObject) {
        
        let button = sender as! UIButton
        let view = button.superview!
        let cell = view.superview as! yourprofilecell
        
        let indexPath = tableView.indexPathForCell(cell)
        
        let row = indexPath?.row
        
        self.rownumber = row!
        println(rownumber)
        var dualpost = UIActionSheet(title: "Delete this post?", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil)
        dualpost.addButtonWithTitle("Yes")
        
        dualpost.showInView(self.view)
        
        
        
    }
    
    @IBOutlet weak var abouttext: UILabel!
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 1 { // Post One Pic
            
            PFObject(withoutDataWithClassName: "Post", objectId: "\(messages[rownumber])").deleteInBackground()
            
            self.singlevoteresult1.removeAtIndex(rownumber)
            self.singlevoteresult2.removeAtIndex(rownumber)
            self.messages.removeAtIndex(rownumber)
            self.usernames.removeAtIndex(rownumber)
            self.imageFiles.removeAtIndex(rownumber)
            self.barwidth1.removeAtIndex(rownumber)
            self.barwidth2.removeAtIndex(rownumber)
            
            self.tableView.reloadData()
            
            
            
            
            
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    var activityIndicator = UIActivityIndicatorView()
    
    func refresh() {
        
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame)
        activityIndicator.backgroundColor = UIColor.clearColor()
        //(white: 1.0, alpha: 0.5)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        var query = PFQuery(className: "Post")
        
        query.orderByDescending("createdAt")
        
        
        query.whereKey("userId", equalTo: currentuser.objectId)
        
        
        query.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            
            if error == nil {
                
                var postycount = objects.count as Int
                
                self.postcount.text = "\(postycount)" as String
                
                if let objects = objects  {
                    
                    if objects.count == 0 {
                        self.tableView.reloadData()
                        self.activityIndicator.stopAnimating()
                    }
                    
                    for object in objects {
                        
                        self.messages.append(object.objectId as String)
                        
                        self.imageFiles.append(object["imageFile1"] as! PFFile)
                        
                        self.usernames.append(object["message"] as! String)
                        
                        self.whatalias.append(object["alias"] as! String)
                        self.questiontype.append(object["questionType"] as! String)
                        
                        var votes:Int? = object["Vote1"] as? Int
                        
                        var votes2:Int? = object["Vote2"] as? Int

                        var totalvotes:Int? = votes! + votes2!
                        
                        var holdnumb = totalvotes
                        
                        if totalvotes == 0 {
                            totalvotes = 1 as Int
                            votes = 1 as Int
                            votes2 = 1 as Int
                            
                            
                        }
                        
                        
                        var vote1percentage = (votes! * 100) / totalvotes!
                        var vote2percentage = (votes2! * 100) / totalvotes!
                        
                        self.barwidth1.append(CGFloat((votes! * 100) / (votes! + votes2!)))
                        self.barwidth2.append(CGFloat((votes2! * 100) / (votes! + votes2!)))
                        
                        println(self.barwidth1)
                        
                        
                        if votes == 1 && votes2 == 1 as Int {
                            vote1percentage = 50
                            vote2percentage = 50
                        }
                        
                        
                        if vote1percentage + vote2percentage != 100 && totalvotes != 1 {
                            vote2percentage = vote2percentage + 1
                        }
                        
                        
                        
                        if holdnumb == 0 {
                            self.singlevoteresult1.append("0 (\(vote1percentage)%)" as String)
                            
                            self.singlevoteresult2.append("0 (\(vote2percentage)%)" as String)
                        } else {
                        
                        self.singlevoteresult1.append("\(votes!) (\(vote1percentage)%)" as String)
                        
                        self.singlevoteresult2.append("\(votes2!) (\(vote2percentage)%)" as String)
                        }
                        
                        
                        
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.tableView.reloadData()
                            self.activityIndicator.stopAnimating()
                        })
                        
                    }
                    
                }
            }
            
            
        })

    }
    
    
    
    @IBOutlet weak var postslabel: UILabel!
    
    
    
    
    var feedback: [String]?
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var postcount: UILabel!
    
    //var rowcount = Int()
    
    
    //@IBOutlet weak var gsdgg: UITableView!
    
    
    
    //@IBOutlet weak var vvxcvxcv: UITableViewCell!
    
    @IBAction func closeprofile(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {})
        
    }
    
    var refresher: UIRefreshControl!
    @IBOutlet weak var userimage: UIImageView!
    
    
    
    let imageView = UIImageView(image: UIImage(named: "topimage2.png")!)
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        if(yOffset < -self.tableView.frame.size.width/2) {
            var imageFrame = imageView.frame
            imageFrame.origin.y = yOffset
            imageFrame.size.height = -yOffset
            
            imageView.frame = imageFrame
        }
    }
    
    
    
    @IBOutlet weak var followercount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.tableView.delegate = self
        self.tableView.addSubview(imageView)
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.frame = CGRectMake(0, -self.tableView.frame.size.width/2, self.tableView.frame.size.width, self.tableView.frame.size.width/2)
        
        
        if(self.tableView.respondsToSelector(Selector("setLayoutMargins:"))){
            self.tableView.layoutMargins = UIEdgeInsetsZero;
        }
        
        

        
        //getImage("dpSmall",userimage)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let userinfo = appDelegate.userinfo
        //userimage.image = userinfo.objectForKey("image") as? UIImage
        if let pic = userinfo.objectForKey("image") as? PFFile {
            pic.getDataInBackgroundWithBlock({ (data:NSData!, error:NSError!) -> Void in
                if error == nil {
                    self.userimage.image = UIImage(data: data)
                }
            })
        }
        
        
        
        var followercountnum = userinfo.objectForKey("followedby").count
        self.followercount.text = "\(followercountnum)" as String
        var followingcountnum = userinfo.objectForKey("following").count
        self.followingnumber.text = "\(followingcountnum)" as String
        var abouttext: AnyObject! = userinfo.objectForKey("about") as! String
        self.abouttext.text = "'\(abouttext)'"
        
        /*
        var query1 = PFQuery(className: "followers")
        
        //query1.whereKey("follower", equalTo: PFUser.currentUser()!.objectId!)
        query1.whereKey("following", equalTo: currentuser.objectId)
        
        query1.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            
            if let objects = objects {
                self.followercount.text = "\(objects.count)" as String
                
                query1.whereKey("follower", equalTo: PFUser.currentUser()!.objectId!)
                query1.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                    if let objects = objects {
                        
                        if objects.count > 0 {
                            
                            
                            
                            
                        } else {
                            
                            
                            
                        }
                    }
                })
            }
            
            
        })*/
        
        

        
        
        //self.navigationController?.navigationBar.topItem?.title = "Public"
        //self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 18)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        
        /*
        self.navigationController?.navigationBar.topItem?.title = "Your Advise Posts"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 18)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        */
        
        /*
        if let pica = toUser.objectForKey("userimage") as? PFFile {
        pica.getDataInBackgroundWithBlock({ (data:NSData!, error:NSError!) -> Void in
        if error == nil {
        //self.user1pic = UIImage(data: data)
        self.userimage.image = UIImage(data: data)
        }
        })
        }*/
        
        //userimage.layer.borderColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.35).CGColor
        
        userimage.layer.borderColor = UIColor.lightGrayColor().CGColor
        userimage.layer.borderWidth = 1
        userimage.layer.cornerRadius = 38
        userimage.layer.masksToBounds = true
        
        //postslabel.layer.borderColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.35).CGColor
        //postslabel.layer.borderWidth = 1
        //userimage.layer.cornerRadius = 38
        //postslabel.layer.masksToBounds = true
        
        //followbutton.layer.cornerRadius = 4
        //followbutton.layer.masksToBounds = true
        
        
        tableView.allowsSelection = false
        //var title = userinfo.objectForKey("alias") as! String
        //if privatepublic == "public" {
        //self.navigationItem.title = "\(title)"
        self.navigationItem.title = "Profile"
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        //} else {
        //    self.navigationItem.title = "Private Posts"
        //}
        
        //if privatepublic == "public" {
        
        refresh()
        
        
        
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
        
        
        
        let myCell2 = tableView.dequeueReusableCellWithIdentifier("yourprofilecell", forIndexPath: indexPath) as! yourprofilecell  
        
        imageFiles[indexPath.row].getDataInBackgroundWithBlock { (data, error) -> Void in
            if let downloadedImage = UIImage(data: data!) {
                
                
                myCell2.NewFeedImageView3.image = downloadedImage
                
            }
            
        }
        
        

        
        if(myCell2.respondsToSelector(Selector("setLayoutMargins:"))){
            myCell2.layoutMargins = UIEdgeInsetsZero;
        }
        
        
        if questiontype[indexPath.row] == "#WhichOne?" {
            
            
            myCell2.redcrossoutlet.image = UIImage(named:"whiteone.png")
            myCell2.greencheckoutlet.image = UIImage(named:"whitetwo.png")
            
        } else {
            
            
            myCell2.redcrossoutlet.image = UIImage(named:"whitecross.png")
            myCell2.greencheckoutlet.image = UIImage(named:"whitecheck.png")
            
            
        }
        
        myCell2.barback1.layer.cornerRadius = 10
        //myCell2.barback1.layer.borderWidth = 2
        //myCell2.barback1.layer.borderColor = UIColor(red: 222 / 255.0, green: 69 / 255.0, blue: 20 / 255.0, alpha: 1.0).CGColor
        
        if whatalias[indexPath.row] == "Anonymous" {
            myCell2.isanon.text = "Anonymous"
        } else {
            myCell2.isanon.text = "Public"
        }
        
        //myCell2.barfront1.layer.cornerRadius = 10
        
        
        myCell2.barback2.layer.cornerRadius = 10
        //myCell2.barback2.layer.borderWidth = 2
        //myCell2.barback2.layer.borderColor = UIColor(red: 20 / 255.0, green: 173 / 255.0, blue: 222 / 255.0, alpha: 1.0).CGColor
        
        
        myCell2.barfront2.layer.cornerRadius = 10
        
        //var booboo = myCell2.barback1.frame.size.width * barwidth1[indexPath.row]
        
        //myCell2.barfront1.frame.size.width = myCell2.barback1.frame.size.width
        //myCell2.barfront1.addConstraint(NSLayoutConstraint(item: myCell2.barfront1, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: myCell2.barback1.frame.size.width * barwidth1[indexPath.row] * 0.01))
        //myCell2.barfront2.addConstraint(NSLayoutConstraint(item: myCell2.barfront2, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: myCell2.barback2.frame.size.width * barwidth2[indexPath.row] * 0.01))
        
        myCell2.barborder.layer.borderWidth = 1.5
        myCell2.barborder.layer.borderColor = UIColor.grayColor().CGColor
        myCell2.barborder.layer.cornerRadius = 10
        myCell2.barborder.layer.masksToBounds = true
        
        
        
        //myCell2.frontwidthconstraint!.constant = myCell2.barback1.frame.width * barwidth1[indexPath.row] * 0.01
        
        
        
        var poopy = UIScreen.mainScreen().bounds.size.width - 121 - 16 - 8
        
        
        //var poopy = myCell2.bounds.size.width - 121 - 16 - 8 - 14
        //myCell2.frontwidthconstraint!.constant = poopy * barwidth1[indexPath.row] * 0.01
        
        
        if UIScreen.mainScreen().bounds.size.height == 736 {
            myCell2.frontwidthconstraint!.constant = (poopy - 8) * barwidth1[indexPath.row] * 0.01
        } else {
            myCell2.frontwidthconstraint!.constant = poopy * barwidth1[indexPath.row] * 0.01
        }
        
        
        
        myCell2.frontwidthconstraint2!.constant = myCell2.barback2.frame.width * barwidth2[indexPath.row] * 0.01
        
        
        
        myCell2.barfront1.layer.masksToBounds = true
        myCell2.barback1.layer.masksToBounds = true
        
        
        
        
        myCell2.barback2.layer.masksToBounds = true
        myCell2.barfront2.layer.masksToBounds = true
        
        myCell2.NewFeedImageView3.layer.cornerRadius = 4
        myCell2.NewFeedImageView3.layer.masksToBounds = true
        
        
        
        myCell2.NewFeedLabel3.text = usernames[indexPath.row]
        
        
        
        myCell2.NewFeedLabel2.text = messages[indexPath.row]
        
        myCell2.voteResult1Outlet.text = singlevoteresult1[indexPath.row]
        myCell2.voteResult2Outlet.text = singlevoteresult2[indexPath.row]
        
        //blurEffectView.frame = myCell2.barback1.bounds
        //myCell2.barback1.addSubview(self.blurEffectView)
        
        
        
        return myCell2
        
        
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let userinfo = appDelegate.userinfo
        
        var aliastext = userinfo.objectForKey("alias") as! String
        if userinfo.objectForKey("alias") != nil {
            //aliastoutlet.setTitle("Alias: \(aliastext)", forState: .Normal)
            aliaslabel.text = "\(aliastext)"
        }
        
        
    }
    
    

    
}