//
//  AppTableViewCell.swift
//  Prueba
//
//  Created by Wilson Ricardo Erira Correa on 24/02/16.
//  Copyright © 2016 Wilson Ricardo Erira Correa. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageApp: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
      
        // Configure the view for the selected state
    }

}
