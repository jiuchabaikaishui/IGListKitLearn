//
//  LoadingCollectionViewCell.swift
//  IGListKitLearnSwift
//
//  Created by 綦 on 2019/12/31.
//  Copyright © 2019 QSP. All rights reserved.
//

import UIKit

class LoadingCollectionViewCell: UICollectionViewCell {
    lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
        self.contentView.addSubview(view)
        
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.indicatorView.snp.makeConstraints { (maker) in
            maker.center.equalTo(self)
        }
    }
}
