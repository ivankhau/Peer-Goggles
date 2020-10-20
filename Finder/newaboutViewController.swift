//
//  newaboutViewController.swift
//  Finder
//
//  Created by Ivan Khau on 9/18/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class newaboutViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var abouttext: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        abouttext.delegate = self
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AvenirNext-DemiBold", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]

        // Do any additional setup after loading the view.
    }
    @IBAction func dismissabout(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {})
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
