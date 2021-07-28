//
//  WebViewController.swift
//  interview-practice
//
//  Created by Hiroshi Shin on 2021/04/23.
//

import Foundation
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    private var webView: WKWebView!
        
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.google.com")
        let req = URLRequest(url: url!)
        webView.load(req)
        
    }
    
}
