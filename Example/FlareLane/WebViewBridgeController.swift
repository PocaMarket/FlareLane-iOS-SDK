//
//  WebViewBridgeController.swift
//  FlareLane_Example
//
//  Created by MinHyeok Kim on 7/20/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import WebKit
import FlareLane

class WebViewBridgeController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        webView = WKWebView(frame: self.view.frame)
        webView.uiDelegate = self
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.configuration.preferences.javaScriptEnabled = true
        
        // add FlareLane javascript interface
        let interface = FlareLaneJavascriptInterface(webView)
        webView.configuration.userContentController.add(
            interface,
            name: FlareLaneJavascriptInterface.BRIDGE_NAME
        )
        
        let localFilePath = Bundle.main.url(forResource: "/webview_bridge_test", withExtension: "html")
        let request = URLRequest(url: localFilePath!)
        webView.load(request)
    }
}
