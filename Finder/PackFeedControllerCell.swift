//
//  PackFeedControllerCell.swift
//  Finder
//
//  Created by Ivan Khau on 7/15/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit
import Foundation

class PackFeedControllerCell: UITableViewCell, UIActionSheetDelegate {
    
    @IBOutlet weak var xresult1: UILabel!
    
    @IBOutlet weak var yresult1: UILabel!
    
    @IBOutlet weak var yperc1: UILabel!
    
    @IBOutlet weak var xperc1: UILabel!
    
    @IBOutlet weak var backcorner: UILabel!
    
    @IBOutlet weak var backtop: UILabel!
    
    
    
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
    
    
    @IBAction func votebutton1(sender: AnyObject) {
        
        //sender.setImage(UIImage(named:"check123"),forState: UIControlState.Normal)
        
        var query1 = PFQuery(className: "Post")
        var poop = query1.getObjectWithId(NewFeedLabel2.text)
        poop.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
        poop.incrementKey("Vote1")
        poop.incrementKey("totalvotes")
        poop.saveInBackground()
        currentuser.incrementKey("uservotecount")
        currentuser.saveInBackground()
        dualVoteResult2Outlet.hidden = false
        dualVoteResult1Outlet.hidden = false
        nextpostbuttonoutlet.enabled = true
        
    }
    
    @IBAction func votebutton2(sender: AnyObject) {
        
        //sender.setImage(UIImage(named:"check123"),forState: UIControlState.Normal)
        
        var query2 = PFQuery(className: "Post")
        var poop2 = query2.getObjectWithId(NewFeedLabel2.text)
        poop2.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
        poop2.incrementKey("Vote2")
        poop2.incrementKey("totalvotes")
        poop2.saveInBackground()
        currentuser.incrementKey("uservotecount")
        currentuser.saveInBackground()
        dualVoteResult2Outlet.hidden = false
        dualVoteResult1Outlet.hidden = false
        nextpostbuttonoutlet.enabled = true
        
    }
    
    @IBAction func yesbutton(sender: AnyObject) {
        
        var query1 = PFQuery(className: "Post")
        var poop = query1.getObjectWithId(NewFeedLabel2.text)
        poop.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
        poop.incrementKey("Vote2")
        poop.incrementKey("totalvotes")
        poop.saveInBackground()
        currentuser.incrementKey("uservotecount")
        currentuser.saveInBackground()
        voteResult2Outlet.hidden = false
        voteResult1Outlet.hidden = false
        nextpostbuttonoutlet.enabled = true
        
        
        
        
        
        
    }
    
    @IBAction func nobutton(sender: AnyObject) {
        
        var query1 = PFQuery(className: "Post")
        var poop = query1.getObjectWithId(NewFeedLabel2.text)
        poop.addUniqueObject(currentuser.objectId, forKey: "ViewedUsers")
        poop.incrementKey("Vote1")
        poop.incrementKey("totalvotes")
        poop.saveInBackground()
        currentuser.incrementKey("uservotecount")
        currentuser.saveInBackground()
        voteResult2Outlet.hidden = false
        voteResult1Outlet.hidden = false
        nextpostbuttonoutlet.enabled = true
        
        
        
        
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
                poop.incrementKey("Reportcount", byAmount: 1)
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

            
        }
        
        
    }
}