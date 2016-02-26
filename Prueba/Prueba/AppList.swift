//
//  AppList.swift
//  Prueba
//
//  Created by Wilson Ricardo Erira Correa on 24/02/16.
//  Copyright © 2016 Wilson Ricardo Erira Correa. All rights reserved.
//

import UIKit
import ObjectMapper
class AppList:  Mappable{
 
        
        var feed : Feed?
        required init?(_ map: Map){
            
    }
    
    init()
    {
        //New Instance initialization goes here
    }

        func mapping(map: Map) {
            feed <- map["feed"]
 
        }
}
