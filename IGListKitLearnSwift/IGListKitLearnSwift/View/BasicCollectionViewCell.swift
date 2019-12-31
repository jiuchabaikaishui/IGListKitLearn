//
//  BasicCollectionViewCell.swift
//  IGListKitLearnSwift
//
//  Created by 苏铮 on 2019/11/1.
//  Copyright © 2019年 QSP. All rights reserved.
//

import UIKit

class BasicCollectionViewCell: UICollectionViewCell {
    var hiddenLine: Bool = false {
        didSet {
            lineView.isHidden = hiddenLine
        }
    }
    var hiddenNextLabel: Bool = false {
        didSet {
            nextLabel.isHidden = hiddenNextLabel
        }
    }
    
    lazy var lineView = { () -> UIView in
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6)
        contentView.addSubview(view)
        
        return view
    }()
    lazy var nextLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.darkGray
        label.text = "›"
        label.sizeToFit()
        contentView.addSubview(label)
        label.setContentCompressionResistancePriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.horizontal)
        label.setContentHuggingPriority(UILayoutPriority.required, for: NSLayoutConstraint.Axis.horizontal)
        
        return label
    }()
    let textLabel: UILabel
    
    override init(frame: CGRect) {
        let label = UILabel(frame: CGRect.zero)
        textLabel = label
        
        super.init(frame: frame)
        
        backgroundColor = .white
        contentView.addSubview(label)
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        selectedBackgroundView = view
    }
    required init?(coder: NSCoder) {
        let label = UILabel(frame: CGRect.zero)
        textLabel = label
        
        super.init(coder: coder)
        
        backgroundColor = .white
        contentView.addSubview(label)
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        selectedBackgroundView = view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !hiddenLine {
            lineView.snp.makeConstraints { (make) in
                make.left.equalTo(contentView).offset(25)
                make.bottom.right.equalTo(contentView)
                make.height.equalTo(0.5)
            }
        }
        if !hiddenNextLabel {
            nextLabel.snp.makeConstraints { (make) in
                make.top.equalTo(contentView)
                make.right.equalTo(contentView).offset(-15.0)
                if hiddenLine {
                    make.bottom.equalTo(contentView)
                } else {
                    make.bottom.equalTo(lineView.snp.top)
                }
            }
        }
        
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
