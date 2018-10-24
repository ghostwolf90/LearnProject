//
//  UIViewExtenstion.swift
//  QLiEERPhoenix
//
//  Created by PocaChen on 2018/4/18.
//  Copyright © 2018年 QLIEER. All rights reserved.
//

import UIKit

extension UIView{

    // 左右晃動
    func shakeAnimation(duration: TimeInterval = 0.08, shakeCount: Float = 2, xValue: CGFloat = 12, yValue: CGFloat = 0){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = shakeCount
        animation.autoreverses = true
        //左幅度
        animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - xValue, y: center.y - yValue))
        //右幅度
        animation.toValue = NSValue(cgPoint: CGPoint(x: center.x + xValue, y: center.y - yValue))
        layer.add(animation, forKey: "shake")
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }}
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }}
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    //增加view上到下漸層
    func applyGradientsColor(topColor:UIColor,bottomColor:UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [topColor.cgColor,bottomColor.cgColor]
        layer.addSublayer(gradientLayer)
    }
    
}
