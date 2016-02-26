//
//  Entry.swift
//  Prueba
//
//  Created by Wilson Ricardo Erira Correa on 24/02/16.
//  Copyright © 2016 Wilson Ricardo Erira Correa. All rights reserved.
//

import UIKit

import ObjectMapper
class Entry: Mappable
    
{
    var title : TypeString?
    var summary : TypeString?
    var image : [Images]?
    var category : Category?
    
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        image <- map["im:image"]
        summary <- map["summary"]
        category <- map["category"]

    }
}
