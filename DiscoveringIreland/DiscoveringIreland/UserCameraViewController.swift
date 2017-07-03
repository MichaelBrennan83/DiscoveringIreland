//
//  UserCameraViewController.swift
//  DiscoveringIreland
//
//  Created by Michael Brennan on 20/04/2017.
//  Copyright © 2017 Michael Brennan. All rights reserved.
//

import UIKit


class UserCameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    
    @IBAction func useCamera(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func seePhotos(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)
        {
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func savePhoto(_ sender: AnyObject) {
        let imagedata = UIImageJPEGRepresentation(imageView.image!, 0.6)
        let compressImage = UIImage(data: imagedata!)
        UIImageWriteToSavedPhotosAlbum(compressImage!, nil, nil, nil)
        saveNotice()
    }
    
    func saveNotice(){
        let alertController = UIAlertController(title: "Image Saved", message: "Successfully", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}



