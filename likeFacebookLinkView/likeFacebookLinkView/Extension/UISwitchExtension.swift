//
//  UISwitchExtension.swift
//  QLiEERPhoenix
//
//  Created by florachen on 2018/3/21.
//  Copyright © 2018年 QLIEER. All rights reserved.
//

import UIKit
@IBDesignable

class UISwitchCustom: UISwitch {
    @IBInspectable var OffTint: UIColor? {
        didSet {
            self.tintColor = OffTint
            self.layer.cornerRadius = 16
            self.backgroundColor = OffTint
        }
    }
}
