//
//  UISplitViewController.swift
//  QLiEERPhoenix
//
//  Created by florachen on 2018/5/10.
//  Copyright © 2018年 QLIEER. All rights reserved.
//

import Foundation
import UIKit

extension UISplitViewController {
    var primaryViewController: UIViewController? {
        return self.viewControllers.first
    }
    
    var secondaryViewController: UIViewController? {
        return self.viewControllers.count > 1 ? self.viewControllers[1] : nil
    }
}
