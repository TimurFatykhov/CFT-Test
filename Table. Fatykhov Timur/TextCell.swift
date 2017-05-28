//
//  TextCell.swift
//  Table. Fatykhov Timur
//
//  Created by Educational on 27/05/17.
//  Copyright © 2017 Educational. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell
{    
    @IBOutlet weak var labelCaption: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    // Fill a text cell
    func setOptions(options : [String : String])
    {
        labelCaption.text = options["title"]!
        labelDate.text = options["date"]!
        labelMessage.text = options["content"]!
    }
}
