//
//  DetailViewController.swift
//  Prueba
//
//  Created by Wilson Ricardo Erira Correa on 25/02/16.
//  Copyright © 2016 Wilson Ricardo Erira Correa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var labelsumary: UITextView!
    @IBOutlet weak var imageApp: UIImageView!
    @IBOutlet weak var lableTitle: UILabel!
    var entry : Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        
        
        
        // Do any additional setup after loading the view.
    }
    func setData()
    {
        self.labelsumary.text = entry?.summary?.label
        
        let url: String = (entry?.image![2].label)!
        imageApp.downloadImageFromURL( url)
        self.lableTitle.text=entry?.title?.label
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
