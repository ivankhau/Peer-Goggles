//
//  mainTabBarController.swift
//  Finder
//
//  Created by Ivan Khau on 7/15/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit

extension UIImage {
    func imageWithColor(tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext() as CGContextRef
        CGContextTranslateCTM(context, 0, self.size.height)
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextSetBlendMode(context, kCGBlendModeNormal)
        
        let rect = CGRectMake(0, 0, self.size.width, self.size.height) as CGRect
        CGContextClipToMask(context, rect, self.CGImage)
        tintColor.setFill()
        CGContextFillRect(context, rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}


class mainTabBarController: UITabBarController {
    
    //override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
    //    if item.title == "Custom Pack" {
        //if UIViewController.title.isequal(title: "PackFeedViewController") {
    //        self.performSegueWithIdentifier("gotopacksegue", sender: self)
    //    }
    //}
    //var tabBarController = segue.destinationViewController as UITabBarController;
    //var destinationViewController = tabBarController.viewControllers[0] as YourViewController // or whatever tab index you're trying to access
   // destinationViewController.property = "some value"
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "customtopack" {
            self.performSegueWithIdentifier("topacksegue", sender: self)
        }
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in self.tabBar.items as! [UITabBarItem] {
            if let image = item.image {
                //item.image = image.imageWithColor(UIColor(red: 2 / 255.0, green: 24 / 255.0, blue: 18 / 255.0, alpha: 0.8)).imageWithRenderingMode(.AlwaysOriginal)
                item.image = image.imageWithColor(UIColor.darkGrayColor()).imageWithRenderingMode(.AlwaysOriginal)
            }
        }

        // Do any additional setup after loading the view.
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
