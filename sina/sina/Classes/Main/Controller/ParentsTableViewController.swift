//
//  ParentsTableViewController.swift
//  sina
//
//  Created by GMY on 2017/3/11.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit

class ParentsTableViewController: UITableViewController {
    
    var isLogin = UserAccountViewModel.shareUserAccount.isLogin
    
    var visitorView = VisitorView.viewFromXib()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(ParentsTableViewController.registClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(ParentsTableViewController.loginClick))
    }
    
    override func loadView() {
        isLogin ? super.loadView() : loadVisitorView()
    }
    
    private func loadVisitorView() {
        view = visitorView
        
        visitorView.registBtn.addTarget(self, action: #selector(ParentsTableViewController.registClick), for: .touchUpInside)
        visitorView.loginBtn.addTarget(self, action: #selector(ParentsTableViewController.loginClick), for: .touchUpInside)
    }
    
    @objc private func registClick() {
        print("registClick")
    }
    
    @objc private func loginClick() {
        let nav = UINavigationController(rootViewController: OAuthViewController())
        present(nav, animated: true, completion: nil)
    }
}


