//
//  LinkWebView.swift
//  likeFacebookLinkView
//
//  Created by Laibit on 2018/8/29.
//  Copyright © 2018年 Laibit. All rights reserved.
//

import UIKit

class LinkWebView: UIView {
    @IBOutlet var view: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var smalleView: UIView!
    @IBOutlet weak var progressView: UIView!
    
    private var urlString = ""
    private var isWebViewFinish = false
    private var stopTimer:Timer?
    
    override public init(frame: CGRect){
        super.init(frame: frame)
        //self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        //self.setup()
    }
    
    convenience init(frame: CGRect, urlString:String) {
        self.init(frame: frame)
        self.urlString = urlString
        setup()
    }
    
    private func setup() {
        Bundle.init(for:LinkWebView.self).loadNibNamed("LinkWebView", owner: self, options: nil)
        guard let content = view else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        content.layer.cornerRadius = 10;
        content.layer.shadowColor = UIColor.gray.cgColor
        content.layer.shadowOpacity = 1.0
        content.layer.shadowOffset = CGSize(width: 0, height: 0)
        content.layer.shadowRadius = 5
        content.layer.masksToBounds = false
        self.addSubview(content)
        
        smalleView.layer.cornerRadius = 6.0
        topView.layer.roundCorners([.topLeft, .topRight], radius: 12)
        view.layer.roundCorners([.topLeft, .topRight], radius: 12)
        
        // 前往網址
        let url = URL(string:urlString)!
        let urlRequest = URLRequest(url: url)
        webView.delegate = self
        webView.loadRequest(urlRequest)
        webView.alpha = 0
        progressView.alpha = 1
        progressView.isHidden = false
        if (self.stopTimer == nil) {
            stopTimer = Timer.scheduledTimer(timeInterval: 0.01667, target: self, selector: #selector(self.webViewProgress), userInfo: nil, repeats: true)
        }
    }
    
    @objc func webViewProgress(){
        if isWebViewFinish{
            progressView.frame.size.width = 414
            UIView.animate(withDuration: 0.24, animations: {
                self.progressView.alpha = 0
            }, completion:{ _ in
                self.progressView.isHidden = true
                self.webView.alpha = 1
            })
            stopTimer?.invalidate()
            stopTimer = nil
        }else{
            progressView.frame.size.width += 0.5
            webView.alpha += 0.001
        }
    }

}

extension LinkWebView: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("Finished loading")
        isWebViewFinish = true
    }
}
