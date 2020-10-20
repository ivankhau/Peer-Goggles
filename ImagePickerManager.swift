//
//  ImagePickerManager.swift
//  Finder
//
//  Created by Ivan Khau on 7/2/15.
//  Copyright (c) 2015 DJay. All rights reserved.
//

import Foundation
import UIKit

typealias ImagePickerManagerCallback = (image: UIImage, source: UIImagePickerControllerSourceType) -> ()

class ImagePickerManager: NSObject, UIActionSheetDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    class var sharedManager :ImagePickerManager {
        struct Singleton {
            static let instance = ImagePickerManager()
        }
        return Singleton.instance
    }
    
    private var parentViewController: UIViewController?
    

    private var completionHandler: ImagePickerManagerCallback?
    

    private let actionSheet = UIActionSheet(title: nil, delegate: nil, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Take Photo", "Choose Existing")
    
    func presentImagePicker(viewController: UIViewController, completionHandler: ImagePickerManagerCallback) -> () {
        
        self.completionHandler = completionHandler
        

        parentViewController = viewController
        
        actionSheet.delegate = self
        actionSheet.showInView(parentViewController?.view)
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        var sourceType: UIImagePickerControllerSourceType
        switch actionSheet.buttonTitleAtIndex(buttonIndex) {
        case "Choose Existing": sourceType = .PhotoLibrary
        case "Take Photo": sourceType = .Camera
        default: return
        }
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        

        parentViewController?.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        completionHandler?(image: info[UIImagePickerControllerEditedImage] as! UIImage, source: picker.sourceType)
        
        dismissImagePicker()
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissImagePicker()
    }
    
    func dismissImagePicker() {
        parentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
}



