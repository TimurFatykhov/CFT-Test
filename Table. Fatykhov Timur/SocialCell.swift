//
//  SocialCell.swift
//  Table. Fatykhov Timur
//
//  Created by Educational on 27/05/17.
//  Copyright © 2017 Educational. All rights reserved.
//

import UIKit

class SocialCell: UITableViewCell
{
    @IBOutlet weak var labelCaption: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelLink: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    
    // Fill a social cell
    func setOptions(options : [String : String])
    {
        labelCaption.text = options["title"]!
        labelDate.text = options["date"]!
        labelLink.text = options["source"]!
        imageIcon.image = UIImage(named: options["network"]!)
    }
}
