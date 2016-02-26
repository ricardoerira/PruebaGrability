//
//  Images.swift
//  Prueba
//
//  Created by Wilson Ricardo Erira Correa on 24/02/16.
//  Copyright © 2016 Wilson Ricardo Erira Correa. All rights reserved.
//

import UIKit

import ObjectMapper
class Images: Mappable
    
{
    var label : String?
    var attributes : Attributes?
    
    
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        label <- map["label"]
        attributes <- map["attributes"]

        
    }
}