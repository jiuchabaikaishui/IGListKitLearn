//
//  UIColorExtension.swift
//  IGListKitLearnSwift
//
//  Created by 綦 on 2019/12/31.
//  Copyright © 2019 QSP. All rights reserved.
//

import UIKit

extension UIColor {
    /// 随机颜色
    static var randomColor: UIColor { UIColor(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1) }
    
//    func dark() -> UIColor {
//        
//    }
}
