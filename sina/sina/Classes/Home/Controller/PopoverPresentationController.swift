//
//  PopoverPresentationController.swift
//  sina
//
//  Created by GMY on 2017/3/11.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit

class PopoverPresentationController: UIPresentationController {
    private lazy var coverView = UIView()
    var frame = CGRect.zero
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        presentedView?.frame = frame
        
        containerView?.insertSubview(coverView, at: 0)
        coverView.backgroundColor = UIColor(white: 0.8, alpha: 0.2)
        coverView.frame = containerView!.bounds
        coverView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(PopoverPresentationController.coverViewClick)))
    }
    
    @objc private func coverViewClick() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
