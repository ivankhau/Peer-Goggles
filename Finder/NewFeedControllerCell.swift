//
//  NewFeedControllerCell.swift
//  Finder
//
//  Created by Ivan Khau on 7/6/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit
import Foundation

class NewFeedControllerCell: UITableViewCell, UIActionSheetDelegate {
    
    //@IBOutlet weak var doganimation: UIImageView!

    
    //@IBOutlet weak var singlepercentage1: UILabel!
    
    //@IBOutlet weak var singlepercentage2: UILabel!
    
    

    
    
   
    
    
    
    
    @IBOutlet weak var messagesend: UIButton!
    
    
    
    @IBOutlet weak var xresult1: UILabel!
    
    @IBOutlet weak var yresult1: UILabel!
    
    @IBOutlet weak var xperc1: UILabel!
    
    @IBOutlet weak var yperc1: UILabel!
    
    @IBOutlet weak var backcorner: UILabel!
    
    @IBOutlet weak var backtop: UILabel!
    
    
    @IBOutlet weak var filter1: UILabel!
    
    
    @IBAction func nextpostaction(sender: AnyObject) {
        
        /*
        flagpromptoutlet.hidden = true
        flagpromptoutlet.enabled = false
        

        
        nextpostbuttonoutlet.enabled = false
        
        if declarationoutlet.text == String("single") {
            NewFeedImageView.hidden = true
            NewFeedImageView2.hidden = true
            votebutton1outlet.enabled = false
            votebutton2outlet.enabled = false
            NewFeedLabel1.hidden = true
            
            NewFeedImageView3.hidden = false
            nobuttonoutlet.enabled = true
            yesbuttonoutlet.enabled = true
            nobuttonoutlet.hidden = false
            yesbuttonoutlet.hidden = false
            NewFeedLabel3.hidden = false
            xperc1.hidden = false
            yperc1.hidden = false
            xresult1.hidden = false
            yresult1.hidden = false
            backtop.hidden = false
            backcorner.hidden = false
            filter1.hidden = false
            
            if useridoutlet.text == String("onetwo") {
                yesbuttonoutlet.setImage(UIImage(named:"greentwo.png"),forState:UIControlState.Normal)
                nobuttonoutlet.setImage(UIImage(named:"redone.png"),forState:UIControlState.Normal)
            }else{
                yesbuttonoutlet.setImage(UIImage(named:"greencheck.png"),forState:UIControlState.Normal)
                nobuttonoutlet.setImage(UIImage(named:"redcross.png"),forState:UIControlState.Normal)
                
            }
            
            voteResult1Outlet.hidden = true
            voteResult2Outlet.hidden = true
            dualVoteResult1Outlet.hidden = true
            dualVoteResult2Outlet.hidden = true
        } else {
            
            NewFeedImageView.hidden = false
            NewFeedImageView2.hidden = false
            votebutton1outlet.enabled = true
            votebutton2outlet.enabled = true
            NewFeedLabel1.hidden = false
            
            NewFeedImageView3.hidden = true
            nobuttonoutlet.enabled = false
            yesbuttonoutlet.enabled = false
            nobuttonoutlet.hidden = true
            yesbuttonoutlet.hidden = true
            NewFeedLabel3.hidden = true
            xperc1.hidden = true
            yperc1.hidden = true
            xresult1.hidden = true
            yresult1.hidden = true
            backtop.hidden = true
            backcorner.hidden = true
            filter1.hidden = true
            voteResult1Outlet.hidden = true
            voteResult2Outlet.hidden = true
            dualVoteResult1Outlet.hidden = true
            dualVoteResult2Outlet.hidden = true
        }*/
    
    }
    @IBOutlet weak var messagetext: UITextView!
    
    @IBAction func closemessagebox(sender: AnyObject) {
        
        messageview.hidden = true
        
    }
    @IBOutlet weak var closemessageboxoutlet: UIButton!
    
    
    @IBOutlet weak var feedbackdelivered: UIButton!
    
