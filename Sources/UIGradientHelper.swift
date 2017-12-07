//
//  UIGradientHelper.swift
//  UIGradient
//
//  Created by Dinh Quang Hieu on 12/7/17.
//  Copyright © 2017 Dinh Quang Hieu. All rights reserved.
//

import UIKit

open class GradientKitHelper {
    open static func getStartEndPointOf(_ gradientDirection: GradientDirection) -> (startPoint: CGPoint, endPoint: CGPoint) {
        switch gradientDirection {
        case .topToBottom:
            return (CGPoint(x: 0.5, y: 0.0), CGPoint(x: 0.5, y: 1.0))
        case .bottomToTop:
            return (CGPoint(x: 0.5, y: 1.0), CGPoint(x: 0.5, y: 0.0))
        case .leftToRight:
            return (CGPoint(x: 0.0, y: 0.5), CGPoint(x: 1.0, y: 0.5))
        case .rightToLeft:
            return (CGPoint(x: 1.0, y: 0.5), CGPoint(x: 0.0, y: 0.5))
        case .topLeftToBottomRight:
            return (CGPoint.zero, CGPoint(x: 1.0, y: 1.0))
        case .topRightToBottomLeft:
            return (CGPoint(x: 0.1, y: 0.0), CGPoint(x: 0.0, y: 1.0))
        case .bottomLeftToTopRight:
            return (CGPoint(x: 0.0, y: 1.0), CGPoint(x: 1.0, y: 0.0))
        case .bottomRightToTopLeft:
            return (CGPoint(x: 1.0, y: 1.0), CGPoint(x: 0.0, y: 0.0))
        }
    }
}

