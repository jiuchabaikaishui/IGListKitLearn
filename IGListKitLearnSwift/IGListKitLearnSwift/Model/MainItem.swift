//
//  MainItem.swift
//  IGListKitLearnSwift
//
//  Created by 苏铮 on 2019/11/1.
//  Copyright © 2019年 QSP. All rights reserved.
//

import UIKit

final class MainItem: BasicItem {
    let title: String?
    
    init(title: String, line: Bool = true, arrow: Bool = true, nextControllerClass: UIViewController.Type? = nil, selectedAction: ((Int) -> ())? = nil) {
        self.title = title
        
        super.init(line: line, arrow: arrow, nextControllerClass: nextControllerClass, selectedAction: selectedAction)
    }
}
