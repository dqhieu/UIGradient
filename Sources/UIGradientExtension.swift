//
//  UIGradientExtension.swift
//  UIGradient
//
//  Created by Dinh Quang Hieu on 12/7/17.
//  Copyright © 2017 Dinh Quang Hieu. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func addGradientWithDirection(_ direction: GradientDirection, colors: [UIColor], cornerRadius: CGFloat = 0) {
        let gradientLayer = GradientLayer(direction: direction, colors: colors, cornerRadius: cornerRadius)
        self.addGradient(gradientLayer)
    }
    
    public func addGradient(_ gradientLayer: GradientLayer) {
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
    }
}

public extension UIColor {
    
    public static func hex(_ hex: String, alpha: CGFloat = 1.0) -> UIColor {
        guard let hex = Int(hex, radix: 16) else { return UIColor.clear }
        return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((hex & 0x00FF00) >> 8)) / 255.0,
                       blue: ((CGFloat)((hex & 0x0000FF) >> 0)) / 255.0,
                       alpha: alpha)
    }
    
    public static func fromGradient(_ gradient: GradientLayer, frame: CGRect) -> UIColor? {
        guard let image = UIImage.fromGradient(gradient, frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func fromGradientWithDirection(_ direction: GradientDirection, frame: CGRect, colors: [UIColor], cornerRadius: CGFloat = 0) -> UIColor? {
        let gradient = GradientLayer(direction: direction, colors: colors, cornerRadius: cornerRadius)
        return UIColor.fromGradient(gradient, frame: frame)
    }
}

public extension UIImage {
    
    public static func fromGradient(_ gradient: GradientLayer, frame: CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.main.scale)
        guard let ctx = UIGraphicsGetCurrentContext() else { return nil }
        gradient.frame = frame
        gradient.render(in: ctx)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
    
    public static func fromGradientWithDirection(_ direction: GradientDirection, frame: CGRect, colors: [UIColor], cornerRadius: CGFloat = 0) -> UIImage? {
        let gradient = GradientLayer(direction: direction, colors: colors, cornerRadius: cornerRadius)
        return UIImage.fromGradient(gradient, frame: frame)
    }
}

