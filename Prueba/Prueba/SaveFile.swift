//
//  SaveFile.swift
//  Prueba
//
//  Created by Wilson Ricardo Erira Correa on 26/02/16.
//  Copyright © 2016 Wilson Ricardo Erira Correa. All rights reserved.
//

import UIKit

class SaveFile: NSObject {
    
    
    
    func saveFile(json:String)
    {
        
        let filePath = NSHomeDirectory() + "/Library/Caches/apps.json"
        
        
        let text = "some text" //just a text
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent(filePath);
            
            //writing
            do {
                try text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
            }
            catch {/* error handling here */}
          readFile()
            
     
        }
    
    }
    func readFile() ->String
    {
        var readString: String
        let filePath = NSHomeDirectory() + "/Library/Caches/apps.json"
        do {
            readString = try NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding) as String
            return readString
        } catch let error as NSError {
                 print(error.description)
            return ""
       
        }
    
    }
    
    
    
    
    
    override init()
    {
        //New Instance initialization goes here
    }

}
