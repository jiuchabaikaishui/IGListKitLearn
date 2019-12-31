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
    let title: String?
    let line: Bool
    let arrow: Bool
    let nextControllerClass: UIViewController.Type?
    let selectedAction: ((Int) -> ())?
    
    init(title: String, line: Bool = true, arrow: Bool = false, nextControllerClass: UIViewController.Type? = nil, selectedAction: ((Int) -> ())? = nil) {
        self.title = title
        self.line = line
        self.arrow = arrow
        self.nextControllerClass = nextControllerClass
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
