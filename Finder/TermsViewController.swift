//
//  TermsViewController.swift
//  Finder
//
//  Created by djay mac on 03/02/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backB: UIButton!
    var backBt = true
    
    //NSBundle.mainBundle().URLForResource("Peer Goggles TOS PP Combined", withExtension:"htm")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let url = NSBundle.mainBundle().URLForResource("Peer Goggles TOS PP Combined", withExtension:"htm")
        //let request = NSURLRequest(URL: url!)
        
        
                //webView.loadRequest(request)
        
        let url = NSURL (string: "http://www.peergogglesapp.com/privacy.html")
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj)
        
        
        //var url:NSURL = NSURL(string: termsUrl)!
        //var req:NSURLRequest = NSURLRequest(URL: url)
        //webView.loadRequest(req)
        
        if backBt == false {
            backB.hidden = false
        }
        
        
    }
    @IBAction func back2(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }

    
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

}
