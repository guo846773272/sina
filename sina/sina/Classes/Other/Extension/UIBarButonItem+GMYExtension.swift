//
//  UIBarButonItem+GMYExtension.swift
//  sina
//
//  Created by GMY on 2017/3/11.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(imageName: String, target: Any?, action: Selector?, eventStyle: UIControlEvents) {
        
        let btn = UIButton();
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.addTarget(target, action: action!, for: eventStyle)
        btn.sizeToFit()
        
        self.init(customView: btn)
    }
    
//    convenience init(imageName : String) {
//        
//        let btn = UIButton()
//        btn.setImage(UIImage(named: imageName), for: UIControlState())
//        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
//        btn.sizeToFit()
//        
//        self.init(customView : btn)
//    }
//    UIBarButtonItem(title: <#T##String?#>, style: <#T##UIBarButtonItemStyle#>, target: <#T##Any?#>, action: <#T##Selector?#>)
}
