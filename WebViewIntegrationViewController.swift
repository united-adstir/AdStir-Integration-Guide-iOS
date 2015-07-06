//
//  WebViewIntegrationViewController.swift
//
//  Copyright (c) 2015 UNITED, Inc. All rights reserved.
//

import UIKit

class WebViewIntegrationViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.webView.delegate = self
        self.webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://ja.ad-stir.com/")!));
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        self.webView?.delegate = nil
    }

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        var url: NSURL! = request.URL
        var host: String! = url?.host

        // 自サイトのドメイン以外の場合はSafariに飛ばすため、openURLし、falseを返す
        // Open URL with Safari if unknown host name.
        if (navigationType == UIWebViewNavigationType.LinkClicked && host != "ja.ad-stir.com") {
            UIApplication.sharedApplication().openURL(url)
            return false
        }

        return true
    }
}
