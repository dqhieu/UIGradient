//
//  ViewController.swift
//  UIGradientExample
//
//  Created by Dinh Quang Hieu on 12/7/17.
//  Copyright © 2017 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gradientImages: [UIImage] = []
    
    var collectionView: UICollectionView!
    
    func initCollecitonView() {
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: FlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "identifier")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.fromGradient(GradientLayer.cottonCandy, frame: collectionView.frame)
        self.view.addSubview(collectionView)
    }
    
    func initGradientImages() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollecitonView()
    }
}

class FlowLayout: UICollectionViewFlowLayout {
    private static let itemsPerRow: CGFloat = 3
    
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
            let paddingSpace = FlowLayout.itemsPerRow
            let availableWidth = collectionView.frame.width - paddingSpace
            let widthPerItem = availableWidth / FlowLayout.itemsPerRow
            let cellSize = CGSize(width: widthPerItem, height: widthPerItem)
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
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "identifier", for: indexPath)
        cell.addGradient(GradientLayer.oceanBlue)
        return cell
    }
}
