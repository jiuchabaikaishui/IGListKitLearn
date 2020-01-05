//
//  SearchSectionController.swift
//  IGListKitLearnSwift
//
//  Created by 綦 on 2020/1/3.
//  Copyright © 2020 QSP. All rights reserved.
//

import UIKit
import IGListKit

class SearchSectionController: ListSectionController {
    var item: SearchItem?
    var cellHeight: CGFloat = 50.0
    
    // MARK: 重写IGListSectionController方法
    override func sizeForItem(at index: Int) -> CGSize {
        guard let w = collectionContext?.containerSize.width else {
            return CGSize(width: 0.0, height: 0.0)
        }
        
        return CGSize(width: w, height: cellHeight)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: SearchCollectionViewCell.self, for: self, at: index) as? SearchCollectionViewCell else {
            fatalError()
        }
        
        let searchController = viewController as? SearchViewController
        
        cell.searchBar = searchController?.searchController.searchBar
        cell.searchBar?.placeholder = item?.placeholder
        cell.searchBar?.sizeToFit()
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        item = object as? SearchItem
    }
}
