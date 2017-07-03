//
//  Model.swift
//  DiscoveringIreland
//
//  Created by Michael Brennan on 11/04/2017.
//  Copyright © 2017 Michael Brennan. All rights reserved.
//

import UIKit

class IrelandCounties{
    
    let county:String!
    let description:String!
    let image:String!
    let url: String!
    
    init(county:String, description:String, image:String, url:String){
        self.county = county
        self.description = description
        self.image = image
        self.url = url
    }
}

