//
//  ViewController.swift
//  UIGradientExample
//
//  Created by Dinh Quang Hieu on 12/7/17.
//  Copyright © 2017 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300))
        imageView.center = self.view.center
        imageView.image = GradientImage.lusciousLime(frame: imageView.frame)
        self.view.addSubview(imageView)
    }
}

