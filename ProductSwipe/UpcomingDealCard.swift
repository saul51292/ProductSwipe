//
//  UpcomingDealCard.swift
//  ProductSwipe
//
//  Created by Saul on 5/4/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class UpcomingDealCard: NSObject {
    var time : String!
    var companyLogo : UIImage!
    var image : UIImage!
    
    init(time: String, companyLogo: UIImage, image: UIImage) {
        super.init()
        self.time = time
        self.companyLogo = companyLogo
        self.image = image
    }

}
