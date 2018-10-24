//
//  TableViewExtension.swift
//  QLiEERPhoenix
//
//  Created by florachen on 2017/12/15.
//  Copyright © 2017年 QLIEER. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func scrollToBottom(animated: Bool = true) {
        let sections = self.numberOfSections
        let rows = self.numberOfRows(inSection: sections - 1)
        if (rows > 0){
            self.scrollToRow(at: IndexPath(row: rows - 1, section: sections - 1), at: .bottom, animated: true)
        }
    }
}
