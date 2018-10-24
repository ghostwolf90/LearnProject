//
//  Utilities.swift
//  QlieerSetting
//
//  Created by Laibit on 2017/10/20.
//  Copyright © 2017年 Laibit. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    
    //2.0使用(未來會捨棄)
    static let categoayGray = UIColor(r: 210, g: 210, b: 210)
    static let productGray = UIColor(r: 225, g: 225, b: 225)
    static let selectedColor = UIColor(r: 255, g: 255, b: 255)
    
    
    //MARK: Qlieer顏色表單
    struct QlieerStyleGuide {
        
        static var claireProWhite: UIColor {
            return UIColor(r: 250, g: 250, b: 250, a: 1.0)
        }
        
        static var claireBrown: UIColor {
            return UIColor(r: 207, g: 125, b: 9, a: 1.0)
        }
        
        static var claireYellow: UIColor {
            return UIColor(r: 255, g: 222, b: 101, a: 1.0)
        }
        
        static var claireWhite: UIColor {
            return UIColor(r: 255, g: 255, b: 255, a: 1.0)
        }
        
        static var claireWormWhite: UIColor {
            return UIColor(r: 230, g: 230, b: 230, a: 1.0)
        }
        
        static var clairelightBlueShadow: UIColor {
            return UIColor(r: 26, g: 178, b: 228, a: 0.3)
        }
        
        static var clairelightRedShadow: UIColor {
            return UIColor(r: 255, g: 185, b: 181, a: 1.0)
        }
        
        static var claireRedShadow: UIColor {
            return UIColor(r: 255, g: 60, b: 50, a: 0.3)
        }
        
        static var clairelightRed: UIColor {
            return UIColor(r: 255, g: 60, b: 50, a: 1.0)
        }
        
        static var clairelightBlue: UIColor {
            return UIColor(r: 54, g: 171, b: 225, a: 1.0)
        }
        
        static var clairelightGray: UIColor {
            return UIColor(r: 215, g: 215, b: 215, a: 1.0)
        }
        
        static var lightClaire: UIColor {
            return UIColor(r: 65, g: 182, b: 230, a: 1.0)
        }
        
        static var qlrMask: UIColor {
            return UIColor(r: 0, g: 0, b: 0, a: 0.3)
        }
        
        static var qlrQlieer: UIColor {
            return UIColor(red: 65.0 / 255.0, green: 182.0 / 255.0, blue: 230.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrWarmGrey: UIColor {
            return UIColor(white: 140.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrProWhite: UIColor {
            return UIColor(white: 250.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrBrownishGrey: UIColor {
            return UIColor(white: 90.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrPinkishGrey: UIColor {
            return UIColor(white: 200.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrTangerine: UIColor {
            return UIColor(red: 255.0 / 255.0, green: 150.0 / 255.0, blue: 0.0, alpha: 1.0)
        }
        
        static var qlrGreyishBrown: UIColor {
            return UIColor(white: 70.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrGreyish: UIColor {
            return UIColor(white: 180.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrLightWhite: UIColor {
            return UIColor(white: 245.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrOrangeyRed: UIColor {
            return UIColor(red: 255.0 / 255.0, green: 60.0 / 255.0, blue: 50.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrWormWhite: UIColor {
            return UIColor(white: 230.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrWhite: UIColor {
            return UIColor(white: 255.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrWhiteTwo: UIColor {
            return UIColor(white: 245.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrWhiteFour: UIColor {
            return UIColor(white: 250.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrBlack: UIColor {
            return UIColor(white: 0.0, alpha: 1.0)
        }
        
        static var qlrMarigold: UIColor {
            return UIColor(red: 255.0 / 255.0, green: 200.0 / 255.0, blue: 0.0, alpha: 1.0)
        }
        
        static var qlrPink: UIColor {
            return UIColor(red: 255.0 / 255.0, green: 130.0 / 255.0, blue: 180.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrWormQlieer: UIColor {
            return UIColor(red: 54.0 / 255.0, green: 171 / 255.0, blue: 225 / 255.0, alpha: 1.0)
        }
        
        static var qlrDeepGrey: UIColor {
            return UIColor(white: 30.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrWhiteQlieer: UIColor {
            return UIColor(red: 245.0 / 255.0, green: 248.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrCharcoal: UIColor {
            return UIColor(red: 50.0 / 255.0, green: 55.0 / 255.0, blue: 60.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrLightQlieer: UIColor {
            return UIColor(red: 73.0 / 255.0, green: 198.0 / 255.0, blue: 238.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrLightish: UIColor {
            return UIColor(red: 80.0 / 255.0, green: 220.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrWarmGreyTwo: UIColor {
            return UIColor(white: 120.0 / 255.0, alpha: 1.0)
        }
        
        static var qlrBlackTwo: UIColor {
            return UIColor(r: 40, g: 40, b: 40, a: 1)
        }
        
        static var qlrPaleGrey: UIColor {
            return UIColor(red: 240.0 / 255.0, green: 242.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)
        }
        
        static var gradientBottomColor: UIColor {
            return UIColor(r: 232, g: 237, b: 240, a: 1)
        }
        
    }


    
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    convenience init(r: Int, g: Int, b: Int, a: CGFloat = 1) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }
    
    convenience init(netHex:Int) {
        self.init(r:(netHex >> 16) & 0xff, g:(netHex >> 8) & 0xff, b:netHex & 0xff)
    }
    
}

