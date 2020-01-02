//
//  CommonSectionController.swift
//  IGListKitLearnSwift
//
//  Created by 綦 on 2020/1/2.
//  Copyright © 2020 QSP. All rights reserved.
//

import UIKit
import IGListKit

class CommonSectionController: ListSectionController {
    var item: CommonItem?
    
    /// 设置cell
    /// - Parameters:
    ///   - item: 数据模型
    ///   - cell: cell
    func settingCell(item: CommonItem?, cell: CommonCollectionViewCell) {
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
    
    // MARK: 重写IGListSectionController方法
    override func sizeForItem(at index: Int) -> CGSize {
        guard let w = collectionContext?.containerSize.width else {
            return CGSize(width: 0.0, height: 0.0)
        }
        
        let h: CGFloat = 44.0
        return CGSize(width: w, height: h)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: CommonCollectionViewCell.self, for: self, at: index) as? CommonCollectionViewCell else {
            fatalError()
        }
        
        settingCell(item: item, cell: cell)
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        item = object as? CommonItem
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
