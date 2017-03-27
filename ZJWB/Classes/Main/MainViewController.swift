//
//  MainViewController.swift
//  NJWB
//
//  Created by 李南江 on 15/11/30.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.orange
        
        
        addChildViewControllers()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBar.addSubview(composeButton)
        
        let rect = composeButton.bounds
        
        let width = tabBar.bounds.width / CGFloat(childViewControllers.count)
        
        composeButton.frame = CGRect(x: width * 2, y: 0, width: width, height: rect.height)
        
        
        
    }
    
    func addChildViewControllers() {
        
        
        //1.获取json数据
        //1.1获取路径
        guard let filePath = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil) else {
            return
        }
        
        guard let data = NSData(contentsOfFile: filePath) as? Data else {
            return
        }
        
        //将jaon数据转为对象(数组字典)
        do {
            let object = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String : AnyObject]]
            
            //遍历数组取出每一个字典
            for dict in object {
                let title = dict["title"] as? String
                let vcName = dict["vcName"] as? String
                let imageName = dict["imageName"] as? String
                
                addChildViewController(childControllerName: vcName, title: title, imageName: imageName)
                
            }
            
        }catch{
            addChildViewController(childControllerName: "HomeTableViewController", title: "首页", imageName: "tabbar_home")
            addChildViewController(childControllerName: "MessageTableViewController", title: "消息", imageName:"tabbar_message_center")
            addChildViewController(childControllerName: "NullViewController", title: "", imageName: "")
            addChildViewController(childControllerName: "DiscoverTableViewController", title: "发现", imageName: "tabbar_discover")
            addChildViewController(childControllerName: "ProfileTableViewController", title: "我", imageName: "tabbar_profile")
        }

        
    }
    
    func addChildViewController(childControllerName : String?,title : String?,imageName : String?) {
        
        //1.获取命名空间
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            return
        }
        
        var cls : AnyClass? = nil
        
        if let vcName = childControllerName {
            cls = NSClassFromString(nameSpace + "." + vcName)

        }
        
        //1.1
        
        // Swift中如果想通过一个Class来创建一个对象, 必须告诉系统这个Class的确切类型
        guard let typeCls = cls as? UITableViewController.Type  else {
        
            return
            
        }
        
        //通过class创建对象
        let childController = typeCls.init()
        
        //1.2设置自定义控制器的相关属性
        childController.title = title;
        
        if let ivName = imageName {
            childController.tabBarItem.image = UIImage(named: ivName)
            childController.tabBarItem.selectedImage = UIImage(named:ivName + "_highlighted")
        }

        //3.包装一个导航控制器
        let nav = UINavigationController.init(rootViewController: childController)
        
        //4.将导航控制器添加到tabbar
        addChildViewController(nav)
        
    }
    
    func composeBtnClick() {
        ZJLog("dasa")
    }
    
    // MARK: - 懒加载
   private lazy var composeButton :  UIButton = {
        () -> UIButton
        in
    let btn = UIButton(imageName: "tabbar_compose_icon_add", nackGroungImageName: "tabbar_compose_button")
    
    btn.addTarget(self, action:#selector(composeBtnClick), for: UIControlEvents.touchUpInside)
        
    return btn
        
    }()
    
    
    
    
    
    
}
