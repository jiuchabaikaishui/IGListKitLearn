//
//  SearchItem.swift
//  IGListKitLearnSwift
//
//  Created by 綦 on 2020/1/3.
//  Copyright © 2020 QSP. All rights reserved.
//

import UIKit

class SearchItem: BasicItem {
    var placeholder: String
    
    init(placeholder: String) {
        self.placeholder = placeholder
        
        super.init()
    }
}
