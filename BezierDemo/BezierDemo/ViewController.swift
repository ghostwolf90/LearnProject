//
//  ViewController.swift
//  BezierDemo
//
//  Created by Laibit on 2018/10/19.
//  Copyright © 2018 Laibit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let fullScreenSize = UIScreen.main.bounds.size
    let maximun: CGFloat = 15
    let radius: CGFloat = 110.0
    let startAngle: CGFloat = 0.375
    let endAngle: CGFloat = 1.125
    
    @IBOutlet weak var mySlider: UISlider!
    //要繪圖的圓
    let fnCricleLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMySlider()
        
        //背景圓弧
        let bgCricleLayer = CAShapeLayer()
        bgCricleLayer.fillColor = UIColor.clear.cgColor
        bgCricleLayer.lineWidth = 8
        bgCricleLayer.lineCap = CAShapeLayerLineCap.round
        bgCricleLayer.position = view.center
        bgCricleLayer.strokeColor = UIColor.yellow.cgColor
        view.layer.addSublayer(bgCricleLayer)
        
        let path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: radius, startAngle: CGFloat.pi * 2 * startAngle, endAngle: CGFloat.pi * 2 * endAngle, clockwise: true)
        bgCricleLayer.path = path.cgPath
        
        fnCricleLayer.fillColor = UIColor.clear.cgColor
        fnCricleLayer.lineWidth = 8
        fnCricleLayer.lineCap = CAShapeLayerLineCap.round
        fnCricleLayer.position = view.center
        fnCricleLayer.strokeColor = UIColor.blue.cgColor
        view.layer.addSublayer(fnCricleLayer)
    }
    
    func initMySlider(){
        mySlider.minimumValue = 0
        mySlider.maximumValue = Float(maximun)
        mySlider.value = 0 //預設值
        // UISlider 是否可以在變動時同步執行動作
        // 設定 false 時 則是滑動完後才會執行動作
        mySlider.isContinuous = true
        mySlider.addTarget(self, action: #selector(onSliderChange), for: .valueChanged)
    }
    
    @objc func onSliderChange(sender: UISlider) {
        print(sender.value)
        let value = sender.value
        drawFnCircle(value: CGFloat(value))
    }
    
    func drawFnCircle(value:CGFloat){
        //假設商品50公斤，最大重量100公斤，公式:50/100算出比例，再除以圓顯示範圍的比例
        //let value: CGFloat = 3
        let cireleRatio: CGFloat = ((value / maximun) * (endAngle - startAngle))
        let path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: radius, startAngle: CGFloat.pi * 2 * startAngle, endAngle: CGFloat.pi * 2 * (cireleRatio + startAngle), clockwise: true)
        fnCricleLayer.path = path.cgPath
    }


}

