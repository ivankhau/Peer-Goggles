//
//  MatchFoundViewController.swift
//  Finder
//
//  Created by djay mac on 01/02/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class MatchFoundViewController: UIViewController {

    
    @IBOutlet weak var user1pic: UIImageView!
    @IBOutlet weak var user2pic: UIImageView!
    @IBOutlet weak var startChatButton: UIButton!
    @IBOutlet weak var goBackButton: UIButton!
    var navController = UINavigationController()
    
    @IBOutlet weak var likelabel: UILabel!
    

    var getUser:PFUser!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        if let mydp = currentuser.objectForKey("dpSmall") as? PFFile {
            mydp.getDataInBackgroundWithBlock { (data, error) -> Void in
                
                if error == nil {
                    self.user2pic.image = UIImage(data: data)!
                }
            }
            
        }
        
        if let getdp = getUser.objectForKey("dpSmall") as? PFFile {
            getdp.getDataInBackgroundWithBlock { (data, error) -> Void in
                
                if error == nil {
                    self.user1pic.image = UIImage(data: data)!
                }
            }
            
        }
        
        likelabel.textColor = UIColor.whiteColor()
        var name = getUser.objectForKey("name") as! String
        likelabel.text = "\(name) and You Liked each other :)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func startChat(sender: AnyObject) {
        
        let pred = NSPredicate(format: "byUser = %@ AND toUser = %@ OR byUser = %@ AND toUser = %@", currentuser, getUser, getUser,  currentuser)
        
        var query = PFQuery(className: "Matches", predicate: pred)
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            let obj = objects.last as! PFObject
            
            //let messagesVC = storyb.instantiateViewControllerWithIdentifier("messagesvc") as! ChatMessagesViewController
        
            let user1 = currentuser
            let user2 = self.getUser as PFUser
            //messagesVC.room = obj as PFObject
            //messagesVC.incomingUser = user2
            //messagesVC.hidesBottomBarWhenPushed = true
                self.dismissViewControllerAnimated(true, completion: nil)

            
            //self.navController.pushViewController(messagesVC, animated: true)
            
        }
        
        
        
        

    }
    
    
    
    

}
