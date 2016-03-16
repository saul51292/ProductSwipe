//
//  Bumper.swift
//  ProductSwipe
//
//  Created by Saul on 3/16/16.
//  Copyright © 2016 Saul. All rights reserved.
//
import Foundation


class Bumper: NSObject{
   
   // var user : User!
    var title: String!
    var postDate: String!
    var numberOfListens: Int!
    var backgroundImageName : String!

    init( title: String, postDate: String, numberOfListens:Int,backgroundImageName: String) {
        super.init()
       // self.user = user
        self.title = title
        self.postDate = postDate
        self.numberOfListens = numberOfListens
        self.backgroundImageName = backgroundImageName
    }
    
}
