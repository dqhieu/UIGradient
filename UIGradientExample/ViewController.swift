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
    
    var backgroundView: UIView = UIView()
    var zoomedView: UIView = UIView()
    var lblGradientName: UILabel = UILabel()
    var lblGradientColors: UILabel = UILabel()
    var cellOriginFrame: CGRect?
    
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
            GradientPattern(name: "Ocean Blue", fromColors: ["2E3192", "1BFFFF"], gradient: GradientLayer.oceanBlue),
            GradientPattern(name: "Sanguine", fromColors: ["D4145A", "FBB03B"], gradient: GradientLayer.sanguine),
            GradientPattern(name: "Luscious Lime", fromColors: ["009245", "FCEE21"], gradient: GradientLayer.lusciousLime),
            GradientPattern(name: "Purple Lake", fromColors: ["662D8C", "ED1E79"], gradient: GradientLayer.purpleLake),
            GradientPattern(name: "Fresh Papaya", fromColors: ["ED1C24", "FCEE21"], gradient: GradientLayer.freshPapaya),
            GradientPattern(name: "Ultramarine", fromColors: ["00A8C5", "FFFF7E"], gradient: GradientLayer.ultramarine),
            GradientPattern(name: "Pink Sugar", fromColors: ["D74177", "FFE98A"], gradient: GradientLayer.pinkSugar),
            GradientPattern(name: "Lemon Drizzle", fromColors: ["FB872B", "D9E021"], gradient: GradientLayer.lemonDrizzle),
            GradientPattern(name: "Victoria Purple", fromColors: ["312A6C", "852D91"], gradient: GradientLayer.victoriaPurple),
            GradientPattern(name: "Spring Greens", fromColors: ["009E00", "FFFF96"], gradient: GradientLayer.springGreens),
            GradientPattern(name: "Mystic Mauve", fromColors: ["B066FE", "63E2FF"], gradient: GradientLayer.mysticMauve),
            GradientPattern(name: "Reflex Silver", fromColors: ["808080", "E6E6E6"], gradient: GradientLayer.reflexSilver),
            GradientPattern(name: "Neon Glow", fromColors: ["00FFA1", "00FFFF"], gradient: GradientLayer.neonGlow),
            GradientPattern(name: "Berry Smoothie", fromColors: ["8E78FF", "FC7D7B"], gradient: GradientLayer.berrySmoothie),
            GradientPattern(name: "New Leaf", fromColors: ["00537E", "3AA17E"], gradient: GradientLayer.newLeaf),
            GradientPattern(name: "Cotton Candy", fromColors: ["FCA5F1", "B5FFFF"], gradient: GradientLayer.cottonCandy),
            GradientPattern(name: "Pixie Dust", fromColors: ["D585FF", "00FFEE"], gradient: GradientLayer.pixieDust),
            GradientPattern(name: "Fizzy Peach", fromColors: ["F24645", "EBC08D"], gradient: GradientLayer.fizzyPeach),
            GradientPattern(name: "Sweet Dream", fromColors: ["3A3897", "A3A1FF"], gradient: GradientLayer.sweetDream),
            GradientPattern(name: "Firebrick", fromColors: ["45145A", "FF5300"], gradient: GradientLayer.firebrick),
            GradientPattern(name: "Wrought Iron", fromColors: ["333333", "5A5454"], gradient: GradientLayer.wroughtIron),
            GradientPattern(name: "Deep Sea", fromColors: ["4F00BC", "29ABE2"], gradient: GradientLayer.deepSea),
            GradientPattern(name: "Coastal Breeze", fromColors: ["00B7FF", "FFFFC7"], gradient: GradientLayer.coastalBreeze),
            GradientPattern(name: "Evening Delight", fromColors: ["93278F", "00A99D"], gradient: GradientLayer.eveningDelight),
            GradientPattern(name: "Argon", fromColors: ["03001e", "7303c0", "ec38bc", "fdeff9"], gradient: GradientLayer(direction: .custom(77), colors: [UIColor.hex("03001e"), UIColor.hex("7303c0"), UIColor.hex("ec38bc"), UIColor.hex("fdeff9")], locations: [0.0, 0.33, 0.66, 1.0]))
        ]
    }
    
    func initGradientViews() {
        backgroundView.frame = self.view.frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.isHidden = true
        self.view.addSubview(backgroundView)
        lblGradientName.isHidden = true
        self.view.addSubview(lblGradientName)
        lblGradientColors.isHidden = true
        self.view.addSubview(lblGradientColors)
        zoomedView.isHidden = true
        zoomedView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomOutCell)))
        self.view.addSubview(zoomedView)
    }
    
    func setupGradientViews(gradientPattern: GradientPattern) {
        lblGradientName.text = gradientPattern.name
        lblGradientName.frame = CGRect(origin: .zero, size: lblGradientName.sizeThatFits(.zero))
        lblGradientName.textColor = UIColor.fromGradient(gradientPattern.gradient, frame: lblGradientName.frame)
        lblGradientName.center.y = self.view.center.y - self.view.frame.width * 4 / 5 / 2 - 20
        lblGradientName.center.x = self.view.center.x

        let fromColorsText = gradientPattern.fromColors.reduce(NSMutableAttributedString(string: "", attributes: nil)) { result, color in
            let item = NSAttributedString(string: "#\(color)", attributes: [NSAttributedStringKey.foregroundColor : UIColor.hex(color)])
            result.append(item)
            if color != gradientPattern.fromColors.last {
                result.append(NSAttributedString(string: " → ", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white]))
            }
            return result
        }
        
        lblGradientColors.attributedText = fromColorsText
        lblGradientColors.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20)
        lblGradientColors.center.y = self.view.center.y + self.view.frame.width * 4 / 5 / 2 + 20
        lblGradientColors.center.x = self.view.center.x
        lblGradientColors.textAlignment = .center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGradientImages()
        initCollecitonView()
        initGradientViews()
    }
    
    func zoomInCell(startingFrame: CGRect, gradientPattern: GradientPattern) {
        zoomedView.isHidden = false
        backgroundView.isHidden = false
        backgroundView.alpha = 0
        zoomedView.frame = startingFrame
        setupGradientViews(gradientPattern: gradientPattern)
        UIView.animate(withDuration: 0.2, animations: {
            let height = (self.view.frame.width / startingFrame.width) * startingFrame.height
            let y = self.view.frame.height / 2 - height / 2
            let endingFrame = CGRect(x: 0, y: y, width: self.view.frame.width, height: height)
            self.zoomedView.frame = endingFrame
            self.zoomedView.backgroundColor = UIColor.fromGradient(gradientPattern.gradient, frame: endingFrame, cornerRadius: 10)
        }, completion: { (_) in
            UIView.animate(withDuration: 0.2, animations: {
                self.backgroundView.alpha = 1
                self.lblGradientColors.isHidden = false
                self.lblGradientName.isHidden = false
            }, completion: nil)
        })
    }
    
    @objc func zoomOutCell() {
        if let startingFrame = self.cellOriginFrame {
            UIView.animate(withDuration: 0.2, animations: {
                self.zoomedView.frame = startingFrame
                self.backgroundView.alpha = 0
                self.lblGradientColors.isHidden = true
                self.lblGradientName.isHidden = true
            }) { (_) in
                self.backgroundView.isHidden = true
                self.zoomedView.isHidden = true
            }
        }
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "identifier", for: indexPath)
        let gradientPattern = gradients[indexPath.row]
        cell.contentView.backgroundColor = UIColor.fromGradient(gradientPattern.gradient, frame: cell.contentView.frame, cornerRadius: 10)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        if let startingFrame = cell.contentView.superview?.convert(cell.contentView.frame, to: nil) {
            self.cellOriginFrame = startingFrame
            self.zoomInCell(startingFrame: startingFrame, gradientPattern: self.gradients[indexPath.row])
        }
    }
    
}
