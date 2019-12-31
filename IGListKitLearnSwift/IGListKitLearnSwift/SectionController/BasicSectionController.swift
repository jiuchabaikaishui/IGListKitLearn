//
//  BasicSectionController.swift
//  IGListKitLearnSwift
//
//  Created by 苏铮 on 2019/11/1.
//  Copyright © 2019年 QSP. All rights reserved.
//

import UIKit
import IGListKit

class BasicSectionController: ListSectionController {
    var item: BasicItem?
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let w = collectionContext?.containerSize.width else {
            return CGSize(width: 0.0, height: 0.0)
        }
        
        let h: CGFloat = 44.0
        return CGSize(width: w, height: h)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: BasicCollectionViewCell.self, for: self, at: index) as? BasicCollectionViewCell else {
            fatalError()
        }
        
        setBasicCell(item: item, cell: cell)
        
        return cell
    }
    func setBasicCell(item: BasicItem?, cell: BasicCollectionViewCell) {
        cell.textLabel.text = item?.title
        if let line = item?.line {
            cell.hiddenLine = !line
        } else {
            cell.hiddenLine = false
        }
        if let arrow = item?.arrow {
            cell.hiddenNextLabel = !arrow
        } else {
            cell.hiddenNextLabel = true
        }
    }
    
    override func didUpdate(to object: Any) {
        item = object as? BasicItem
    }
    override func didSelectItem(at index: Int) {
        if let action = item?.selectedAction {
            action(index)
        }
        if let c = item?.nextControllerClass {
            let nextController = c.init()
            nextController.title = item?.title
            viewController?.navigationController?.pushViewController(nextController, animated: true)
        }
        
        collectionContext?.deselectItem(at: index, sectionController: self, animated: true)
    }
}
