//
//  ViewController.swift
//  UIGradientExample
//
//  Created by Dinh Quang Hieu on 12/7/17.
//  Copyright © 2017 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gradients: [GradientPattern]!
    
    var collectionView: UICollectionView!
    
    func initCollecitonView() {
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: FlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white
        collectionView.contentInset = UIEdgeInsetsMake(20, 1, 0, 1)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "identifier")
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        collectionView.reloadData()
    }
    
    func initGradientImages() {
        gradients = [
            GradientPattern(name: "Ocean Blue", fromColor: "2E3192", toColor: "1BFFFF", gradient: GradientLayer.oceanBlue),
            GradientPattern(name: "Sanguine", fromColor: "D4145A", toColor: "FBB03B", gradient: GradientLayer.sanguine),
            GradientPattern(name: "Luscious Lime", fromColor: "009245", toColor: "FCEE21", gradient: GradientLayer.lusciousLime),
            GradientPattern(name: "Purple Lake", fromColor: "662D8C", toColor: "ED1E79", gradient: GradientLayer.purpleLake),
            GradientPattern(name: "Fresh Papaya", fromColor: "ED1C24", toColor: "FCEE21", gradient: GradientLayer.freshPapaya),
            GradientPattern(name: "Ultramarine", fromColor: "00A8C5", toColor: "FFFF7E", gradient: GradientLayer.ultramarine),
            GradientPattern(name: "Pink Sugar", fromColor: "D74177", toColor: "FFE98A", gradient: GradientLayer.pinkSugar),
            GradientPattern(name: "Lemon Drizzle", fromColor: "FB872B", toColor: "D9E021", gradient: GradientLayer.lemonDrizzle),
            GradientPattern(name: "Victoria Purple", fromColor: "312A6C", toColor: "852D91", gradient: GradientLayer.victoriaPurple),
            GradientPattern(name: "Spring Greens", fromColor: "009E00", toColor: "FFFF96", gradient: GradientLayer.springGreens),
            GradientPattern(name: "Mystic Mauve", fromColor: "B066FE", toColor: "63E2FF", gradient: GradientLayer.mysticMauve),
            GradientPattern(name: "Reflex Silver", fromColor: "808080", toColor: "E6E6E6", gradient: GradientLayer.reflexSilver),
            GradientPattern(name: "Neon Glow", fromColor: "00FFA1", toColor: "00FFFF", gradient: GradientLayer.neonGlow),
            GradientPattern(name: "Berry Smoothie", fromColor: "8E78FF", toColor: "FC7D7B", gradient: GradientLayer.berrySmoothie),
            GradientPattern(name: "New Leaf", fromColor: "00537E", toColor: "3AA17E", gradient: GradientLayer.newLeaf),
            GradientPattern(name: "Cotton Candy", fromColor: "FCA5F1", toColor: "B5FFFF", gradient: GradientLayer.cottonCandy),
            GradientPattern(name: "Pixie Dust", fromColor: "D585FF", toColor: "00FFEE", gradient: GradientLayer.pixieDust),
            GradientPattern(name: "Fizzy Peach", fromColor: "F24645", toColor: "EBC08D", gradient: GradientLayer.fizzyPeach),
            GradientPattern(name: "Sweet Dream", fromColor: "3A3897", toColor: "A3A1FF", gradient: GradientLayer.sweetDream),
            GradientPattern(name: "Firebrick", fromColor: "45145A", toColor: "FF5300", gradient: GradientLayer.firebrick),
            GradientPattern(name: "Wrought Iron", fromColor: "333333", toColor: "5A5454", gradient: GradientLayer.wroughtIron),
            GradientPattern(name: "Deep Sea", fromColor: "4F00BC", toColor: "29ABE2", gradient: GradientLayer.deepSea),
            GradientPattern(name: "Coastal Breeze", fromColor: "00B7FF", toColor: "FFFFC7", gradient: GradientLayer.coastalBreeze),
            GradientPattern(name: "Evening Delight", fromColor: "93278F", toColor: "00A99D", gradient: GradientLayer.eveningDelight)
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGradientImages()
        initCollecitonView()
    }
}

class FlowLayout: UICollectionViewFlowLayout {
    private static let itemsPerRow: CGFloat = 2
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
    
    override var itemSize: CGSize {
        set {
            
        }
        get {
            guard let collectionView = self.collectionView else {
                return .zero
            }
            let paddingSpace = FlowLayout.itemsPerRow + 1
            let availableWidth = collectionView.frame.width - paddingSpace
            let widthPerItem = availableWidth / FlowLayout.itemsPerRow
            let cellSize = CGSize(width: widthPerItem, height: widthPerItem * 4 / 5)
            return cellSize
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let gridFlowLayout = collectionViewLayout as? FlowLayout {
            return gridFlowLayout.itemSize
        }
        return .zero
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gradients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = GradientViewController()
        vc.gradientPattern = self.gradients[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "identifier", for: indexPath)
        cell.contentView.addGradient(gradients[indexPath.row].gradient)
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
}
