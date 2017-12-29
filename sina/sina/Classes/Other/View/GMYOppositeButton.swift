//
//  GMYOppositeButton.swift
//  sina
//
//  Created by GMY on 2017/3/11.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit

class GMYOppositeButton: UIButton {

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel!.frame.origin.x = 0
        imageView!.frame.origin.x = titleLabel!.frame.size.width + 5
    }

}
