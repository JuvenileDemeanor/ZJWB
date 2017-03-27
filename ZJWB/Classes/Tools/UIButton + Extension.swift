//
//  UIButton + Extension.swift
//  ZJWB
//
//  Created by MAC on 2017/3/27.
//  Copyright © 2017年 pmicro. All rights reserved.
//

import UIKit


extension UIButton
{
    convenience init(imageName: String,nackGroungImageName: String)
    {
        self.init()
        
        // 2.设置前景图片
        setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControlState.normal)
        setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        // 3.设置背景图片
        setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: UIControlState.normal)
        setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        
        // 4.调整按钮尺寸
        
        sizeToFit()

    }
    
    
}
