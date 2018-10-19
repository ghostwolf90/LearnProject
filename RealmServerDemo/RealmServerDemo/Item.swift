//
//  Item.swift
//  RealmServerDemo
//
//  Created by Laibit on 2018/10/19.
//  Copyright © 2018 Laibit. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var itemId: String = UUID().uuidString
    @objc dynamic var body: String = ""
    @objc dynamic var isDone: Bool = false
    @objc dynamic var timestamp: Date = Date()
    
    override static func primaryKey() -> String? {
        return "itemId"
    }
    
}
