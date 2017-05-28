//
//  ImageCell.swift
//  Table. Fatykhov Timur
//
//  Created by Educational on 27/05/17.
//  Copyright © 2017 Educational. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell
{
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelCaption: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    
    // Fill a image cell
    func setOptions(options : [String : String])
    {
        labelCaption.text = options["title"]!
        labelDate.text = options["date"]!

        let imageURL: URL = URL(string: options["source"]!)!
        let queue = DispatchQueue.global(qos: .utility)
        queue.async
            {
                if let data = try? Data(contentsOf: imageURL)
                {
                    DispatchQueue.main.async
                    {
                        self.imageIcon.image = UIImage(data: data)
                        print("Show image data")
                    }
                    print("Did download image data")
                }
            }
    }

}
