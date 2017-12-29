//
//  MainViewController.swift
//  sina
//
//  Created by GMY on 2017/3/10.
//  Copyright © 2017年 Mingk. All rights reserved.
//

import UIKit

//class MainViewController: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        addChildViewController(childVc: HomeTableViewController(), title: "首页", imageName: "tabbar_home")
//        addChildViewController(childVc: MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
//        addChildViewController(childVc: DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
//        addChildViewController(childVc: ProfileTableViewController(), title: "我", imageName: "tabbar_profile")
//    }
//
//    private func addChildViewController(childVc: UIViewController, title: String, imageName: String) {
//        childVc.tabBarItem.title = title;
//        childVc.tabBarItem.image = UIImage(named: imageName)
//        childVc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
//        let nav = UINavigationController(rootViewController: childVc);
//        addChildViewController(nav)
//    }
//}

//class MainViewController: UITabBarController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        guard let jsonPath = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil) else {
//            return
//        }
//        guard let data = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
//            return
//        }
//        
//        guard let anyObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
//            return
//        }
//        
//        guard let dictArray = anyObject as? [[String: AnyObject]] else {
//            return
//        }
//        
//        for dict in dictArray {
//            guard let imageName = dict["imageName"] as? String else {
//                continue
//            }
//            
//            guard let title = dict["title"] as? String else {
//                continue
//            }
//            
//            guard let vcName = dict["vcName"] as? String else {
//                continue
//            }
//            
//            addChildViewController(childVcName: vcName, title: title, imageName: imageName)
//        }
//    }
//    
//    private func addChildViewController(childVcName: String, title: String, imageName: String) {
//        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
//            return
//        }
//        print(childVcName)
//        guard let childVcClass = NSClassFromString(nameSpace + "." + childVcName) else {
//            return
//        }
//        
//        guard let childVcType = childVcClass as? UIViewController.Type else {
//            return
//        }
//        
//        let childVc = childVcType.init()
//        
//        childVc.tabBarItem.title = title;
//        childVc.tabBarItem.image = UIImage(named: imageName)
//        childVc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
//        let nav = UINavigationController(rootViewController: childVc);
//        addChildViewController(nav)
//    }
//}

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComposeBtn()
    }
    
    private func setupComposeBtn(){
//        let composeBtn = UIButton()
//        composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: UIControlState())
//        composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .highlighted)
//        composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControlState())
//        composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
//        composeBtn.sizeToFit()
//        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
//        tabBar.addSubview(composeBtn)
        
        let composeBtn = UIButton(imageName: "tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
        tabBar.addSubview(composeBtn)
    }
}
