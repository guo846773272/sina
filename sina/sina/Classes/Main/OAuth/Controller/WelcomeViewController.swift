//
//  WelcomeViewController.swift
//  sina
//
//  Created by GMY on 2017/3/20.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit
import SDWebImage

class WelcomeViewController: UIViewController {

    @IBOutlet weak var bottomCons: NSLayoutConstraint!
    
    @IBOutlet weak var iconImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let iconString = UserAccountViewModel.shareUserAccount.account?.avatar_large
        let iconUrl = URL(string: iconString ?? "")
        iconImgView.sd_setImage(with: iconUrl, placeholderImage: UIImage(named: "avatar_default_big"))
        
//        self.bottomCons.constant = UIScreen.main.bounds.height - 200
        
//        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5.0, options: [], animations: { () -> Void in
//            self.view.layoutIfNeeded()
//        }) { (_) -> Void in
//            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
//        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.bottomCons.constant = UIScreen.main.bounds.height - 200
        
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5.0, options: [], animations: { () -> Void in
            self.view.layoutIfNeeded()
        }) { (_) -> Void in
            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        }
    }
    
    
    

}
