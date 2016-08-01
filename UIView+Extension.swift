//
//  UIView+CIExtension.swift
//  CommerceInteraction
//
//  Created by liujianlin on 16/4/15.
//  Copyright © 2016年 ocm. All rights reserved.
//
import UIKit

extension UIView {
    func setCornerRadius(radius:CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func getCurrentViewController() -> UIViewController! {
        if let topController = UIApplication.sharedApplication().keyWindow?.rootViewController {
            return topViewController(topController)
        }
        return nil
    }
    
    private func topViewController(vc:UIViewController) -> UIViewController {
        if let nav = vc as? UINavigationController {
            return topViewController(nav.visibleViewController!)
        }
        if let tab = vc as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = vc.presentedViewController {
            return topViewController(presented)
        }
        return vc
        
    }
    
    static func topView() -> UIView? {
        return UIApplication.sharedApplication().delegate?.window!
    }
}