//
//  VisitorView.swift
//  sina
//
//  Created by GMY on 2017/3/11.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    
    @IBOutlet weak var rotationImgView: UIImageView!

    @IBOutlet weak var iconImgView: UIImageView!
    
    @IBOutlet weak var tiplbl: UILabel!
    
    @IBOutlet weak var registBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupRotationImgView()
    }
    
    class func viewFromXib() -> VisitorView {
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)!.first as! VisitorView
    }
    
    func setupVisitorViewInfo(iconImageName: String, title: String) {
        
        rotationImgView.isHidden = true
        iconImgView.image = UIImage(named: iconImageName)
        tiplbl.text = title;
    }
    
    private func setupRotationImgView() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        animation.duration = 10
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        rotationImgView.layer.add(animation, forKey: nil)
    }
}
