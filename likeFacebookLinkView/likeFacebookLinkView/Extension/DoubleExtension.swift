//
//  DoubleExtension.swift
//  QLiEERPhoenix
//
//  Created by florachen on 2018/1/5.
//  Copyright © 2018年 QLIEER. All rights reserved.
//

import Foundation

extension Double{
    
    func roundTo(_ place:Int) -> Double{

        let divisor = pow(10.0, Double(place))        
        return (self * divisor).rounded() / divisor
    }
    
    func toString(_ place:Int = 0) -> String{
        let round = self.roundTo(place)
        let str = "%.\(place)f"
        return String(format:str, round)
    }
    
    // 金額格式 以千為單位，加上＄
    func toDecimalFormat(place:Int = 0, isShowMoneyUnit:Bool = true) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let decimalStr = numberFormatter.string(from: NSNumber(value:self.roundTo(place))) ?? "N/A"
        if isShowMoneyUnit{
             return "$ \(decimalStr)"
        }else{
            return decimalStr
        }
    }
}

extension Int{
    func toDate() -> Date{
        return NSDate(timeIntervalSince1970: Double(self)) as Date
    }
}
