//
//  CommonItem.swift
//  IGListKitLearnSwift
//
//  Created by 綦 on 2020/1/2.
//  Copyright © 2020 QSP. All rights reserved.
//

import UIKit

class CommonItem: BasicItem {
    let title: String?
    let line: Bool
    let arrow: Bool
    let nextControllerClass: UIViewController.Type?
    let selectedAction: ((Int) -> ())?
    
    init(title: String?, line: Bool = true, arrow: Bool = false, nextControllerClass: UIViewController.Type? = nil, selectedAction: ((Int) -> ())? = nil) {
        self.title = title
        self.line = line
        self.arrow = arrow
        self.nextControllerClass = nextControllerClass
        self.selectedAction = selectedAction
        
        super.init()
    }
}
