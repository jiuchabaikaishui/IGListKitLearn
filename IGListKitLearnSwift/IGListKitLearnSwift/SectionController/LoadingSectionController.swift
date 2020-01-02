//
//  LoadingSectionController.swift
//  IGListKitLearnSwift
//
//  Created by 綦 on 2020/1/2.
//  Copyright © 2020 QSP. All rights reserved.
//

import UIKit
import IGListKit

class LoadingSectionController: ListSectionController {
    var item: LoadingItem?
    
    // MARK: 重写IGListSectionController方法
    override func sizeForItem(at index: Int) -> CGSize {
        guard let w = collectionContext?.containerSize.width else {
            return CGSize(width: 0.0, height: 0.0)
        }
        
        let h: CGFloat = 66.0
        return CGSize(width: w, height: h)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: LoadingCollectionViewCell.self, for: self, at: index) as? LoadingCollectionViewCell else {
            fatalError()
        }
        
        cell.indicatorView.startAnimating()
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        item = object as? LoadingItem
    }
}
