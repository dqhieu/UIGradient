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
    case custom(Int)
}

open class GradientLayer: CAGradientLayer {

    private var direction: GradientDirection = .bottomLeftToTopRight

    public init(direction: GradientDirection, colors: [UIColor], cornerRadius: CGFloat = 0, locations: [Double]? = nil) {
        super.init()
        self.direction = direction
        self.needsDisplayOnBoundsChange = true
        self.colors = colors.map { $0.cgColor as Any }
        let (startPoint, endPoint) = UIGradientHelper.getStartAndEndPointsOf(direction)
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.cornerRadius = cornerRadius
        self.locations = locations?.map { NSNumber(value: $0) }
    }
    
    public override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init()
    }
    
    public final func clone() -> GradientLayer {
        if let colors = self.colors {
            return GradientLayer(direction: self.direction, colors: colors.map { UIColor(cgColor: ($0 as! CGColor)) }, cornerRadius: self.cornerRadius, locations: self.locations?.map { $0.doubleValue } )
        }
        return GradientLayer(direction: self.direction, colors: [], cornerRadius: self.cornerRadius, locations: self.locations?.map { $0.doubleValue })
    }
}

public extension GradientLayer {
    static var oceanBlue: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight, colors: [UIColor.hex("2E3192"), UIColor.hex("1BFFFF")])
    }
    
    static var sanguine: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("D4145A"), UIColor.hex("FBB03B")])
    }
    
    static var lusciousLime: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("009245"), UIColor.hex("FCEE21")])
    }
    
    static var purpleLake: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("662D8C"), UIColor.hex("ED1E79")])
    }
    
    static var freshPapaya: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("ED1C24"), UIColor.hex("FCEE21")])
    }
    
    static var ultramarine: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("00A8C5"), UIColor.hex("FFFF7E")])
    }
    
    static var pinkSugar: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("D74177"), UIColor.hex("FFE98A")])
    }
    
    static var lemonDrizzle: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("FB872B"), UIColor.hex("D9E021")])
    }
    
    static var victoriaPurple: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("312A6C"), UIColor.hex("852D91")])
    }
    
    static var springGreens: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("009E00"), UIColor.hex("FFFF96")])
    }
    
    static var mysticMauve: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("B066FE"), UIColor.hex("63E2FF")])
    }
    
    static var reflexSilver: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("808080"), UIColor.hex("E6E6E6")])
    }
    
    static var neonGlow: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("00FFA1"), UIColor.hex("00FFFF")])
    }
    
    static var berrySmoothie: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("8E78FF"), UIColor.hex("FC7D7B")])
    }
    
    static var newLeaf: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("00537E"), UIColor.hex("3AA17E")])
    }
    
    static var cottonCandy: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("FCA5F1"), UIColor.hex("B5FFFF")])
    }
    
    static var pixieDust: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("D585FF"), UIColor.hex("00FFEE")])
    }
    
    static var fizzyPeach: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("F24645"), UIColor.hex("EBC08D")])
    }
    
    static var sweetDream: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("3A3897"), UIColor.hex("A3A1FF")])
    }
    
    static var firebrick: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("45145A"), UIColor.hex("FF5300")])
    }
    
    static var wroughtIron: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("333333"), UIColor.hex("5A5454")])
    }
    
    static var deepSea: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("4F00BC"), UIColor.hex("29ABE2")])
    }
    
    static var coastalBreeze: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("00B7FF"), UIColor.hex("FFFFC7")])
    }
    
    static var eveningDelight: GradientLayer {
        return GradientLayer(direction: .bottomLeftToTopRight , colors: [UIColor.hex("93278F"), UIColor.hex("00A99D")])
    }
}
