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
    var fromColors: [String]
    var gradient: GradientLayer
    
    init(name: String, fromColors: [String], gradient: GradientLayer) {
        self.name = name
        self.fromColors = fromColors
        self.gradient = gradient
    }
}
