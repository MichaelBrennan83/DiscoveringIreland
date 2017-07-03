//
//  TableViewCell.swift
//  DiscoveringIreland
//
//  Created by Michael Brennan on 11/04/2017.
//  Copyright © 2017 Michael Brennan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var countyImage: UIImageView!
    @IBOutlet weak var countyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
