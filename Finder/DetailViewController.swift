//
//  DetailViewController.swift
//  YikYak
//
//  Created by Shrikar Archak on 1/6/15.
//  Copyright (c) 2015 Shrikar Archak. All rights reserved.
//

import UIKit
//import MapKit
class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {

    var yak: PFObject?
    var commentView: UITextView?
    var footerView: UIView?
    var contentHeight: CGFloat = 0

    var comments: [String]?
    let FOOTERHEIGHT : CGFloat = 50;
    
    //@IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    //@IBOutlet weak var timeLabel: UILabel!
    //@IBOutlet weak var yakLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //println(yak)
        
        /* Setup the datasource delegate */
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView.frame.height = view.frame.height
        
        /* Setup the keyboard notifications */
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        
        /* Setup the contentInsets */
        self.tableView.contentInset = UIEdgeInsetsZero
        self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero
        //self.tableView.frame.height = self.tableView.frame.height
        
        self.edgesForExtendedLayout = UIRectEdge.None
        /* Make sure the content doesn't go below tabbar/navbar */
        self.extendedLayoutIncludesOpaqueBars = true
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        //self.commentView!.delegate = self



        /* Setup Map */
        //let geo = yak?.objectForKey("location") as! PFGeoPoint
        //let coordinate = CLLocationCoordinate2D(latitude: geo.latitude, longitude: geo.longitude)
        //let reg = MKCoordinateRegionMakeWithDistance(coordinate, 1500, 1500)
        //self.mapView.setRegion(reg, animated: true)
        //self.mapView.showsUserLocation = true
        
        
        
        
        //PFQuery(className: "PrivateGroups").whereKey("privatename", equalTo: PFUser.currentUser()["lasprivate"])
        if(yak?.objectForKey("comments") != nil) {
            comments = yak?.objectForKey("comments") as! [String]
        }
        //println(yak)
        //println(yak?.objectForKey("text"))
        //self.yakLabel.text = yak?.objectForKey("privatename") as? String

    }
    

    
    func keyBoardWillShow(notification: NSNotification) {
        var info:NSDictionary = notification.userInfo!
        var keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        
        var keyboardHeight:CGFloat =  keyboardSize.height - 40
        
        self.view.frame.origin.y -= 60

        var animationDuration:CGFloat = info[UIKeyboardAnimationDurationUserInfoKey] as! CGFloat
        
        var contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardHeight, 0.0);
        self.tableView.contentInset = contentInsets
        self.tableView.scrollIndicatorInsets = contentInsets
        
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewDidAppear(animated: Bool) {
        let numberOfSections = tableView.numberOfSections()
        let numberOfRows = tableView.numberOfRowsInSection(numberOfSections-1)
        let indexPath = NSIndexPath(forRow: numberOfRows-1, inSection: (numberOfSections-1))
        
        if tableView.numberOfRowsInSection(numberOfSections-1)
            != 0 {
            tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: false)}

    }
    
    func keyBoardWillHide(notification: NSNotification) {

        self.tableView.contentInset = UIEdgeInsetsZero
        self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero

        self.view.frame.origin.y += 60
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = comments?.count {
            return count
        }
        return 0
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("commentCell", forIndexPath: indexPath) as! CommentTableViewCell
        cell.commentText?.text = comments![indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if self.footerView != nil {
            return self.footerView!.frame.height
        }
        return FOOTERHEIGHT
    }

    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: FOOTERHEIGHT))
        footerView?.backgroundColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1)
        commentView = UITextView(frame: CGRect(x: 10, y: 5, width: tableView.bounds.width - 80 , height: 40))
        commentView?.backgroundColor = UIColor.whiteColor()
        commentView?.textContainerInset = UIEdgeInsetsMake(5, 5, 5, 5)
        commentView?.layer.cornerRadius = 2
        commentView?.scrollsToTop = true
        
        footerView?.addSubview(commentView!)
        let button = UIButton(frame: CGRect(x: tableView.bounds.width - 65, y: 10, width: 60 , height: 30))
        button.setTitle("Reply", forState: UIControlState.Normal)
        button.titleLabel!.font =  UIFont(name: "HelveticaNeue-Light", size: 16)
        button.backgroundColor = UIColor(red: 20 / 255.0, green: 222 / 255.0, blue: 170 / 255.0, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: "reply", forControlEvents: UIControlEvents.TouchUpInside)
        footerView?.addSubview(button)
        commentView?.delegate = self
        return footerView
    }
    
    func textViewDidChange(textView: UITextView) {
        
        
        if (contentHeight == 0) {
            contentHeight = commentView!.contentSize.height
        }
        
        if(commentView!.contentSize.height != contentHeight && commentView!.contentSize.height > footerView!.bounds.height) {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                let myview = self.footerView
                println(self.commentView!.contentSize.height)
                println(self.commentView?.font.lineHeight)
                let newHeight : CGFloat = self.commentView!.font.lineHeight
                let myFrame = CGRect(x: myview!.frame.minX, y: myview!.frame.minY - newHeight , width: myview!.bounds.width, height: newHeight + myview!.bounds.height)
                myview?.frame = myFrame
                
                let mycommview = self.commentView
                let newCommHeight : CGFloat = self.commentView!.contentSize.height
                let myCommFrame = CGRect(x: mycommview!.frame.minX, y: mycommview!.frame.minY, width: mycommview!.bounds.width, height: newCommHeight)
                mycommview?.frame = myCommFrame
                
                self.commentView = mycommview
                self.footerView  = myview
                
                for item in self.footerView!.subviews {
                    if(item.isKindOfClass(UIButton.self)){
                        let button = item as! UIButton
                        let newY = self.footerView!.bounds.height / 2 - button.bounds.height / 2
                        let buttonFrame = CGRect(x: button.frame.minX, y: newY , width: button.bounds.width, height : button.bounds.height)
                        button.frame = buttonFrame
                        
                    }
                }
            })
            
            println(self.footerView?.frame)
            println(self.commentView?.frame)
            contentHeight = commentView!.contentSize.height
        }
        
        
    }
    
    func reply() {
        if commentView?.text != "" {
        
        yak?.addObject(commentView?.text, forKey: "comments")
        yak?.saveInBackground()
        if let tmpText = commentView?.text {
            comments?.append(tmpText)
        }
        commentView?.text = ""
        println(comments?.count)
        self.commentView?.resignFirstResponder()
        self.tableView.reloadData()
        let numberOfSections = tableView.numberOfSections()
        let numberOfRows = tableView.numberOfRowsInSection(numberOfSections-1)
        let indexPath = NSIndexPath(forRow: numberOfRows-1, inSection: (numberOfSections-1))
        if tableView.numberOfRowsInSection(numberOfSections-1) != 0 {
            tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: false)}
        //tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: numberOfRows-numberOfRows+1, inSection: (numberOfSections-1)), atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
        }
        
    }
}
