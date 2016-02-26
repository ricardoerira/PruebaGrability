

//
//  DeserealizeService.swift
//  Prueba
//
//  Created by Wilson Ricardo Erira Correa on 24/02/16.
//  Copyright © 2016 Wilson Ricardo Erira Correa. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

protocol ReloadTableDelegate{
    
    func reload()
    var appList : AppList? { get set }
}
class DeserealizeService: NSObject {
    var delegate : ReloadTableDelegate?
    var saveFile : SaveFile?
    func  deserealizeItunesService()
    {
        var appList: AppList = AppList.init()
        Alamofire.request(.POST, "https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json", parameters:nil, encoding: .JSON).validate().responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            
            switch response.result {
            case let .Success(valueJSON):
                appList = Mapper<AppList>().map(valueJSON)!
                self.delegate?.appList=appList;
                        self.saveFile = SaveFile.init()
                self.delegate?.reload()
                self.saveFile?.saveFile(valueJSON as! String)
            case .Failure(let _):
                let datos:String = (self.saveFile?.readFile())!
                appList = Mapper<AppList>().map(datos)!
                
                print ("Error")
            }
            
            
        }
        
        
        
    }
    
    override init()
    {
        //New Instance initialization goes here
    }
    
    
}
