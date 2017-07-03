//
//  webSiteViewController.swift
//  DiscoveringIreland
//
//  Created by Michael Brennan on 15/04/2017.
//  Copyright © 2017 Michael Brennan. All rights reserved.
//

import UIKit

class webSiteViewController: UIViewController {
    
    @IBOutlet weak var webSiteView: UIWebView!
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webSiteView.loadRequest(URLRequest(url: URL(string: url!)!))
    }
    
    @IBAction func forwardWebPage(_ sender: AnyObject) {
        webSiteView.goForward()
    }
    
    
    @IBAction func backWebPage(_ sender: AnyObject) {
        webSiteView.goBack()
    }
    
}
