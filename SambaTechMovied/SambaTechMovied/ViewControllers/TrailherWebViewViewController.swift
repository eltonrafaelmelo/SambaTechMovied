//
//  TrailherWebViewViewController.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 03/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import JLToast


class TrailherWebViewViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webTrailer: UIWebView!
    var trailer = Trailer()
    var util = Util.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Trailer"
        
        let url2 = NSURL (string: "https://www.youtube.com/watch?v=\(trailer.key)")
        let requestObj = NSURLRequest(URL: url2!);
        webTrailer.delegate = self
        util.showActivityIndicator()
        webTrailer.loadRequest(requestObj)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        util.hideActivityIndicator()
        JLToast.makeText("Erro ao carregar o trailer").show()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        util.hideActivityIndicator()
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        
    }
    
}