    @IBOutlet weak var openmessageboxoutlet: UIButton!
    
    
    @IBAction func openmessagebox(sender: AnyObject) {
        
        messageview.hidden = false
        
    }
    @IBAction func messagesendaction(sender: AnyObject) {
        
        self.closemessageboxoutlet.enabled = false
        self.messagetext.editable = false
        self.messagesend.enabled = false
        self.messagesend.backgroundColor = UIColor.lightGrayColor()
        self.messagesend.setTitle("Sending...", forState: .Normal)
        var query1 = PFQuery(className: "Post")
        var poop = query1.getObjectWithId(NewFeedLabel2.text)
        poop.addUniqueObject(messagetext.text, forKey: "Comments")
        poop.saveInBackground()
        poop.saveInBackgroundWithBlock { (Bool, NSError) -> Void in
            
            self.feedbackdelivered.hidden = false
            
            
        }
        
    }
    @IBAction func feedbackdeliveredaction(sender: AnyObject) {
        self.messageview.hidden = true
        self.openmessageboxoutlet.hidden = true
        
    }
    
    
    

    
    
    
    
    @IBOutlet weak var messageview: UIView!
    
    //@IBOutlet weak var actualID: UILabel!
    
    //@IBOutlet weak var redoneoutlet: UIImageView!
    
    //@IBOutlet weak var greentwooutlet: UIImageView!
    
    @IBOutlet weak var nextpostbuttonoutlet: UIButton!
    @IBOutlet weak var voteResult2Outlet: UILabel!
    
    @IBOutlet weak var voteResult1Outlet: UILabel!
    
    @IBOutlet weak var dualVoteResult1Outlet: UILabel!
    
    @IBOutlet weak var dualVoteResult2Outlet: UILabel!
    
    @IBOutlet weak var flagpromptoutlet: UIButton!
    
    @IBOutlet weak var flagbuttonoutlet: UIButton!
    
    @IBOutlet weak var useridoutlet: UILabel!
    
    @IBOutlet weak var nobuttonoutlet: UIButton!
    @IBOutlet weak var yesbuttonoutlet: UIButton!
    @IBOutlet weak var NewFeedImageView3: UIImageView!
    @IBOutlet weak var votebutton2outlet: UIButton!
    @IBOutlet weak var votebutton1outlet: UIButton!
    @IBOutlet weak var declarationoutlet: UILabel!
    
    @IBOutlet weak var NewFeedImageView2: UIImageView!
    
    @IBOutlet weak var NewFeedImageView: UIImageView!
    @IBOutlet weak var NewFeedLabel1: UILabel!
    @IBOutlet weak var NewFeedLabel2: UILabel!
    
    @IBOutlet weak var NewFeedLabel3: UILabel!
    
    
    //votebutton1outlet.addTarget(self, action: "connected:", forControlEvents: .TouchUpInside)

    
    
