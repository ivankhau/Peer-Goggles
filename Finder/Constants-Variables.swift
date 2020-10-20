//
//  Constants-Variables.swift
//  Finder
//
//  Created by djay mac on 27/01/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import UIKit




let phonewidth = UIScreen.mainScreen().bounds.width
let phoneheight = UIScreen.mainScreen().bounds.height

let Device = UIDevice.currentDevice()

let iosVersion = NSString(string: Device.systemVersion).doubleValue

let iOS8 = iosVersion >= 8
let iOS7 = iosVersion >= 7 && iosVersion < 8



let storyb = UIStoryboard(name: "Main", bundle: nil)

var currentuser = PFUser.currentUser()
let userpf = PFUser()
var justSignedUp = false

var distance:CGFloat = phonewidth/22    // distance between card view origin X
var navHeight:CGFloat = 64 // navigation Bar Height
var tabHeight:CGFloat = 49
var yesnoButtonHeight:CGFloat = 90
var cardHeight:CGFloat = phoneheight - (navHeight + tabHeight + yesnoButtonHeight)
//var frontCardFrame = CGRectMake(distance, (UIScreen.mainScreen().bounds.height/7) + 5 - 67, phonewidth - distance*2, UIScreen.mainScreen().bounds.height * 0.60 )
//var backCardFrame = CGRectMake(distance - 3, (UIScreen.mainScreen().bounds.height/7) + 8 - 67, phonewidth - distance*2, UIScreen.mainScreen().bounds.height * 0.60)

//var frontCardFrame = CGRectMake(2, (UIScreen.mainScreen().bounds.height/7) + 5 - 67 - distance, phonewidth - 4, (UIScreen.mainScreen().bounds.height * 0.60) + distance + 10)
//var backCardFrame = CGRectMake(2, (UIScreen.mainScreen().bounds.height/7) + 8 - 67 - distance, phonewidth - 4, (UIScreen.mainScreen().bounds.height * 0.60) + distance + 10)


//var frontCardFrame = CGRectMake(2, (UIScreen.mainScreen().bounds.height/27), phonewidth - 4, (UIScreen.mainScreen().bounds.height * 0.60) + distance + 10)
//var backCardFrame = CGRectMake(2, (UIScreen.mainScreen().bounds.height/27), phonewidth - 4, (UIScreen.mainScreen().bounds.height * 0.60) + distance + 10)

var frontCardFrame = CGRectMake(2, (UIScreen.mainScreen().bounds.height/27) - 3, phonewidth - 4, (UIScreen.mainScreen().bounds.height * 0.65))
var backCardFrame = CGRectMake(2, (UIScreen.mainScreen().bounds.height/27), phonewidth - 4, (UIScreen.mainScreen().bounds.height * 0.65))





//(UIScreen.mainScreen().bounds.height/7) + 10 + UIScreen.mainScreen().bounds.height * 0.60


func scaleImage(imagename:String, and newSize:CGSize)->UIImage{
    var image = UIImage(named: imagename)
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
    image?.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
    var newImg = UIGraphicsGetImageFromCurrentImageContext()
    return newImg
}









