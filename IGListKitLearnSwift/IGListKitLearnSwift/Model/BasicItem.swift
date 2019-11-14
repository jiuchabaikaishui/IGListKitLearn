//
//  BasicItem.swift
//  IGListKitLearnSwift
//
//  Created by 苏铮 on 2019/11/1.
//  Copyright © 2019年 QSP. All rights reserved.
//

import UIKit
import IGListKit

class BasicItem: NSObject, ListDiffable {
    let line: Bool
    let arrow: Bool
    let selectedAction: ((Int) -> ())?
    
    init(line: Bool, arrow: Bool, selectedAction: ((Int) -> ())?) {
        self.line = line
        self.arrow = arrow
        self.selectedAction = selectedAction
        
        super.init()
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return hashValue as NSObjectProtocol
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let obj = object else {
            return false
        }
        if self === obj {
            return true
        } else {
            return false
        }
    }
}
