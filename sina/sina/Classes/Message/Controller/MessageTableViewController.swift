//
//  MessageTableViewController.swift
//  sina
//
//  Created by GMY on 2017/3/10.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit

class MessageTableViewController: ParentsTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.setupVisitorViewInfo(iconImageName: "visitordiscover_image_profile", title: "登录后，别人评论你的微博，给你发消息，都会在这里收到通知")
    }

}
