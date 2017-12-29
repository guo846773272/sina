//
//  OAuthViewController.swift
//  sina
//
//  Created by GMY on 2017/3/15.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit
import SVProgressHUD
import AFNetworking


class OAuthViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        GMYHTTPSessionManager.shareManager.gmy_get(URLString: "http://httpbin.org/get?", parameters: ["abc": "123"], progress: nil, success: { (dataTask: URLSessionDataTask, responseObject: Any?) in
//            print(responseObject)
//        }) { (dataTask: URLSessionDataTask?, error: Error) in
//            print(error)
//        }
        
//        AFHTTPSessionManager().get("http://httpbin.org/get?", parameters: ["abc": "123"], progress: nil, success: { (task: URLSessionDataTask, responseObject: Any?) in
//            
//            print(responseObject as AnyObject)
//        }) { (dataTask: URLSessionDataTask?, error: Error) in
//            print(error)
//        }
        
        

        title = "授权"
        
        automaticallyAdjustsScrollViewInsets = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "close", style: .plain, target: self, action: #selector(OAuthViewController.closeClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(OAuthViewController.addClick))
        
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(app_key)&redirect_uri=\(redirect_uri)"
        guard let url = URL(string: urlString) else {
            return
        }

        let request = URLRequest(url: url)
        webView.loadRequest(request)
//        "https://api.weibo.com/oauth2/authorize?client_id=2014705515&redirect_uri=http://www.baidu.com"
    }
    
    @objc private func closeClick() {
        SVProgressHUD.dismiss()
        dismiss(animated: true, completion: nil)
    }

    @objc private func addClick() {
        let jsCode = "document.getElementById('userId').value='846773272@qq.com';document.getElementById('passwd').value='pP456852'"
        webView.stringByEvaluatingJavaScript(from: jsCode)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        guard let url = request.url else {
            return true
        }
        let urlString = url.absoluteString
        guard urlString.contains("code=") else {
            return true
        }
        let code = urlString.components(separatedBy: "code=").last!
        
        loadAccessToken(code: code)
        return false
    }
    
    private func loadAccessToken(code: String) {
        let para = ["client_id": app_key,
                    "client_secret": app_secret,
                    "grant_type": "authorization_code",
                    "code": code,
                    "redirect_uri": redirect_uri]
        
        GMYHTTPSessionManager.shareManager.gmy_post(URLString: "https://api.weibo.com/oauth2/access_token", parameters: para, progress: nil, success: { (dataTask: URLSessionDataTask, responseObject: Any?) in
            guard let responseObject = responseObject as? [String: AnyObject] else {
                return
            }
            
            let account = UserAccountModel(dict: responseObject)
            
            self.loadUserInfo(account: account)
            
        }) { (dataTask: URLSessionDataTask?, error: Error) in
            print(error)
        }
        
    }
    
    private func loadUserInfo(account: UserAccountModel) {
        guard let access_token = account.access_token else {
            return
        }
        guard let uid = account.uid else {
            return
        }
        let para = ["access_token": access_token,
                    "uid": uid]
        GMYHTTPSessionManager.shareManager.gmy_get(URLString: "https://api.weibo.com/2/users/show.json", parameters: para, progress: nil, success: { (task: URLSessionDataTask, responseObject: Any?) in
            
            guard let responseObject = responseObject as? [String: AnyObject] else {
                return
            }
            
            account.avatar_large = responseObject["avatar_large"] as? String
            account.screen_name = responseObject["screen_name"] as? String
            
            NSKeyedArchiver.archiveRootObject(account, toFile: UserAccountViewModel.shareUserAccount.accountPath)
            
            UserAccountViewModel.shareUserAccount.account = account;
            
            self.dismiss(animated: false, completion: {
                UIApplication.shared.keyWindow?.rootViewController = WelcomeViewController()
            })
        }) { (task: URLSessionDataTask?, error: Error) in
            print(error)
        }
        
    }

}
