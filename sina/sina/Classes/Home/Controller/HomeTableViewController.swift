//
//  HomeTableViewController.swift
//  sina
//
//  Created by GMY on 2017/3/10.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit

class HomeTableViewController: ParentsTableViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    let titleBtn = GMYOppositeButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        
        if (isLogin) {
            navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: #selector(HomeTableViewController.leftItemClick), eventStyle: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(HomeTableViewController.rightItemClick), eventStyle: .touchUpInside)
            
            titleBtn.setTitle("user", for: .normal)
            titleBtn.setTitleColor(UIColor.black, for: .normal)
            titleBtn.setImage(UIImage(named: "navigationbar_arrow_down"), for: .normal)
            titleBtn.setImage(UIImage(named: "navigationbar_arrow_up"), for: .selected)
            titleBtn.sizeToFit()
            titleBtn.addTarget(self, action: #selector(HomeTableViewController.titleBtnClick), for: .touchUpInside)
            navigationItem.titleView = titleBtn
        }
        
    }
    
    @objc private func leftItemClick() {
        print("left")
    }
    
    @objc private func rightItemClick() {
        print("right")
    }
    
    @objc private func titleBtnClick() {
        
        let popvc = PopoverViewController();
        popvc.modalPresentationStyle = .custom
        popvc.transitioningDelegate = self
        present(popvc, animated: true, completion: nil)
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let popover = PopoverPresentationController(presentedViewController: presented, presenting: presenting);
        let width : CGFloat = 200
        let x : CGFloat = (UIScreen.main.bounds.size.width - width) * 0.5
        popover.frame = CGRect(x: x, y: 64, width: width, height: 300)
        return popover
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        titleBtn.isSelected = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        titleBtn.isSelected = false
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        titleBtn.isSelected ? animationForPresentedView(using: transitionContext) : animationForDismissedView(using: transitionContext)
    }
    
    private func animationForPresentedView(using transitionContext: UIViewControllerContextTransitioning){
        
        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        transitionContext.containerView.addSubview(presentedView)
        presentedView.layer.anchorPoint = CGPoint(x: 1.0, y: 0.0)
        presentedView.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentedView.transform = CGAffineTransform.identity
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
    
    private func animationForDismissedView(using transitionContext: UIViewControllerContextTransitioning){
        let dismissedView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            dismissedView.transform = CGAffineTransform(scaleX: 1.0, y: 0.001)
        }) { (_) in
            dismissedView.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }
}


