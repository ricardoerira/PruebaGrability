//
//  AttributesCategory.swift
//  Prueba
//
//  Created by Wilson Ricardo Erira Correa on 24/02/16.
//  Copyright © 2016 Wilson Ricardo Erira Correa. All rights reserved.
//

import UIKit


import UIKit

import ObjectMapper
class AttributesCategory: Mappable
    
{
    
    var id: String?
    var term:  String?
    var scheme:  String?
    var label:  String?
    
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["im:id"]
        term <- map["term"]
        scheme <- map["scheme"]
        label <- map["label"]
        
    }
}