//
//  YPFiltersView.swift
//  photoTaking
//
//  Created by Sacha Durand Saint Omer on 21/10/16.
//  Copyright © 2016 octopepper. All rights reserved.
//

import Stevia
import UIKit

class YPFiltersView: UIView {
    
    let imageView = UIImageView()
    var collectionView: UICollectionView!
    var filtersLoader: UIActivityIndicatorView!
    fileprivate let collectionViewContainer: UIView = UIView()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout())
        filtersLoader = UIActivityIndicatorView(style: .gray)
        filtersLoader.hidesWhenStopped = true
        filtersLoader.startAnimating()
        filtersLoader.color = YPConfig.colors.tintColor
        
        sv(
            imageView,
            collectionViewContainer.sv(
                filtersLoader,
                collectionView
            )
        )
        
        let isIphone4 = UIScreen.main.bounds.height == 480
        let sideMargin: CGFloat = isIphone4 ? 20 : 0
        
        |-sideMargin-imageView.top(0)-sideMargin-|
        |-sideMargin-collectionViewContainer-sideMargin-|
        collectionViewContainer.bottom(0)
        imageView.Top == self.Top
        imageView.Bottom == collectionViewContainer.Top
        collectionViewContainer.Height == 160
        |collectionView.centerVertically().height(160)|
        filtersLoader.centerInContainer()
        
//        imageView.heightEqualsWidth()
        
        backgroundColor = .offWhiteOrBlack
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        layout.itemSize = CGSize(width: 100, height: 120)
        return layout
    }
}
