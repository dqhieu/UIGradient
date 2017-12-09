//
//  GradientViewController.swift
//  UIGradientExample
//
//  Created by Dinh Quang Hieu on 12/9/17.
//  Copyright © 2017 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class GradientViewController: UIViewController {

    var gradientPattern: GradientPattern!
    var imageView: UIImageView!
    var lblGradientName: UILabel!
    var lblGradientColors: UILabel!
    var lblFromColor: UILabel!
    var lblToColor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
        
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width * 4 / 5)
        imageView = UIImageView(frame: frame)
        imageView.image = UIImage.fromGradient(gradientPattern.gradient, frame: frame, cornerRadius: 10)
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        
        lblGradientName = UILabel()
        lblGradientName.text = gradientPattern.name
        lblGradientName.textColor = UIColor.fromGradient(gradientPattern.gradient, frame: CGRect(origin: .zero, size: lblGradientName.sizeThatFits(.zero)))
        lblGradientName.frame = CGRect(x: 0, y: imageView.frame.origin.y - 20, width: self.view.frame.width, height: 20)
        lblGradientName.center.x = imageView.center.x
        self.view.addSubview(lblGradientName)
        
        let fromColorsText = NSMutableAttributedString(string: "", attributes: nil)
        fromColorsText.append(NSAttributedString(string: "#\(gradientPattern.fromColor)", attributes: [NSForegroundColorAttributeName : UIColor.hex(gradientPattern.fromColor)]))
        fromColorsText.append(NSAttributedString(string: " → ", attributes: [NSForegroundColorAttributeName : UIColor.white]))
        fromColorsText.append(NSAttributedString(string: "#\(gradientPattern.toColor)", attributes: [NSForegroundColorAttributeName : UIColor.hex(gradientPattern.toColor)]))
        
        lblGradientColors = UILabel()
        lblGradientColors.attributedText = fromColorsText
        lblGradientColors.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: 20)
        self.view.addSubview(lblGradientColors)
    }
    
    @objc func handleTapGesture() {
        self.dismiss(animated: true, completion: nil)
    }

}
