//
//  ViewController.swift
//  ButtonTagDemo
//
//  Created by Laibit on 2018/10/19.
//  Copyright © 2018 Laibit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tagView: UIView!
    let tags = ["好奇寶寶","美國人","寶寶","我iPhone X","狂熱驅動開發（Hype Driven Development） 是當前軟體工程界的奇特現象", "我iPhone X"]
    var selectedTagArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTages()
    }
    
    private func addTages(){
        var gapCount:CGFloat = 0
        var position = CGPoint(x:0, y:0)
        let tagGap: CGFloat = 8
        let tagViewWidth = tagView.frame.size.width
        for (index, tagStr) in tags.enumerated() {
            let tagBtn = TagButton(frame: CGRect(x: position.x, y: position.y, width: 80, height: 80), title: tagStr)
            position.x += tagBtn.frame.size.width + tagGap
            let limitWidth = tagViewWidth - CGFloat(tagGap * gapCount)
            // 前次的tagBtn座標大於剩餘空間就換行
            if position.x > limitWidth {
                //換行時，將tagBtn.frame移到第二行開頭
                tagBtn.frame.origin = CGPoint(x: 0, y: tagBtn.frame.size.height + tagBtn.frame.origin.y + tagGap)
                //座標從第二行tagBtn後開始計算
                position.x = tagBtn.frame.size.width + tagGap
                position.y = tagBtn.frame.size.height + tagGap
                gapCount = 0
            }
            gapCount += 1
            tagBtn.tag = index
            tagBtn.isSelected = false
            tagBtn.addTarget(self, action: #selector(tapTagBtn), for: UIControl.Event.touchUpInside)
            tagView.addSubview(tagBtn)
        }
    }
    
    @objc func tapTagBtn(sender: UIButton){
        if let btn = sender as? TagButton{
            print(btn.title)
            let tagIndex = sender.tag
            let btnSelected = btn.isSelected
            if btn.isSelected {
                btn.isSelected = false
                btn.setWhiteColor()
            }else{
                btn.isSelected = true
                btn.setGrayColor()
            }
        }
    }


}

