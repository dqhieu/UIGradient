//
//  GradientPattern.swift
//  UIGradientExample
//
//  Created by Dinh Quang Hieu on 12/9/17.
//  Copyright © 2017 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class GradientPattern: NSObject {
    var name: String
    var fromColor: String
    var toColor: String
    var gradient: GradientLayer
    
    init(name: String, fromColor: String, toColor: String, gradient: GradientLayer) {
        self.name = name
        self.fromColor = fromColor
        self.toColor = toColor
        self.gradient = gradient
    }
}
