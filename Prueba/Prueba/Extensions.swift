//
//  Extensions.swift
//  Prueba
//
//  Created by Wilson Ricardo Erira Correa on 25/02/16.
//  Copyright © 2016 Wilson Ricardo Erira Correa. All rights reserved.
//

import Foundation
import UIKit
import ObjectiveC

extension UIImageView {
    func downloadImageFromURL(url : String)
    {
        let url = NSURL(string:url)
        let data = NSData(contentsOfURL:url!)
        if data != nil {
            self.image = UIImage(data:data!)
            self.contentMode = UIViewContentMode.ScaleAspectFit
        }
    }
}