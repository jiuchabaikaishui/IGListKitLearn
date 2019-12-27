//
//  TextCollectionViewCell.swift
//  IGListKitLearnSwift
//
//  Created by 苏铮 on 2019/10/31.
//  Copyright © 2019年 QSP. All rights reserved.
//

import UIKit
import SnapKit

final class TextCollectionViewCell: BasicCollectionViewCell {
    let textLabel: UILabel = UILabel(frame: CGRect.zero)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settingUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        settingUI()
    }
    
    func settingUI() {
        backgroundColor = UIColor.white
        contentView.addSubview(textLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(15.0)
            make.top.equalTo(contentView)
            if hiddenNextLabel {
                make.right.equalTo(contentView).offset(-15.0)
            } else {
                make.right.equalTo(nextLabel.snp.left).offset(-15.0)
            }
            if hiddenLine {
                make.bottom.equalTo(contentView)
            } else {
                make.bottom.equalTo(lineView.snp.top)
            }
        }
    }
}
