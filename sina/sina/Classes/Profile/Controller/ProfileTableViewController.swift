//
//  ProfileTableViewController.swift
//  sina
//
//  Created by GMY on 2017/3/10.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit

class ProfileTableViewController: ParentsTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.setupVisitorViewInfo(iconImageName: "visitordiscover_image_profile", title: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
    }

}
