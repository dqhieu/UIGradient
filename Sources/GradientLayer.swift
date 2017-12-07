//
//  GradientLayer.swift
//  UIGradient
//
//  Created by Dinh Quang Hieu on 12/7/17.
//  Copyright © 2017 Dinh Quang Hieu. All rights reserved.
//

import UIKit

public enum GradientDirection {
    case topToBottom
    case bottomToTop
    case leftToRight
    case rightToLeft
    case topLeftToBottomRight
    case topRightToBottomLeft
    case bottomLeftToTopRight
    case bottomRightToTopLeft
}

open class GradientLayer: CAGradientLayer {
    
    private var direction: GradientDirection = .leftToRight
    
    public init(direction: GradientDirection, colors: [UIColor], cornerRadius: CGFloat = 0) {
        super.init()
        self.needsDisplayOnBoundsChange = true
        self.colors = colors.map { $0.cgColor as Any}
        self.direction = direction
        let (startPoint, endPoint) = GradientKitHelper.getStartEndPointOf(self.direction)
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.cornerRadius = cornerRadius
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init()
    }
}
