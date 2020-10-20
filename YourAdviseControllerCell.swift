//
//  YourAdviseControllerCell.swift
//  Finder
//
//  Created by Ivan Khau on 7/9/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit
import Foundation

class YourAdviseControllerCell: UITableViewCell, UIActionSheetDelegate {
    
    //@IBOutlet weak var deletedmessage: UILabel!
    
    //@IBOutlet weak var backdroplabel: UILabel!
    
    @IBOutlet weak var feedbacktextview: UITextView!
        
    @IBOutlet weak var commenttextview: UITextView!
    
    
    @IBOutlet weak var deletebuttonoutlet: UIButton!
    
    @IBOutlet weak var voteResult2Outlet: UILabel!
    
    @IBOutlet weak var voteResult1Outlet: UILabel!
    
    //@IBOutlet weak var dualVoteResult1Outlet: UILabel!
    
    //@IBOutlet weak var dualVoteResult2Outlet: UILabel!
    
    @IBOutlet weak var greencheckoutlet: UIImageView!
    
    @IBOutlet weak var redcrossoutlet: UIImageView!
    
    @IBOutlet weak var useridoutlet: UILabel!
    
    @IBOutlet weak var NewFeedImageView3: UIImageView!

    @IBOutlet weak var declarationoutlet: UILabel!
    
    //@IBOutlet weak var NewFeedImageView2: UIImageView!
    
    //@IBOutlet weak var NewFeedImageView: UIImageView!
    //@IBOutlet weak var NewFeedLabel1: UILabel!
    @IBOutlet weak var NewFeedLabel2: UILabel!
    
    @IBOutlet weak var NewFeedLabel3: UILabel!
    
    //@IBOutlet weak var deletepostbuttonoutlet: UIButton!
    
    
    @IBAction func deletepostbutton(sender: AnyObject) {
        
        var dualpost = UIActionSheet(title: "Delete this post?", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil)
        dualpost.addButtonWithTitle("Yes")
        //dualpost.addButtonWithTitle("Two")
        dualpost.showInView(contentView)
        
        
        
        
        
    }
    
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 1 { // Post One Pic
            
            PFObject(withoutDataWithClassName: "Post", objectId: self.NewFeedLabel2.text).deleteEventually()
            
            
            self.removeFromSuperview()
           
            
            
            
            
            
        }
    }
}

