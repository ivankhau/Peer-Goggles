//
//  advisefeedbackviewcontroller.swift
//  Finder
//
//  Created by Ivan Khau on 8/27/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class advisefeedbackviewcontroller: UITableViewController {
    
    var feedback: PFObject?
    var comments: [String]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if(feedback?.objectForKey("Comments") != nil) {
            comments = feedback?.objectForKey("Comments") as! [String]
            println(feedback?.objectForKey("Comments") as! [String])

        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        if let count = comments?.count {
        return count
        }
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("advisefeedback", forIndexPath: indexPath) as! UITableViewCell
        
        //cell.textLabel!.text = feedback as? String
        cell.textLabel?.text = comments![indexPath.row]
        
        // Configure the cell...

        return cell
    }


}
