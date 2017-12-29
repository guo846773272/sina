//
//  UIButton+GMYExtension.swift
//  sina
//
//  Created by GMY on 2017/3/10.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(imageName: String, backgroundImageName: String) {
        self.init()
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        setBackgroundImage(UIImage(named: backgroundImageName), for: .normal)
        setBackgroundImage(UIImage(named: backgroundImageName + "_highlighted"), for: .highlighted)
        sizeToFit()
    }
}
