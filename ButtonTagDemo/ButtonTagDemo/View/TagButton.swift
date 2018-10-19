//
//  TagButton.swift
//  QLiEERPhoenix
//
//  Created by florachen on 2018/4/29.
//  Copyright © 2018年 QLIEER. All rights reserved.
//

import UIKit

class TagButton: UIButton {

    var title: String = ""
    
    init(frame: CGRect = .zero, title:String) {
        super.init(frame: frame)
        self.title = title
        setupView(title: title)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupView(title: "")
    }

    private func setupView(title:String) {
        cornerRadius = 20
        layer.masksToBounds = true
        borderColor = UIColor.QlieerStyleGuide.qlrWormWhite
        borderWidth = 2
        
        titleEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        setTitle(title, for: .normal)
        setTitle(title, for: .selected)
        setTitleColor(UIColor.QlieerStyleGuide.qlrWarmGreyTwo, for: .normal)
        
        // Resize a UIButton according to its title's length.
        let verticalGap = 10
        let horGap = 15
        let size = calculateHeight(title: title, font: (titleLabel?.font)!)
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: size.width + CGFloat(2*horGap), height: size.height + CGFloat(2*verticalGap))
    }
    
    private func calculateHeight(title: String, font:UIFont) -> CGSize{
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = (title as NSString).size(withAttributes: fontAttributes)
        return size
    }
    
    func setGrayColor(){
        //點餐畫面UI需要灰色樣式
        borderWidth = 0
        backgroundColor = UIColor.QlieerStyleGuide.qlrWormWhite
        setTitleColor(UIColor.QlieerStyleGuide.qlrWarmGreyTwo, for: .normal)
    }
    
    func setWhiteColor(){
        borderWidth = 2
        backgroundColor = UIColor.white
        setTitleColor(UIColor.QlieerStyleGuide.qlrWarmGreyTwo, for: .normal)
    }
    
    override open var isSelected: Bool{
        didSet {
            backgroundColor = isSelected ? UIColor.QlieerStyleGuide.qlrBrownishGrey : UIColor.white
            
            setTitleColor(isSelected ? UIColor.QlieerStyleGuide.qlrWhite : UIColor.QlieerStyleGuide.qlrWarmGreyTwo, for: .normal)
            setTitleColor(isSelected ? UIColor.QlieerStyleGuide.qlrWhite : UIColor.QlieerStyleGuide.qlrWarmGreyTwo, for: .selected)
            
            setTitle(title, for: .normal)
            setTitle(title, for: .selected)
            
            borderColor = isSelected ?UIColor.QlieerStyleGuide.qlrBrownishGrey : UIColor.QlieerStyleGuide.qlrWormWhite
        }
    }
}
