//
//  UserDefaultsExtension.swift
//  QLiEERPhoenix
//
//  Created by Laibit on 2017/12/13.
//  Copyright © 2017年 QLIEER. All rights reserved.
//

import Foundation


enum UserDefaultKeys: String {
    case account
    case storeNumber
    case deviceToken
}

protocol UserDefaultsSettable {
    associatedtype defaultKeys: RawRepresentable
}

extension UserDefaultsSettable where defaultKeys.RawValue==String {
    static func set(value: String?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: aKey)
    }
    static func string(forKey key: defaultKeys) -> String? {
        let aKey = key.rawValue
        return UserDefaults.standard.string(forKey: aKey)
    }
}

extension UserDefaults {
    //藍芽Key
    struct BleInfo: UserDefaultsSettable {
        enum defaultKeys: String {
            case selectPeripheral
        }
    }
}
