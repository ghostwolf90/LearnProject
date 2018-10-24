//
//  ViewController.swift
//  likeFacebookLinkView
//
//  Created by Laibit on 2018/10/24.
//  Copyright © 2018 Laibit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var viewMask : UIView!
    var linkView:LinkWebView!

    static var qlrMask: UIColor {
        return UIColor(r: 0, g: 0, b: 0, a: 0.3)
    }
    
    private var screenSize:CGSize{
        let window = UIApplication.shared.keyWindow!
        return window.frame.size
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMaskView()
    }

    @IBAction func linlViewPressed(_ sender: UIButton) {
        showLinkView()
    }

    func showLinkView(){
        showMaskView(isHidden: false)
        let window = UIApplication.shared.keyWindow!
        let rect = getRect(width: window.frame.size.width, height: window.frame.size.height)
        linkView = LinkWebView(frame: rect, urlString: "https://www.eyeem.com/community")
        linkView.center.y = screenSize.height + 100
        //linkView.delegate = self
        window.addSubview(linkView)
        UIView.animate(withDuration: 1, animations: {
            self.linkView.center.y = 400
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController{
    
    func initMaskView(){
        viewMask = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        viewMask.backgroundColor = UIColor.QlieerStyleGuide.qlrMask
        viewMask.isHidden = true
        self.view.addSubview(viewMask)
    }
    
    func showMaskView(isHidden:Bool){
        viewMask.isHidden = isHidden
    }
    
    func getRect(width:CGFloat, height:CGFloat) -> CGRect{
        let scannViewSize = CGSize(width: width, height: height)
        let rect = CGRect(x: (screenSize.width/2) - (scannViewSize.width / 2), y: (screenSize.height/2) - (scannViewSize.height/2), width: scannViewSize.width, height: scannViewSize.height)
        return rect
    }
    
}

