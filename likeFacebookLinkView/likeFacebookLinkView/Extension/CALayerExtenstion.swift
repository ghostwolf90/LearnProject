//
//  CALayerExtenstion.swift
//  QLiEERPhoenix
//
//  Created by PocaChen on 2018/2/13.
//  Copyright © 2018年 QLIEER. All rights reserved.
//

import UIKit

extension CALayer{
    
    //自定義layer四個邊要多少圓角
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.mask = mask
    }
    
    func setCornerRadius(isFirst:Bool = false, isLast:Bool = false, radius:CGFloat){
        // 設定cell圓角
        var coners = UIRectCorner()
        if isFirst{
            coners.insert(UIRectCorner.topLeft)
            coners.insert(UIRectCorner.topRight)
        }
        
        if isLast{
            coners.insert(UIRectCorner.bottomLeft)
            coners.insert(UIRectCorner.bottomRight)
        }
        
        self.roundCorners(coners, radius: radius)
    }

}
