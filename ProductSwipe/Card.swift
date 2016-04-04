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
    var image : UIImage!
    var link : NSURL!
    
    init(name: String, image: UIImage,link:NSURL) {
        super.init()
        self.name = name
        self.image = image
        self.link = link
    }
    
}
