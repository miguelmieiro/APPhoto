//
//  ViewController.swift
//  APPhoto
//
//  Created by Miguel Mieiro on 08/10/2018.
//  Copyright © 2018 Miguel Mieiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images: [UIImage]!
    var image1 = UIImage(named: "home-1")
    var image2 = UIImage(named: "home-2")
    var image3 = UIImage(named: "home-3")
    var image4 = UIImage(named: "home-4")
    var image5 = UIImage(named: "home-5")
    
    var animatedImages: UIImage!
    
    @IBOutlet weak var backImages: UIImageView!
    @IBAction func buttonPortfolio(_ sender: UIButton) {
    }
    @IBAction func buttonContacts(_ sender: UIButton) {
    }
    @IBAction func buttonHome(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        images = [image1, image2, image3, image4, image5] as? [UIImage]
        
        animatedImages = UIImage.animatedImage(with: images, duration: 20.0)

        backImages.image = animatedImages
    }


    
}

