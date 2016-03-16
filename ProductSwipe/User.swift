//
//  User.swift
//  ProductSwipe
//
//  Created by Saul on 3/16/16.
//  Copyright © 2016 Saul. All rights reserved.
//

import Foundation


class User: NSObject{
    
    var name : String!
    var image : UIImage!

    init(name: String, image: UIImage) {
        super.init()
        self.name = name
        self.image = image
    }
    
}
