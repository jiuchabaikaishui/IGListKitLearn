//
//  MainSectionController.swift
//  IGListKitLearnSwift
//
//  Created by 苏铮 on 2019/10/31.
//  Copyright © 2019年 QSP. All rights reserved.
//

import UIKit
import IGListKit

class MainSectionController: BasicSectionController {
    var item: MainItem?
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: TextCollectionViewCell.self, for: self, at: index) as? TextCollectionViewCell else {
            fatalError()
        }
        
        setBasicCell(item: item, cell: cell)
        cell.textLabel.text = item?.title
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        super.didUpdate(to: object)
        
        item = object as? MainItem
    }
}

