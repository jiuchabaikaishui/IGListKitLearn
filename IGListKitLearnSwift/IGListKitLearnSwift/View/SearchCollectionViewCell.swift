//
//  SearchCollectionViewCell.swift
//  IGListKitLearnSwift
//
//  Created by 綦 on 2020/1/3.
//  Copyright © 2020 QSP. All rights reserved.
//

import UIKit
import SnapKit

class SearchCollectionViewCell: UICollectionViewCell {
    var searchBar: UISearchBar? {
        willSet {
            if let bar = newValue {
                contentView.addSubview(bar)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.searchBar?.frame = contentView.bounds
    }
}
