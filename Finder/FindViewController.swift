//
//  FindViewController.swift
//  Finder
//
//  Created by djay mac on 28/01/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class FindViewController: UIViewController, UIActionSheetDelegate, MDCSwipeToChooseDelegate {
    
    @IBOutlet weak var skipbutton: UIButton!
    @IBOutlet weak var barback: UILabel!
    
    @IBOutlet weak var barfront: UILabel!
    
    @IBOutlet weak var barback2: UILabel!
    
    @IBOutlet weak var barfront2: UILabel!
    
    @IBOutlet weak var buttontopconstraint: NSLayoutConstraint!
    var newcat = "false"
    
    var whichsort: String = "Hot"
    
    var frameWidth = 0
    var onePart = 0.0
    var perc1:Double = 0
    var perc2:Double = 0
    var result1 = ""
    var result2 = ""
    var resperc1: String = ""
    var resperc2: String = ""
    
    
    //var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
    
    @IBOutlet weak var usernamelabel: UILabel!
    
    
    var blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))
    
    @IBOutlet weak var categorylabel: UILabel!
    
    @IBOutlet weak var categorylabelview: UIView!


    @IBOutlet weak var flagbutton: UIButton!

    @IBOutlet var mainview: UIView!
    @IBOutlet weak var nobutton: UIButton!
    @IBOutlet weak var dogsitting: UIImageView!
    
    @IBOutlet weak var yesbutton: UIButton!
    @IBOutlet weak var noUsersView: UIView!
    var postsFound:NSMutableArray = []
    var postsArray:NSMutableArray = []
    var frontCardView:CardView?
    var backCardView:CardView?
    var totalUsers:Int!
    var toUser:PFObject!
    var searchRipples:LNBRippleEffect = LNBRippleEffect(frame: CGRectMake(phonewidth/2 - 250, phoneheight/2 - 50, 100, 100))
    @IBOutlet weak var postsFoundlabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    //@IBOutlet weak var resultimage: UIImageView!
    //@IBOutlet weak var resultcaption: UILabel!
    
    @IBOutlet weak var resultlabel1: UILabel!
    
    @IBOutlet weak var resultlabel2: UILabel!
    var user1pic:UIImage!
    
    var lastviewed = ""
    
    @IBOutlet weak var resultsview: UIView!
    
    //@IBOutlet weak var resultborder: UILabel!
    
    var backpico = UIImageView()
    
    
    @IBOutlet weak var barborder: UILabel!
    
    @IBOutlet weak var halfway: UILabel!
    
    @IBOutlet weak var whitecross: UIImageView!
    
    @IBOutlet weak var whitecheck: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        backpico.image = UIImage(named: "holadog")
        self.backpico.alpha = 0.9
        buttontopconstraint.constant = (UIScreen.mainScreen().bounds.height/27) + (UIScreen.mainScreen().bounds.height * 0.65) - 14
        resultblackback.hidden = true
        categorylabelview.hidden = true
        categorylabel.layer.cornerRadius = 2
        categorylabel.layer.borderColor = UIColor.darkGrayColor().CGColor
        categorylabel.layer.borderWidth = 1
        categorylabel.layer.masksToBounds = true
        
        resultsview.layer.cornerRadius = 6
        resultsview.layer.borderWidth = 1.5
        resultsview.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        resultsview.layer.shadowColor = UIColor.blackColor().CGColor
        resultsview.layer.shadowOffset = CGSizeMake(0, 0)
        resultsview.layer.shadowRadius = 3
        resultsview.layer.shadowOpacity = 0.4
        
        nobutton.layer.shadowColor = UIColor.blackColor().CGColor
        nobutton.layer.shadowOffset = CGSizeMake(0, 0)
        nobutton.layer.shadowRadius = 1
        nobutton.layer.shadowOpacity = 0.4
        
        yesbutton.layer.shadowColor = UIColor.blackColor().CGColor
        yesbutton.layer.shadowOffset = CGSizeMake(0, 0)
        yesbutton.layer.shadowRadius = 1
        yesbutton.layer.shadowOpacity = 0.4
        
        
        aliasbutton.layer.cornerRadius = 4
        aliasbutton.layer.borderWidth = 1
        aliasbutton.layer.borderColor = UIColor.grayColor().CGColor

        aliasbutton.layer.masksToBounds = true
        
        skipbutton.layer.cornerRadius = 4
        skipbutton.layer.borderWidth = 1
        skipbutton.layer.borderColor = UIColor.grayColor().CGColor

        skipbutton.layer.masksToBounds = true
        
        /*
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.barfront.frame
        rectShape.position = self.barfront.center
        rectShape.path = UIBezierPath(roundedRect: self.barfront.bounds, byRoundingCorners: .BottomLeft | .TopLeft, cornerRadii: CGSize(width: 13, height: 13)).CGPath
        
        self.barfront.layer.backgroundColor = UIColor.greenColor().CGColor
        //Here I'm masking the textView's layer with rectShape layer
        self.barfront.layer.mask = rectShape
        */
        
        barborder.layer.cornerRadius = 13
        barborder.layer.borderColor = UIColor.grayColor().CGColor
        barborder.layer.borderWidth = 1.5
        barborder.layer.masksToBounds = true

        
        //halfway.layer.cornerRadius = 15
        //halfway.layer.masksToBounds = true

        
        
        barback.layer.cornerRadius = 13
        //barfront.layer.cornerRadius = 10
        barback.layer.masksToBounds = true
        barfront.layer.masksToBounds = true
        
        barback2.layer.cornerRadius = 10
        barfront2.layer.cornerRadius = 10
        barback2.layer.masksToBounds = true
        barfront2.layer.masksToBounds = true
        
        frameWidth = (Int(self.view.frame.width) - 40)
        onePart = Double(frameWidth) / Double(100)
        NSLog("frame Width %i  One Part %d", frameWidth,onePart)
        
        /*resultborder.layer.borderWidth = 2
        resultborder.layer.borderColor = UIColor(red: 196 / 255.0, green: 203 / 255.0, blue: 201 / 255.0, alpha: 1.0).CGColor
        resultborder.layer.cornerRadius = 6
        resultborder.layer.masksToBounds = true
        
        resultimage.layer.cornerRadius = 4
        resultimage.layer.masksToBounds = true*/
        if lastviewed == "" {
            self.navigationController?.navigationBar.topItem?.title = "Peer Goggles"
        } else {
            self.navigationController?.navigationBar.topItem?.title = "\(lastviewed)"
        }
        resultsview.hidden = true
        self.resultsview.alpha = 0
        self.skipbutton.hidden = true
        self.nobutton.hidden = true
        self.yesbutton.hidden = true
        self.likebutton.hidden = true
        self.flagbutton.hidden = true
        self.likebutton.setImage(UIImage(named: "likepost"), forState: UIControlState.Normal)
        self.aliasbutton.hidden = true
        self.usernamelabel.hidden = true
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        
        self.dogsitting.image = UIImage(named:"fetchingposts.png")
        
        self.searchButton.layer.borderColor = UIColor.clearColor().CGColor
        self.searchButton.layer.borderWidth = 2
        

        self.searchButton.layer.backgroundColor = UIColor.grayColor().CGColor
        self.searchButton.setTitle("Fetching..", forState: .Normal)
        
        self.searchButton.hidden = false
        self.searchButton.userInteractionEnabled = false
        
        //searchButton.layer.borderColor = UIColor(red: 18 / 255.0, green: 159 / 255.0, blue: 204 / 255.0, alpha: 1.0).CGColor
        
        searchRipples.center = self.view.center
        searchRipples = LNBRippleEffect(image: UIImage(), frame: searchButton.frame, color: UIColor.clearColor(), target: nil, ID: self)
        searchRipples.setRippleColor(UIColor(red: 196 / 255.0, green: 203 / 255.0, blue: 201 / 255.0, alpha: 1.0))
        searchRipples.setRippleTrailColor(UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0))
        noUsersView.addSubview(searchRipples)
		
        self.findUsers() { array in
		
            self.postsFound.addObjectsFromArray(array as [AnyObject])
            self.postsArray.addObjectsFromArray(array as [AnyObject])

            
            self.totalUsers = self.postsFound.count
            println("Total Users found \(self.postsFound.count)")
            
            if self.postsFound.count > 1 {
                self.toUser = self.postsArray[0] as! PFObject
                self.searchRipples.removeFromSuperview()
                self.noUsersView.hidden = true
                self.frontCardView = self.popUserView(frontCardFrame)
                self.view.addSubview(self.frontCardView!)
                self.frontCardView?.navController = self.navigationController!
                self.frontCardView?.button.addTarget(self, action: "viewUser:", forControlEvents: UIControlEvents.TouchUpInside)
                self.backCardView = self.popUserView(backCardFrame)
                self.view.insertSubview(self.backCardView!, belowSubview: self.frontCardView!)
                
                
                
                self.backpico.frame = CGRectMake(0, 0, self.backCardView!.bounds.width, self.backCardView!.bounds.height)
                self.backCardView!.addSubview(self.backpico)
                
                
                
                
                
                
                
                
                self.searchButton.userInteractionEnabled = false
                self.backCardView?.userInteractionEnabled = false
                self.skipbutton.hidden = false
                self.nobutton.hidden = false
                self.yesbutton.hidden = false
                self.likebutton.hidden = false
                self.flagbutton.hidden = false
                self.view.userInteractionEnabled = true
                
                self.topfilteroutlet.userInteractionEnabled = true
                self.categorylabelview.bringSubviewToFront(self.view)
                
            } else if self.postsFound.count == 1 {
                self.toUser = self.postsArray[0] as! PFObject
                self.searchRipples.removeFromSuperview()
                self.noUsersView.hidden = true
                self.frontCardView = self.popUserView(frontCardFrame)
                self.frontCardView?.button.addTarget(self, action: "viewUser:", forControlEvents: UIControlEvents.TouchUpInside)
                self.view.addSubview(self.frontCardView!)
                self.skipbutton.hidden = false
                self.nobutton.hidden = false
                self.yesbutton.hidden = false
                self.likebutton.hidden = false
                self.flagbutton.hidden = false
                self.searchButton.userInteractionEnabled = false
                self.view.userInteractionEnabled = true
                
                self.topfilteroutlet.userInteractionEnabled = true
                
               self.categorylabelview.bringSubviewToFront(self.view)
                
                   
                
              
                
                
                
            } else if self.postsFound.count == 0 { // add No Users View
                
                
                

                
                
                
                self.postsFoundlabel.text = ""
                self.noUsersView.hidden = false
                self.searchRipples.removeFromSuperview()
				//self.searchButton.hidden = false
                self.skipbutton.hidden = true
                self.nobutton.hidden = true
                self.yesbutton.hidden = true
                self.likebutton.hidden = true
                self.flagbutton.hidden = true
                
                self.searchButton.userInteractionEnabled = true
                
                self.searchButton.layer.borderColor = UIColor(red: 18 / 255.0, green: 159 / 255.0, blue: 204 / 255.0, alpha: 1.0).CGColor
                self.searchButton.layer.backgroundColor = UIColor(red: 20 / 255.0, green: 173 / 255.0, blue: 222 / 255.0, alpha: 1.0).CGColor
                self.searchButton.setTitle("Fetch More!", forState: .Normal)
                //self.searchButton.setImage(UIImage(named:"deadenddog.png"),forState:UIControlState.Normal)
                self.dogsitting.image = UIImage(named:"noposts.png")
                self.view.userInteractionEnabled = true
                
                //self.topfilteroutlet.enabled = true
                //self.topfilteroutlet.hidden = false
                
                self.topfilteroutlet.userInteractionEnabled = true
                self.categorylabelview.bringSubviewToFront(self.view)
            }
            
            
            
            
                //self.categorylabelview.bringSubviewToFront(self.view)
        

            
        }
        

    }
    
    
    

    
    
    func viewUser(sender:UIButton) {
        //self.showuserprofile()
    }
    
    /*
    func showuserprofile() {
        let viewprofilevc = storyb.instantiateViewControllerWithIdentifier("viewprofilevc") as! UserProfileViewController
        viewprofilevc.getUser = self.toUser
        viewprofilevc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewprofilevc, animated: false)
    }*/
    
    
    @IBAction func topfilter(sender: AnyObject) {

        self.postsArray.removeAllObjects()

        self.postsFound.removeAllObjects()

        
        self.frontCardView?.removeFromSuperview()
        
        //self.topfilteroutlet.enabled = false
        
        self.topfilteroutlet.userInteractionEnabled = false
        
        self.backCardView?.removeFromSuperview()
        noUsersView.hidden = false
        
        if topfilteroutlet.selectedSegmentIndex == 0 {
            println("Hot")
            whichsort = "Hot"
            viewDidLoad()
            self.searchButton.userInteractionEnabled = false
            self.view.userInteractionEnabled = false
        }
        
        if topfilteroutlet.selectedSegmentIndex == 1 {
            println("Following")
            whichsort = "Following"
            viewDidLoad()
            self.searchButton.userInteractionEnabled = false
            self.view.userInteractionEnabled = false
        }
        
        
        if topfilteroutlet.selectedSegmentIndex == 2 {
            println("New")
            whichsort = "New"
            viewDidLoad()
            self.searchButton.userInteractionEnabled = false
            self.view.userInteractionEnabled = false
        }
        
        
    }
    
    
    @IBOutlet weak var resultblackback: UIView!
    
    @IBOutlet weak var aliasbutton: UIButton!
    
    @IBOutlet weak var topfilteroutlet: UISegmentedControl!
    
    func findUsers(fn:NSMutableArray -> ()) { // find all the users
        postsFoundlabel.text = "Fetching... "

        self.searchButton.userInteractionEnabled = false
        
        println(whichsort)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let userinfo = appDelegate.userinfo
        
        
        
        //if whichsort != "Following" {
            
            var query = PFQuery(className: "Post")
            
            query.whereKey("userId", notEqualTo: currentuser.objectId)
            //if let viewd = currentuser.objectForKey("viewedUsers") as? NSArray {
            //    query.whereKey("objectId", notContainedIn: viewd as [AnyObject])
            //}
            query.whereKey("ViewedUsers", notEqualTo: currentuser.objectId)
            
            
            if whichsort == "New" {
                query.orderByDescending("createdAt")
            }
            if whichsort == "Hot" {
                
                query.orderByDescending("likecount")
                
                
                
                
                //// Add in for last 2 weeks query
                ////
                ////
                ////
                //let twelveDaysAgo = NSDate().dateByAddingTimeInterval(-777600)
                //query.whereKey("createdAt", greaterThan: twelveDaysAgo)
                
            }
        
        query.whereKey("trashpost", notEqualTo: "true")
        
            if whichsort == "Following" {
                query.whereKey("alias", notEqualTo: "Anonymous")
                
                query.orderByDescending("createdAt")
                
                //query.whereKey("userId", equalTo: userinfo.objectForKey("following"))
                query.whereKey("userId", containedIn: userinfo.objectForKey("following") as! NSArray as [AnyObject])
                
                
            }
        
            
            
            if lastviewed == "" || lastviewed == "Peer Goggles" {
               /* if PFUser.currentUser()["gender"] as! Int == 1 {
                    query.whereKey("postcategory", notEqualTo: "Her Eyes Only")
                }else{
                    query.whereKey("postcategory", notEqualTo: "His Eyes Only")
                }*/
                
                
            } else {
                query.whereKey("postcategory", equalTo: "\(lastviewed)")
                categorylabel.text = "\(lastviewed)"
                categorylabelview.hidden = false
                categorylabelview.bringSubviewToFront(self.view)
                
            }
            
            
            query.limit = 40
            
            
            
            //if let usergeo = currentuser.objectForKey("location") as? PFGeoPoint {
            //    query.whereKey("location", nearGeoPoint: usergeo, withinKilometers: limitlocation)
            //}
            
            //query.whereKey("age", containedIn: ageArray as [AnyObject])
            //query.whereKey("gender", equalTo: interested)
            //query.whereKeyExists("dpLarge")
            query.findObjectsInBackgroundWithBlock { (objects:[AnyObject]!, error:NSError!) -> Void in
                if error == nil {
                    self.postsArray.removeAllObjects()
                    self.postsFound.removeAllObjects()
                    let array:NSMutableArray = NSMutableArray(array: objects)
                    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
                    dispatch_after(time, dispatch_get_main_queue() , { () -> Void in
                        fn(array)
                        //self.searchButton.userInteractionEnabled = true
                    })
                    
                } else {
                    println(error.localizedDescription)
                }
            }
            
        /*
        } else {
            
            var getFollowedUsersQuery = PFQuery(className: "followers")
            
            getFollowedUsersQuery.whereKey("follower", equalTo: PFUser.currentUser()!.objectId!)
            
            getFollowedUsersQuery.findObjectsInBackgroundWithBlock { (objectos, error) -> Void in
                
                if let objectos = objectos {
                    
                    for objecto in objectos {
                        
                        var followedUser = objecto["following"] as! String
                        
                        var query = PFQuery(className: "Post")
                        
                        query.whereKey("userId", notEqualTo: currentuser.objectId)
                        //if let viewd = currentuser.objectForKey("viewedUsers") as? NSArray {
                        //    query.whereKey("objectId", notContainedIn: viewd as [AnyObject])
                        //}
                        query.whereKey("ViewedUsers", notEqualTo: currentuser.objectId)
                        
                        query.whereKey("userId", equalTo: followedUser)
                        query.whereKey("alias", notEqualTo: "Anonymous")
                        
                        query.orderByDescending("createdAt")
                        
                        
                        if self.lastviewed == "" || self.lastviewed == "Peer Goggles" {
                            if PFUser.currentUser()["gender"] as! Int == 1 {
                                query.whereKey("postcategory", notEqualTo: "Her Eyes Only")
                            }else{
                                query.whereKey("postcategory", notEqualTo: "His Eyes Only")
                            }
                            
                            
                        } else {
                            query.whereKey("postcategory", equalTo: "\(self.lastviewed)")
                        }
                        
                        query.findObjectsInBackgroundWithBlock { (objects:[AnyObject]!, error:NSError!) -> Void in
                            if error == nil {
                                self.postsArray.removeAllObjects()
                                self.postsFound.removeAllObjects()
                                
                                
                                let array:NSMutableArray = NSMutableArray(array: objects)
                                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
                                dispatch_after(time, dispatch_get_main_queue() , { () -> Void in
                                    fn(array)
                                })
                                
                            } else {
                                println(error.localizedDescription)
                            }
                        }
                    }
                }}}*/
       // }
    }

    
    
    func viewDidCancelSwipe(view: UIView!) {
        println("Cant Decide?")
    }
    
    
    func view(view: UIView!, shouldBeChosenWithDirection direction: MDCSwipeDirection) -> Bool {
        if direction == MDCSwipeDirection.Left  {
            return true
        } else {
            return true
        }
        
        
    }
    

    
    
    func view(view: UIView!, wasChosenWithDirection direction: MDCSwipeDirection) {
        
        if self.totalUsers > 1 {
            self.postsArray.removeObjectAtIndex(0)
        }
        

        
        var forUser = self.toUser
        
        self.view.userInteractionEnabled = false
        self.resultsview.userInteractionEnabled = true
        
        
        
        if direction == MDCSwipeDirection.Left  {
        //    self.updateMatch(false,forUser:forUser)
            
            if skiptrigger == "false" {
            
            //nobutton.setImage(UIImage(named:"greencheck.png"), forState: UIControlState.Normal)
            if toUser != nil {
            toUser.incrementKey("Vote1")
            toUser.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
            toUser.saveInBackground()
            
            self.view.bringSubviewToFront(resultsview)
            self.view.bringSubviewToFront(resultblackback)
            //resultcaption.text = toUser.objectForKey("message")
 //as? String
            
            var votes:Int? = toUser.objectForKey("Vote1") as? Int
            var votes2:Int? = toUser.objectForKey("Vote2") as? Int
                
            var questiontype = toUser.objectForKey("questionType") as! String
                
                if questiontype == "#WhichOne?" {
                    self.whitecross.image = UIImage(named: "whiteone")
                    self.whitecheck.image = UIImage(named: "whitetwo")
                } else {
                    self.whitecross.image = UIImage(named: "whitecross")
                    self.whitecheck.image = UIImage(named: "whitecheck")
                }
            
            result1 = "\(votes!)" as String
            
            result2 = "\(votes2!)" as String
            let resperc1int = (votes! * 100) / (votes! + votes2!)
            let resperc1 = "\((votes! * 100) / (votes! + votes2!))" as String
            let resperc2 = "\(100 - resperc1int)" as String
            
            resultlabel1.text = "\(votes!) (\(resperc1)%)" as String
            
            resultlabel2.text = "\(votes2!) (\(resperc2)%)" as String
            
            //var perc1 = 0
            //if votes! == 0 && votes2! == 0 {
                
            //}
            
            //resperc1 = "\((votes! * 100) / (votes! + votes2!))%"
            //resperc2 = "\((votes2! * 100) / (votes! + votes2!))%"
            
            perc1 = Double((votes! * 100) / (votes! + votes2!))
            perc2 = Double((votes2! * 100) / (votes! + votes2!))
            //(votes! + votes2!)/2
            println((votes! * 100) / (votes! + votes2!))
            println((votes2! * 100) / (votes! + votes2!))
            
            
            ///frameWidth = (Int(self.resultsview.frame.width) - 40)
            //onePart = Double(frameWidth) / Double(100)
            //NSLog("frame Width %i  One Part %d", frameWidth,onePart)
            
            self.resultsview.backgroundColor = UIColor.whiteColor()
            
            //drawlines(lineNumber:1, percent:perc1, linename:"")
            //drawlines2(lineNumber:2, percent:perc2, linename:"")
            var percent = CGFloat((votes! * 100) / (votes! + votes2!))
            var percent2 = CGFloat((votes2! * 100) / (votes! + votes2!))
            println("\(percent) xxxx")
            self.barfront.frame.size.width = self.barback.frame.size.width * percent * 0.01
            self.barfront.layer.masksToBounds = true
            
            self.barfront2.frame.size.width = self.barback2.frame.size.width * percent2 * 0.01
            self.barfront2.layer.masksToBounds = true
            //self.barfront.layer.frame.size.widthy
            println(resperc1)
            println("\(self.barback.frame.size.width * percent * 0.01) xxx")
            
            if backCardView != nil {
            blurEffectView.frame = self.backCardView!.bounds
                
            //blurEffectView.frame = UIScreen.mainScreen().bounds
                
                
            }
            //self.backCardView!.addSubview(blurEffectView)
            
            
            self.resultblackback.hidden = false
            
            self.resultsview.hidden = false
            
            //self.resultsview.alpha = 1.0
            UIView.animateWithDuration(0.3, animations: {
                self.resultsview.alpha = 1.0
                //self.view.alpha = 0.75
                //self.resultblackback.alpha = 0.6
                
                if self.backCardView != nil {

                self.backCardView!.addSubview(self.blurEffectView)
                    
                    
                    
                    
                    
                }
            })
            /*
            UIView.animateWithDuration(0.5, delay: 0.4,
                options: nil, animations: {
                    self.resultlabel1.center.x += self.resultsview.bounds.width
                }, completion: nil)*/
            /*
            UIView.animateWithDuration(0.5, delay: 0.4,
                options:  .CurveEaseIn, animations: {
                    self.resultlabel1.center.x += self.resultsview.bounds.width
                }, completion: nil)*/
            

            //resultimage.image = toUser.objectForKey("imageFile1")
              //  as? UIImage

                self.isliked = "false"
                self.likebutton.setImage(UIImage(named: "likepost"), forState: UIControlState.Normal)
            let seconds = 1.5
            let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                
                let delay3 = 0.3 * Double(NSEC_PER_SEC)
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay3)), dispatch_get_main_queue(), {
                    self.view.userInteractionEnabled = true
                })
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                UIView.animateWithDuration(0.3, animations: {
                    //self.removeFromParentViewController(self.blurEffectView)
                    //self.view.userInteractionEnabled = true
                    self.backpico.alpha = 0
                    if self.backCardView != nil {
                    self.blurEffectView.alpha = 0
                        let delay2 = 0.3 * Double(NSEC_PER_SEC)
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay2)), dispatch_get_main_queue(), {
                            self.blurEffectView.alpha = 1
                            self.backpico.alpha = 0.90
                            self.blurEffectView.removeFromSuperview()
                            self.backpico.removeFromSuperview()
                            self.backpico.frame = CGRectMake(0, 0, self.backCardView!.bounds.width, self.backCardView!.bounds.height)
                            
                            if self.backCardView != nil && self.postsArray.count != 1 {

                            self.backCardView!.addSubview(self.backpico)
                                
                            }
                            })
                        
                    
                        
                    }
                    self.resultsview.alpha = 0
                    /*self.resultsview.viewWithTag(101)!.removeFromSuperview()
                    self.resultsview.viewWithTag(102)!.removeFromSuperview()
                    self.resultsview.viewWithTag(103)!.removeFromSuperview()
                    self.resultsview.viewWithTag(104)!.removeFromSuperview()
                    self.resultsview.viewWithTag(105)!.removeFromSuperview()
                    self.resultsview.viewWithTag(106)!.removeFromSuperview()*/
                    self.likebutton.enabled = true
                    //self.likebutton.setImage(UIImage(named: "likepost"), forState: UIControlState.Normal)
                    //self.isliked = "false"
                    //self.likebutton.setImage(UIImage(named: "likepost"), forState: UIControlState.Normal)
                    //self.view.alpha = 1
                    //self.resultblackback.alpha = 0
                    self.resultblackback.hidden = true
                    
                })
           //self.resultsview.hidden = true
            
            // here code perfomed with delay
            
            })
            }
                
                
            } else {
                
                self.skiptrigger = "false"
                UIView.animateWithDuration(0.3, animations: {
                    self.backpico.alpha = 0
 
                })
                
                let seconds = 1.5
                let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
                var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                
                let delay3 = 0.3 * Double(NSEC_PER_SEC)
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay3)), dispatch_get_main_queue(), {
                    self.view.userInteractionEnabled = true
                    
                    self.backpico.removeFromSuperview()
                    self.backpico.frame = CGRectMake(0, 0, self.backCardView!.bounds.width, self.backCardView!.bounds.height)
                    
                    if self.backCardView != nil && self.postsArray.count != 1 {
                        
                        self.backCardView!.addSubview(self.backpico)
                        
                    }
                    self.backpico.alpha = 0.9
                    self.resultblackback.hidden = true
                    
                })
                
                
                
                
                
                
            }

            
        } else {
        //    self.updateMatch(true,forUser:forUser)
            
            if toUser != nil {
            toUser.incrementKey("Vote2")
            toUser.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
            toUser.saveInBackground()
            
            self.view.bringSubviewToFront(resultsview)
            self.view.bringSubviewToFront(resultblackback)
            //resultcaption.text = toUser.objectForKey("message")
            //as? String
            
            var votes:Int? = toUser.objectForKey("Vote1") as? Int
            var votes2:Int? = toUser.objectForKey("Vote2") as? Int
            
            result1 = "\(votes!)" as String
            
            result2 = "\(votes2!)" as String
            let resperc1int = (votes! * 100) / (votes! + votes2!)
            let resperc1 = "\((votes! * 100) / (votes! + votes2!))" as String
            let resperc2 = "\(100 - resperc1int)" as String
            
            resultlabel1.text = "\(votes!) (\(resperc1)%)" as String
            
            resultlabel2.text = "\(votes2!) (\(resperc2)%)" as String
            
            //var perc1 = 0
            //if votes! == 0 && votes2! == 0 {
            
            //}
            
            //resperc1 = "\((votes! * 100) / (votes! + votes2!))%"
            //resperc2 = "\((votes2! * 100) / (votes! + votes2!))%"
            
            perc1 = Double((votes! * 100) / (votes! + votes2!))
            perc2 = Double((votes2! * 100) / (votes! + votes2!))
            //(votes! + votes2!)/2
            println((votes! * 100) / (votes! + votes2!))
            println((votes2! * 100) / (votes! + votes2!))
            
            
            ///frameWidth = (Int(self.resultsview.frame.width) - 40)
            //onePart = Double(frameWidth) / Double(100)
            //NSLog("frame Width %i  One Part %d", frameWidth,onePart)
            
            self.resultsview.backgroundColor = UIColor.whiteColor()
            
            //drawlines(lineNumber:1, percent:perc1, linename:"")
            //drawlines2(lineNumber:2, percent:perc2, linename:"")
            var percent = CGFloat((votes! * 100) / (votes! + votes2!))
            var percent2 = CGFloat((votes2! * 100) / (votes! + votes2!))
            println("\(percent) xxxx")
            self.barfront.frame.size.width = self.barback.frame.size.width * percent * 0.01
            self.barfront.layer.masksToBounds = true
            
            self.barfront2.frame.size.width = self.barback2.frame.size.width * percent2 * 0.01
            self.barfront2.layer.masksToBounds = true
            //self.barfront.layer.frame.size.widthy
            println(resperc1)
            println("\(self.barback.frame.size.width * percent * 0.01) xxx")
            
                if backCardView != nil {
                    blurEffectView.frame = self.backCardView!.bounds
                }
                //self.backCardView!.addSubview(blurEffectView)
                
                
                self.resultblackback.hidden = false
                
                self.resultsview.hidden = false
                
                //self.resultsview.alpha = 1.0
                UIView.animateWithDuration(0.3, animations: {
                    self.resultsview.alpha = 1.0
                    //self.view.alpha = 0.75
                    //self.resultblackback.alpha = 0.6
                    
                    if self.backCardView != nil {
                        
                        self.backCardView!.addSubview(self.blurEffectView)
                    }
                })
                /*
                UIView.animateWithDuration(0.5, delay: 0.4,
                options: nil, animations: {
                self.resultlabel1.center.x += self.resultsview.bounds.width
                }, completion: nil)*/
                /*
                UIView.animateWithDuration(0.5, delay: 0.4,
                options:  .CurveEaseIn, animations: {
                self.resultlabel1.center.x += self.resultsview.bounds.width
                }, completion: nil)*/
                
                
                //resultimage.image = toUser.objectForKey("imageFile1")
                //  as? UIImage
                self.isliked = "false"
                self.likebutton.setImage(UIImage(named: "likepost"), forState: UIControlState.Normal)
                
                let seconds = 1.5
                let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
                var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                
                let delay3 = 0.3 * Double(NSEC_PER_SEC)
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay3)), dispatch_get_main_queue(), {
                    self.view.userInteractionEnabled = true
                })
                
                dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                    UIView.animateWithDuration(0.3, animations: {
                        //self.removeFromParentViewController(self.blurEffectView)
                        //self.view.userInteractionEnabled = true
                        
                        if self.backCardView != nil {
                            self.blurEffectView.alpha = 0
                            
                            self.backpico.alpha = 0
                            
                            let delay2 = 0.3 * Double(NSEC_PER_SEC)
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay2)), dispatch_get_main_queue(), {
                                self.blurEffectView.alpha = 1
                                self.blurEffectView.removeFromSuperview()
                                self.backpico.removeFromSuperview()
                                self.backpico.frame = CGRectMake(0, 0, self.backCardView!.bounds.width, self.backCardView!.bounds.height)
                                
                                
                                
                                if self.backCardView != nil && self.postsArray.count != 1 {

                                self.backCardView!.addSubview(self.backpico)
                                }
                                
                                
                                
                                self.backpico.alpha = 0.90
                            })
                            
                            
                            
                        }
                        self.resultsview.alpha = 0
                        /*self.resultsview.viewWithTag(101)!.removeFromSuperview()
                        self.resultsview.viewWithTag(102)!.removeFromSuperview()
                        self.resultsview.viewWithTag(103)!.removeFromSuperview()
                        self.resultsview.viewWithTag(104)!.removeFromSuperview()
                        self.resultsview.viewWithTag(105)!.removeFromSuperview()
                        self.resultsview.viewWithTag(106)!.removeFromSuperview()*/
                        self.likebutton.enabled = true
                        //self.likebutton.setImage(UIImage(named: "likepost"), forState: UIControlState.Normal)
                        //self.isliked = "false"
                        //self.likebutton.setImage(UIImage(named: "likepost"), forState: UIControlState.Normal)
                        //self.view.alpha = 1
                        //self.resultblackback.alpha = 0
                        self.resultblackback.hidden = true
                        
                    })
                    //self.resultsview.hidden = true
                    
                    // here code perfomed with delay
                    
                })
            }

            
        }
        
        
        
        
        
        self.toUser = self.postsArray[0] as! PFObject
        totalUsers = totalUsers - 1 // decreasy by 1 every time user is gone
        
        self.frontCardView = self.backCardView
        self.frontCardView?.frame = frontCardFrame
        self.frontCardView?.button.addTarget(self, action: "viewUser:", forControlEvents: UIControlEvents.TouchUpInside)
        self.frontCardView?.userInteractionEnabled = true
        if self.postsFound.count > 0 {
            self.backCardView = self.popUserView(backCardFrame)
            self.view.insertSubview(self.backCardView!, belowSubview: self.frontCardView!)
            self.backCardView?.userInteractionEnabled = false
            self.searchButton.userInteractionEnabled = false
            
            
            
            
            
            
        }
        
        println("Users Remaining \(self.totalUsers)") // +2 because including front and back card
        
        if self.totalUsers == 0 {
            self.postsFoundlabel.text = ""
            self.noUsersView.hidden = false
            self.searchRipples.removeFromSuperview()
			//self.searchButton.hidden = false
            
            self.searchButton.userInteractionEnabled = true
            
            self.searchButton.layer.borderColor = UIColor(red: 18 / 255.0, green: 159 / 255.0, blue: 204 / 255.0, alpha: 1.0).CGColor
            self.searchButton.layer.backgroundColor = UIColor(red: 20 / 255.0, green: 173 / 255.0, blue: 222 / 255.0, alpha: 1.0).CGColor
            self.searchButton.setTitle("Fetch More!", forState: .Normal)
            //self.searchButton.setImage(UIImage(named:"deadenddog.png"),forState:UIControlState.Normal)
            self.dogsitting.image = UIImage(named:"noposts.png")
            self.skipbutton.hidden = true
            self.nobutton.hidden = true
            self.yesbutton.hidden = true
            self.likebutton.hidden = true
            self.flagbutton.hidden = true
            self.aliasbutton.hidden = true
            self.usernamelabel.hidden = true
            
        }
        
        
        
    }
    @IBAction func closeresultsbutton(sender: AnyObject) {
        
        self.resultsview.alpha = 0
        self.blurEffectView.alpha = 1
        self.resultblackback.hidden = true
        self.blurEffectView.removeFromSuperview()
        self.isliked = "false"
        self.likebutton.setImage(UIImage(named: "likepost"), forState: UIControlState.Normal)
        
        
        
    }
    
    
    
    
    @IBAction func closeresults(sender: AnyObject) {
        
        self.resultsview.alpha = 0
        
        
        
    }

    
    
    func popUserView(frame:CGRect)->CardView? {
        
        if postsFound.count == 0 {
            return nil
        } else {
            var options:MDCSwipeToChooseViewOptions = MDCSwipeToChooseViewOptions()
            options.delegate = self
            options.threshold = 160.0
            
            options.nopeText = "NO / #1"
            options.likedText = "YES / #2"
            
            
            options.likedColor = UIColor(red: 20 / 255.0, green: 173 / 255.0, blue: 222 / 255.0, alpha: 1.0)
            
            options.nopeColor = UIColor(red: 222 / 255.0, green: 69 / 255.0, blue: 20 / 255.0, alpha: 1.0)
            options.onPan = { (state:MDCPanState!) in
                    if state.thresholdRatio == 1.0 && state.direction == .Left {
                        
                    }
                }
            var _user = self.postsFound[0] as! PFObject
            var userView = CardView(frame: frame, user: _user, options: options)
            
            
            self.postsFound.removeObjectAtIndex(0)
            if self.toUser.objectForKey("questionType") as! String == "#WhichOne?" as String {
                self.yesbutton.setImage(UIImage(named:"greentwo.png"),forState:UIControlState.Normal)
                self.nobutton.setImage(UIImage(named:"redone.png"),forState:UIControlState.Normal)
                
                
                
            } else {
                
                self.yesbutton.setImage(UIImage(named:"greencheck.png"),forState:UIControlState.Normal)
                self.nobutton.setImage(UIImage(named:"redcross.png"),forState:UIControlState.Normal)
                
            }
            
            if self.toUser.objectForKey("alias") as! String == "Anonymous" as String {
                self.aliasbutton.hidden = true
                self.usernamelabel.hidden = true
                
            } else {
                
                //self.aliasbutton.setTitle(self.toUser.objectForKey("alias") as? String, forState: UIControlState.Normal)
                self.aliasbutton.hidden = false
                self.usernamelabel.hidden = false
                self.usernamelabel.text = self.toUser.objectForKey("alias") as? String
            }
            

            return userView;
            
            
            
        }
        
        
        

        
    }
    
    
    
    @IBOutlet weak var likebutton: UIButton!
    
    
    @IBAction func searchTapped(sender: AnyObject) {
        self.viewDidLoad()
        self.searchButton.userInteractionEnabled = false
        self.view.userInteractionEnabled = false
    }
    

    @IBAction func yesButton(sender: AnyObject) {
        self.frontCardView?.mdc_swipe(MDCSwipeDirection.Right)
        
        
        
    }
    
    
    @IBAction func noButton(sender: AnyObject) {
        

        
        
        
        
        self.frontCardView?.mdc_swipe(.Left)
        
        
        
        
    }
    
    
    @IBAction func infoPressed(sender: AnyObject) {
       // self.showuserprofile()
        
        
        
    }
    
    var isliked = "false"
    
    @IBAction func likepressed(sender: AnyObject) {
        if isliked == "false" {
        isliked = "true"
        //likebutton.userInteractionEnabled = false
        likebutton.enabled = false
        toUser.incrementKey("likecount")
        self.likebutton.setImage(UIImage(named: "likepostpink"), forState: UIControlState.Normal)
        //toUser.saveInBackground()
        toUser.saveInBackgroundWithBlock({ (Bool, NSError) -> Void in
            //self.likebutton.userInteractionEnabled = true
            self.likebutton.enabled = true
        })
        } else {
            isliked = "false"
            //likebutton.userInteractionEnabled = false
            likebutton.enabled = false
            self.likebutton.setImage(UIImage(named: "likepost"), forState: UIControlState.Normal)
            toUser.incrementKey("likecount", byAmount: -1)
            toUser.saveInBackgroundWithBlock({ (Bool, NSError) -> Void in
                //self.likebutton.userInteractionEnabled = true
                self.likebutton.enabled = true
            })
        }
        
        //self.likebutton.enabled = false
        //self.likebutton.setImage(UIImage(named: "likepostpink"), forState: UIControlState.Normal)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func flagpressed(sender: AnyObject) {
        
        var dualflag = UIActionSheet(title: "Report this post?", delegate: self, cancelButtonTitle: "Nevermind!", destructiveButtonTitle: nil)
        dualflag.addButtonWithTitle("Yes!")
        dualflag.showInView(self.view)
        
    }
    
    
    @IBAction func findtopost(sender: AnyObject) {
        var query1 = PFQuery(className: "followers")
        query1.whereKey("follower", equalTo: currentuser.objectId)
        query1.getFirstObjectInBackgroundWithBlock { (followObject, NSError) -> Void in
            
            if followObject != nil {
                if followObject.objectForKey("reported") as! Int > 99 {
                    self.displayAlert("Account Under Review", message: "Due to suspicious activity, your account is under review. Please try again later.")
                } else {
                    self.performSegueWithIdentifier("postimage1segue", sender: self)
                }
                
            }
            
        }

        /*
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let userinfo = appDelegate.userinfo
        

        let reportcount = userinfo.objectForKey("reported") as! Int
        if reportcount > 50 {
            self.displayAlert("Account Under Review", message: "Due to suspicious activity, your account is under review. Please try again later.")
        } else {
            self.performSegueWithIdentifier("postimage1segue", sender: self)
        }
        */
        
    }
    
    
    
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 1 {     //Inappropriate
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            let userinfo = appDelegate.userinfo
            
            
            
            let reportcount = userinfo.objectForKey("reportothers") as! Int
            println(reportcount)
            
            
            if reportcount < 20 {
                
                var query1 = PFQuery(className: "followers")
                query1.whereKey("follower", equalTo: toUser.objectForKey("userId"))
                query1.getFirstObjectInBackgroundWithBlock { (followObject, NSError) -> Void in
                    
                    if followObject != nil {
                        
                        followObject.incrementKey("reported")
                        followObject.saveInBackground()
                        self.toUser.incrementKey("Reportcount")
                        self.toUser.incrementKey("Vote2", byAmount: 1)
                        self.toUser.saveInBackground()
                        
                        
                        userinfo.incrementKey("reportothers")
                        userinfo.saveInBackground()
                        
                        self.frontCardView?.mdc_swipe(.Left)
                        
                    }
                    
                }

            
                
                
                
                
            } else {
                self.displayAlert("Unable to Report", message: "Because of your suspicious reporting pattern, your account is under review.")
            }


        }
        
    }

    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            //self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    func updateMatch(/*liked:Bool,forUser:PFUser*/) {
        
        
        
        //let updateObj = objects.last as! PFObject
        
        
        /*
        let pred = NSPredicate(format: "byUser = %@ AND toUser = %@ OR byUser = %@ AND toUser = %@", currentuser, forUser, forUser, currentuser)
        var query = PFQuery(className: "Matches", predicate: pred)
        query.findObjectsInBackgroundWithBlock { (objects:[AnyObject]!, error:NSError!) -> Void in
            if error == nil {
                if objects.count > 0 {
                    let updateObj = objects.last as! PFObject
                    if updateObj.objectForKey("byUser").objectId == currentuser.objectId {
                       // println("exist")
                        currentuser.addUniqueObject(forUser.objectId, forKey: "viewedUsers")
                        currentuser.saveInBackground()
                        
                       /*
                    } else if updateObj.objectForKey("toUser").objectId == currentuser.objectId {
                        //if updateObj.objectForKey("liked") as! Bool == true && liked == true {
                            //self.showMatchFound(forUser)
                        //}
                        //updateObj["likedback"] = liked
                        updateObj.saveInBackground()
                        currentuser.addUniqueObject(forUser.objectId, forKey: "viewedUsers")
                        currentuser.saveInBackground()

                        
                    }
                } else {
                    var match = PFObject(className: "Matches")
                    match["byUser"] = currentuser
                    match["toUser"] = forUser
                    match["liked"] = liked
                    match.saveInBackground()
                    currentuser.addUniqueObject(forUser.objectId, forKey: "viewedUsers")
                    currentuser.saveInBackground()
                    */
                }
                }
                
            } else {
                println(error.localizedDescription)
            }
        }*/
        
        
    }

    
    /*
    func showMatchFound(forUser:PFUser) {

        let matchvc = storyb.instantiateViewControllerWithIdentifier("matchfoundvc") as! MatchFoundViewController
        matchvc.navController = self.navigationController!
        matchvc.getUser = forUser
        self.navigationController?.presentViewController(matchvc, animated: true, completion: nil)
        
    }*/
    
    
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
            //let indexPath = self.tableView.indexPathForSelectedRow()
            
            
            
            let barViewControllers = segue.destinationViewController as! UITabBarController
            let nav = barViewControllers.viewControllers![0] as! UINavigationController
            let destinationViewController = nav.topViewController as! NewFeedViewController
            destinationViewController.lastviewed = lastviewed
            
            
            
            
            println(lastviewed)
            
            
        }
        
        if(segue.identifier == "profileviewsegue"){
            //let indexPath = self.tableView.indexPathForSelectedRow()
            
            
            
            let nav = segue.destinationViewController as! UINavigationController
            //let nav = barViewControllers.viewControllers![0] as! UINavigationController
            let destinationViewController = nav.topViewController as! YourPrivateViewController
            destinationViewController.toUser = toUser
            
            
            
            
            println(lastviewed)
            
            
        }
        
        if(segue.identifier == "findcategory"){
            //let indexPath = self.tableView.indexPathForSelectedRow()
            
            
            
            let nav = segue.destinationViewController as! UINavigationController
            
            let destinationViewController = nav.topViewController as! PackTableViewController
            destinationViewController.fromwhere = "fromfind"
            destinationViewController.findController = self
            
            
            
        }

        
    }
    
    override func viewDidAppear(animated: Bool) {
        if newcat == "true" {
            self.newcat = "false"
            self.postsArray.removeAllObjects()
            
            self.postsFound.removeAllObjects()
            
            
            self.frontCardView?.removeFromSuperview()

            
            self.topfilteroutlet.userInteractionEnabled = false
            
            self.backCardView?.removeFromSuperview()
            noUsersView.hidden = false
            
            
            viewDidLoad()
            self.searchButton.userInteractionEnabled = false
            self.view.userInteractionEnabled = false
            
            
        }
    }
    var skiptrigger = "false"
    
    
    @IBAction func skipcard(sender: AnyObject) {
        
        self.resultblackback.hidden = false
        skiptrigger = "true"
        
        if toUser != nil {
            
            
            let seconds = 0.2
            let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay)), dispatch_get_main_queue(), {
                
                self.toUser.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
                self.toUser.saveInBackground()
                self.frontCardView?.mdc_swipe(.Left)

            
            })

        //toUser.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
        //toUser.saveInBackground()
        //self.frontCardView?.mdc_swipe(.Left)
            
            
            
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
}
