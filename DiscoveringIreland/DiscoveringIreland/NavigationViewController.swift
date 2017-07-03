//
//  NavigationViewController.swift
//  DiscoveringIreland
//
//  Created by Michael Brennan on 18/04/2017.
//  Copyright © 2017 Michael Brennan. All rights reserved.
//

import UIKit

class NavigationViewController: UIViewController {
    
    
    @IBAction func Infobutton(_ sender: AnyObject) {
        let webSiteVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Counties") as! ViewController
        self.present(webSiteVC, animated: true, completion: nil)
    }
    
    
    @IBAction func locationButton(_ sender: AnyObject) {
        let webSiteVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Location") as! MapViewController
        self.present(webSiteVC, animated: true, completion: nil)
    }
    
    
    @IBAction func cameraButton(_ sender: AnyObject) {
        let webSiteVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Camera") as! UserCameraViewController
        self.present(webSiteVC, animated: true, completion: nil)
    }
    
}
