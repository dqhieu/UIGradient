//
//  UIGradientExtension.swift
//  UIGradient
//
//  Created by Dinh Quang Hieu on 12/7/17.
//  Copyright © 2017 Dinh Quang Hieu. All rights reserved.
//

import UIKit

public extension UIView {
    
    func addGradientWithDirection(_ direction: GradientDirection, colors: [UIColor], cornerRadius: CGFloat = 0, locations: [Double]? = nil) {
        let gradientLayer = GradientLayer(direction: direction, colors: colors, cornerRadius: cornerRadius, locations: locations)
        self.addGradient(gradientLayer)
    }
    
    func addGradient(_ gradientLayer: GradientLayer, cornerRadius: CGFloat = 0) {
        let cloneGradient = gradientLayer.clone()
        cloneGradient.frame = self.bounds
        cloneGradient.cornerRadius = cornerRadius
        self.layer.addSublayer(cloneGradient)
    }
}

public extension UIColor {
    
    static func hex(_ hex: String, alpha: CGFloat = 1.0) -> UIColor {
        guard let hex = Int(hex, radix: 16) else { return UIColor.clear }
        return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((hex & 0x00FF00) >> 8)) / 255.0,
                       blue: ((CGFloat)((hex & 0x0000FF) >> 0)) / 255.0,
                       alpha: alpha)
    }
    
    static func fromGradient(_ gradient: GradientLayer, frame: CGRect, cornerRadius: CGFloat = 0) -> UIColor? {
        guard let image = UIImage.fromGradient(gradient, frame: frame, cornerRadius: cornerRadius) else { return nil }
        return UIColor(patternImage: image)
    }
    
    static func fromGradientWithDirection(_ direction: GradientDirection, frame: CGRect, colors: [UIColor], cornerRadius: CGFloat = 0, locations: [Double]? = nil) -> UIColor? {
        let gradient = GradientLayer(direction: direction, colors: colors, cornerRadius: cornerRadius, locations: locations)
        return UIColor.fromGradient(gradient, frame: frame)
    }
}

public extension UIImage {
    
    static func fromGradient(_ gradient: GradientLayer, frame: CGRect, cornerRadius: CGFloat = 0) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.main.scale)
        guard let ctx = UIGraphicsGetCurrentContext() else { return nil }
        let cloneGradient = gradient.clone()
        cloneGradient.frame = frame
        cloneGradient.cornerRadius = cornerRadius
        cloneGradient.render(in: ctx)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
    
    static func fromGradientWithDirection(_ direction: GradientDirection, frame: CGRect, colors: [UIColor], cornerRadius: CGFloat = 0, locations: [Double]? = nil) -> UIImage? {
        let gradient = GradientLayer(direction: direction, colors: colors, cornerRadius: cornerRadius, locations: locations)
        return UIImage.fromGradient(gradient, frame: frame)
    }

}
