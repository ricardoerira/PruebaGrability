//
//  Tittle.swift
//  Prueba
//
//  Created by Wilson Ricardo Erira Correa on 24/02/16.
//  Copyright © 2016 Wilson Ricardo Erira Correa. All rights reserved.
//

import UIKit

import ObjectMapper
class TypeString: Mappable
    
{
    
    var label: String?
    
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        label <- map["label"]
        
    }
}