//
//  ViewController.swift
//  DiscoveringIreland
//
//  Created by Michael Brennan on 11/04/2017.
//  Copyright © 2017 Michael Brennan. All rights reserved.


import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var countyArray = [IrelandCounties]()
    
    final let urlString = "http://demo2167950.mockable.io/introducingIreland"
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadJsonWithURL()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func downloadJsonWithURL() {
        
        let url = NSURL(string: urlString)
        
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                if let actorArray = jsonObj!.value(forKey: "IrelandCounties") as? NSArray {
                    for county in actorArray{
                        
                        if let countyDict = county as? NSDictionary {
                            
                            let couStr: String = {
                                if let county = countyDict.value(forKey: "county") {
                                    return county as! String
                                }
                                return "dummy cou"
                            }()
                            
                            let desStr: String = {
                                
                                if let description = countyDict.value(forKey: "description") {
                                    return description as! String
                                }
                                return "dummy des"
                            }()
                            
                            let imgStr: String = {
                                
                                if let image = countyDict.value(forKey: "image") {
                                    return image as! String
                                }
                                return "dummy img"
                            }()
                            
                            let url: String = {
                                
                                if let urlSite = countyDict.value(forKey: "urlWebSite") {
                                    return urlSite as! String
                                }
                                return "dummy url"
                            }()
                            
                            self.countyArray.append(IrelandCounties(county: couStr, description: desStr, image: imgStr, url: url))
                            
                            DispatchQueue.main.async{
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }).resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        
        let county = countyArray[indexPath.row]
        
        let imgURL = NSURL(string: county.image)
        
        
        DispatchQueue.global(qos: .userInteractive).async {
            if imgURL != nil {
                let data = NSData(contentsOf: (imgURL as URL?)!)
                
                DispatchQueue.main.async {
                    cell.countyImage.image = UIImage(data: data! as Data)
                    cell.countyLabel.text = county.county
                    cell.descriptionLabel.text = county.description
                }
            }
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        let webSiteVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! webSiteViewController
        
        webSiteVC.url = self.countyArray[indexPath.row].url
        
        self.present(webSiteVC, animated: true, completion: nil)
        
        
        return indexPath
        
    }
}




