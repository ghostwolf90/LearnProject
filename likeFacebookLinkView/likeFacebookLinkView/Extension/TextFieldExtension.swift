//
//  TextFieldExtension.swift
//  QLiEERPhoenix
//
//  Created by florachen on 2018/5/30.
//  Copyright © 2018年 QLIEER. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    // text距左間距設定
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    // text距右間距設定
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
