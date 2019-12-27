//
//  TextCollectionReusableView.swift
//  IGListKitLearnSwift
//
//  Created by 綦 on 2019/12/27.
//  Copyright © 2019 QSP. All rights reserved.
//

import UIKit
import SnapKit

class TextCollectionReusableView: UICollectionReusableView {
    let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(textLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.addSubview(textLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(self).offset(10.0)
            maker.right.lessThanOrEqualTo(self).offset(-10.0)
            maker.top.bottom.equalTo(self)
        }
    }
}
