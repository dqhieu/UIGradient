//
//  UIGradient.swift
//  UIGradient
//
//  Created by Dinh Quang Hieu on 12/7/17.
//  Copyright © 2017 Dinh Quang Hieu. All rights reserved.
//

import UIKit

public struct GradientImage {
    public static func oceanBlue(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("2E3192"), UIColor.hex("1BFFFF")])
    }
    
    public static func sanguine(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("D4145A"), UIColor.hex("FBB03B")])
    }
    
    public static func lusciousLime(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("009245"), UIColor.hex("FCEE21")])
    }
    
    public static func purpleLake(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("662D8C"), UIColor.hex("ED1E79")])
    }
    
    public static func freshPapaya(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("ED1C24"), UIColor.hex("FCEE21")])
    }
    
    public static func ultramarine(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("00A8C5"), UIColor.hex("FFFF7E")])
    }
    
    public static func pinkSugar(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("D74177"), UIColor.hex("FFE98A")])
    }
    
    public static func lemonDrizzle(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("FB872B"), UIColor.hex("D9E021")])
    }
    
    public static func victoriaPurple(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("312A6C"), UIColor.hex("852D91")])
    }
    
    public static func springGreens(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("009E00"), UIColor.hex("FFFF96")])
    }
    
    public static func mysticMauve(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("B066FE"), UIColor.hex("63E2FF")])
    }
    
    public static func reflexSilver(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("808080"), UIColor.hex("E6E6E6")])
    }
    
    public static func neonGlow(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("00FFA1"), UIColor.hex("00FFFF")])
    }
    
    public static func berrySmoothie(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("8E78FF"), UIColor.hex("FC7D7B")])
    }
    
    public static func newLeaf(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("00537E"), UIColor.hex("3AA17E")])
    }
    
    public static func cottonCandy(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("FCA5F1"), UIColor.hex("B5FFFF")])
    }
    
    public static func pixieDust(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("D585FF"), UIColor.hex("00FFEE")])
    }
    
    public static func fizzyPeach(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("F24645"), UIColor.hex("EBC08D")])
    }
    
    public static func sweetDream(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("3A3897"), UIColor.hex("A3A1FF")])
    }
    
    public static func firebrick(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("45145A"), UIColor.hex("FF5300")])
    }
    
    public static func wroughtIron(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("333333"), UIColor.hex("5A5454")])
    }
    
    public static func deepSea(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("4F00BC"), UIColor.hex("29ABE2")])
    }
    
    public static func coastalBreeze(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("00B7FF"), UIColor.hex("FFFFC7")])
    }
    
    public static func eveningDelight(frame: CGRect) -> UIImage? {
        return UIImage.fromGradientWithDirection(.bottomLeftToTopRight, frame: frame, colors: [UIColor.hex("93278F"), UIColor.hex("00A99D")])
    }
    
    
}

public struct GradientColor {
    public static func oceanBlue(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.oceanBlue(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func sanguine(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.sanguine(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func lusciousLime(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.lusciousLime(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func purpleLake(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.purpleLake(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func freshPapaya(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.freshPapaya(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func ultramarine(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.ultramarine(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func pinkSugar(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.pinkSugar(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func lemonDrizzle(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.lemonDrizzle(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func victoriaPurple(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.victoriaPurple(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func springGreens(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.springGreens(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func mysticMauve(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.mysticMauve(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func reflexSilver(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.reflexSilver(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func neonGlow(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.neonGlow(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func berrySmoothie(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.berrySmoothie(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func newLeaf(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.newLeaf(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func cottonCandy(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.cottonCandy(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func pixieDust(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.pixieDust(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func fizzyPeach(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.fizzyPeach(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func sweetDream(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.sweetDream(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func firebrick(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.firebrick(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func wroughtIron(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.wroughtIron(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func deepSea(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.deepSea(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func coastalBreeze(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.coastalBreeze(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
    
    public static func eveningDelight(frame: CGRect) -> UIColor? {
        guard let image = GradientImage.eveningDelight(frame: frame) else { return nil }
        return UIColor(patternImage: image)
    }
}