    @IBAction func votebutton1(sender: AnyObject) {


        //sender.setImage(UIImage(named:"check123"),forState: UIControlState.Normal)
        //sender.alpha() = 0.8
        self.votebutton1outlet.userInteractionEnabled = false
        self.votebutton2outlet.userInteractionEnabled = false

        
        var query1 = PFQuery(className: "Post")
        var poop = query1.getObjectWithId(NewFeedLabel2.text)
        poop.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
        poop.incrementKey("Vote1")
        //poop.incrementKey("totalvotes")
        poop.saveInBackgroundWithBlock { (Bool, NSError) -> Void in
        //currentuser.incrementKey("uservotecount")
        //currentuser.saveInBackground()
        self.dualVoteResult2Outlet.hidden = false
        self.dualVoteResult1Outlet.hidden = false
        self.nextpostbuttonoutlet.enabled = true
        //sender.setImage(UIImage(named:"realtrans"),forState: UIControlState.Normal)
        self.dualVoteResult1Outlet.textColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)
            

        }
    }
    
    @IBAction func votebutton2(sender: AnyObject) {
        

        
        
        //sender.setImage(UIImage(named:"check123"),forState: UIControlState.Normal)
        
        //sender.alpha = 0.8

        self.votebutton1outlet.userInteractionEnabled = false
        self.votebutton2outlet.userInteractionEnabled = false

        var query2 = PFQuery(className: "Post")
        var poop2 = query2.getObjectWithId(NewFeedLabel2.text)
        poop2.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
        poop2.incrementKey("Vote2")
        //poop2.incrementKey("totalvotes")
        poop2.saveInBackgroundWithBlock { (Bool, NSError) -> Void in
            self.dualVoteResult2Outlet.hidden = false
            self.dualVoteResult1Outlet.hidden = false
            self.nextpostbuttonoutlet.enabled = true
            self.dualVoteResult2Outlet.textColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1.0)

        }
        
        
        //sender.setImage(UIImage(named:"realtrans"),forState: UIControlState.Normal)
        
        //currentuser.incrementKey("uservotecount")
        //currentuser.saveInBackground()

    }
    
    @IBAction func yesbutton(sender: AnyObject) {

        
        self.nobuttonoutlet.userInteractionEnabled = false
        self.yesbuttonoutlet.userInteractionEnabled = false
        
        var query1 = PFQuery(className: "Post")
        var poop = query1.getObjectWithId(NewFeedLabel2.text)
        poop.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
        poop.incrementKey("Vote2")
        //poop.incrementKey("totalvotes")
        poop.saveInBackgroundWithBlock { (Bool, NSError) -> Void in
            self.voteResult2Outlet.hidden = false
            self.voteResult1Outlet.hidden = false
            self.nextpostbuttonoutlet.enabled = true
            
            self.xperc1.hidden = false
            self.yperc1.hidden = false
            self.xresult1.hidden = false
            self.yresult1.hidden = false
            

        }
        
        
        
        


        if useridoutlet.text != String("onetwo") {
            
            self.yesbuttonoutlet.setImage(UIImage(named:"highlightedcheck.png"),forState:UIControlState.Normal)
        } else {
            self.yesbuttonoutlet.setImage(UIImage(named:"highlight2.png"),forState:UIControlState.Normal)
        }
        
        //currentuser.incrementKey("uservotecount")
        //currentuser.saveInBackground()
        
    }
    
    @IBAction func nobutton(sender: AnyObject) {

        
        self.nobuttonoutlet.userInteractionEnabled = false
        self.yesbuttonoutlet.userInteractionEnabled = false
        
        
        var query1 = PFQuery(className: "Post")
        var poop = query1.getObjectWithId(NewFeedLabel2.text)
        poop.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
        poop.incrementKey("Vote1")
        //poop.incrementKey("totalvotes")
        poop.saveInBackground()
        poop.saveInBackgroundWithBlock { (Bool, NSError) -> Void in
            self.voteResult2Outlet.hidden = false
            self.voteResult1Outlet.hidden = false
            self.nextpostbuttonoutlet.enabled = true
            self.xperc1.hidden = false
            self.yperc1.hidden = false
            self.xresult1.hidden = false
            self.yresult1.hidden = false
            

            

        }


        if self.useridoutlet.text == String("onetwo") {
        
        self.nobuttonoutlet.setImage(UIImage(named:"highlight1.png"),forState:UIControlState.Normal)
        } else {
            self.nobuttonoutlet.setImage(UIImage(named:"highlightedcross.png"),forState:UIControlState.Normal)
        }
        
        
        
        //currentuser.incrementKey("uservotecount")
        //currentuser.saveInBackground()


        
    }
    
    
    
    
    
    
    
    @IBAction func flagreportbutton(sender: AnyObject) {
        
        var dualflag = UIActionSheet(title: "Reason for flagging?", delegate: self, cancelButtonTitle: "Nevermind!", destructiveButtonTitle: nil)
        dualflag.addButtonWithTitle("Inappropriate Post")
        dualflag.addButtonWithTitle("Lame Post")
        dualflag.showInView(self.contentView)
        
        
        
        
    }
    
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 1 {     //Inappropriate Post
            
            currentuser.incrementKey("uservotecount")
            currentuser.incrementKey("reportedOtherscount")
            currentuser.saveInBackground()

            
            if PFUser.currentUser()["reportedOtherscount"] as! Int > 6 {
                var query1 = PFQuery(className: "Post")
                var poop = query1.getObjectWithId(NewFeedLabel2.text)
                poop.incrementKey("Reportcount", byAmount: 1)
                poop.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
                poop.saveInBackground()
                
                //currentuser.incrementKey("uservotecount")
                //currentuser.incrementKey("reportedOtherscount")
                //currentuser.saveInBackground()
                
                votebutton1outlet.enabled = false
                votebutton2outlet.enabled = false
                nobuttonoutlet.enabled = false
                yesbuttonoutlet.enabled = false
                flagbuttonoutlet.enabled = false
                flagbuttonoutlet.hidden = true
                nobuttonoutlet.hidden = true
                yesbuttonoutlet.hidden = true
                flagpromptoutlet.hidden = false
                //flagpromptoutlet.enabled = true
                
                nextpostbuttonoutlet.enabled = true
            
            
            } else {
                var query1 = PFQuery(className: "Post")
                var poop = query1.getObjectWithId(NewFeedLabel2.text)
                
                //poop.addUniqueObject(currentuser.objectId, forKey: "UsersReported")
                poop.incrementKey("Reportcount", byAmount: 3)
                //poop.incrementKey("inappropriatePost")
                poop.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
                poop.saveInBackground()
                
                
                
                
                //currentuser.addUniqueObject(NewFeedLabel2.text, forKey: "postsreported")
                
                votebutton1outlet.enabled = false
                votebutton2outlet.enabled = false
                nobuttonoutlet.enabled = false
                yesbuttonoutlet.enabled = false
                flagbuttonoutlet.enabled = false
                flagbuttonoutlet.hidden = true
                nobuttonoutlet.hidden = true
                yesbuttonoutlet.hidden = true
                flagpromptoutlet.hidden = false
                //flagpromptoutlet.enabled = true
                
                nextpostbuttonoutlet.enabled = true
                
            }
            
            
            
        } else if buttonIndex == 2 {       //Lame Post
            
            currentuser.incrementKey("uservotecount")
            currentuser.incrementKey("reportedOtherscount")
            currentuser.saveInBackground()
            
            if PFUser.currentUser()["reportedOtherscount"] as! Int > 6 {
                var query1 = PFQuery(className: "Post")
                var poop = query1.getObjectWithId(NewFeedLabel2.text)
                poop.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
                poop.saveInBackground()
                
                
                
                votebutton1outlet.enabled = false
                votebutton2outlet.enabled = false
                nobuttonoutlet.enabled = false
                yesbuttonoutlet.enabled = false
                flagbuttonoutlet.enabled = false
                flagbuttonoutlet.hidden = true
                nobuttonoutlet.hidden = true
                yesbuttonoutlet.hidden = true
                flagpromptoutlet.hidden = false
                //flagpromptoutlet.enabled = true
                
                nextpostbuttonoutlet.enabled = true
                
                
            } else {
                var query1 = PFQuery(className: "Post")
                var poop = query1.getObjectWithId(NewFeedLabel2.text)
                
                //poop.addUniqueObject(currentuser.objectId, forKey: "UsersReported")
                poop.incrementKey("Reportcount", byAmount: 1)
                //poop.incrementKey("inappropriatePost")
                poop.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
                poop.saveInBackground()
                
                
                
                
                //currentuser.addUniqueObject(NewFeedLabel2.text, forKey: "postsreported")
                //currentuser.incrementKey("uservotecount")
                //currentuser.incrementKey("reportedOtherscount")
                //currentuser.saveInBackground()
                
                votebutton1outlet.enabled = false
                votebutton2outlet.enabled = false
                nobuttonoutlet.enabled = false
                yesbuttonoutlet.enabled = false
                flagbuttonoutlet.enabled = false
                flagbuttonoutlet.hidden = true
                nobuttonoutlet.hidden = true
                yesbuttonoutlet.hidden = true
                flagpromptoutlet.hidden = false
                //flagpromptoutlet.enabled = true
                
                nextpostbuttonoutlet.enabled = true
                
            }
            
        }


    }
}