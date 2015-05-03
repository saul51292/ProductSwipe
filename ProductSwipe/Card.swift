//
//  Card.swift
//  ProductSwipe
//
//  Created by Saul on 5/1/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import Foundation


class Card: NSObject{
    var name : String!
    var company : String!
    var image : UIImage!
    
    init(name: String, company: String, image: UIImage) {
        super.init()
        self.name = name
        self.company = company
        self.image = image
    }
    
}
