//
//  ImageViewController.swift
//  Table. Fatykhov Timur
//
//  Created by Educational on 28/05/17.
//  Copyright © 2017 Educational. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var image : UIImage? = nil
    @IBOutlet weak var imageFullScreen: UIImageView!
    
    override func viewWillAppear(_ animated: Bool)
    {
        // Show full screen picture
        imageFullScreen.image = image!
    }

}
