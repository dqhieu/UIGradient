//
//  UIGradientHelper.swift
//  UIGradient
//
//  Created by Dinh Quang Hieu on 12/7/17.
//  Copyright © 2017 Dinh Quang Hieu. All rights reserved.
//

import UIKit

open class UIGradientHelper {
    
    public static func getStartAndEndPointsOf(_ gradientDirection: GradientDirection) -> (startPoint: CGPoint, endPoint: CGPoint) {
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
            return (CGPoint(x: 1.0, y: 0.0), CGPoint(x: 0.0, y: 1.0))
        case .bottomLeftToTopRight:
            return (CGPoint(x: 0.0, y: 1.0), CGPoint(x: 1.0, y: 0.0))
        case .bottomRightToTopLeft:
            return (CGPoint(x: 1.0, y: 1.0), CGPoint(x: 0.0, y: 0.0))
        case .custom(let angle):
            return startAndEndPoints(from: angle)
        }
    }

    public static func startAndEndPoints(from angle: Int) -> (startPoint:CGPoint, endPoint:CGPoint) {
        // Set default points for angle of 0°
        var startPointX: CGFloat = 0.5
        var startPointY: CGFloat = 1.0

        // Define point objects
        var startPoint: CGPoint
        var endPoint: CGPoint

        // Define points
        switch true {
        // Define known points
        case angle == 0:
            startPointX = 0.5
            startPointY = 1.0
        case angle == 45:
            startPointX = 0.0
            startPointY = 1.0
        case angle == 90:
            startPointX = 0.0
            startPointY = 0.5
        case angle == 135:
            startPointX = 0.0
            startPointY = 0.0
        case angle == 180:
            startPointX = 0.5
            startPointY = 0.0
        case angle == 225:
            startPointX = 1.0
            startPointY = 0.0
        case angle == 270:
            startPointX = 1.0
            startPointY = 0.5
        case angle == 315:
            startPointX = 1.0
            startPointY = 1.0
        // Define calculated points
        case angle > 315 || angle < 45:
            startPointX = 0.5 - CGFloat(tan(angle.degreesToRads()) * 0.5)
            startPointY = 1.0
        case angle > 45 && angle < 135:
            startPointX = 0.0
            startPointY = 0.5 + CGFloat(tan(90.degreesToRads() - angle.degreesToRads()) * 0.5)
        case angle > 135 && angle < 225:
            startPointX = 0.5 - CGFloat(tan(180.degreesToRads() - angle.degreesToRads()) * 0.5)
            startPointY = 0.0
        case angle > 225 && angle < 359:
            startPointX = 1.0
            startPointY = 0.5 - CGFloat(tan(270.degreesToRads() - angle.degreesToRads()) * 0.5)
        default: break
        }
        // Build return CGPoints
        startPoint = CGPoint(x: startPointX, y: startPointY)
        endPoint = startPoint.opposite()
        // Return CGPoints
        return (startPoint, endPoint)
    }
}

extension Int {

    func degreesToRads() -> Double {
        return (Double(self) * .pi / 180)
    }
}

extension CGPoint {

    func opposite() -> CGPoint {
        // Create New Point
        var oppositePoint = CGPoint()
        // Get Origin Data
        let originXValue = self.x
        let originYValue = self.y
        // Convert Points and Update New Point
        oppositePoint.x = 1.0 - originXValue
        oppositePoint.y = 1.0 - originYValue
        return oppositePoint
    }
}
