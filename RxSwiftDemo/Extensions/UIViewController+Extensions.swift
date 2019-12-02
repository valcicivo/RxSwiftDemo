//
//  UIViewController+Extensions.swift
//  RxSwiftDemo
//
//  Created by Ivo Valcic on 30/11/2019.
//  Copyright © 2019 TELTECH.CO. All rights reserved.
//

import UIKit
public protocol RootShowable: class {
    func showAsRoot()
}

extension RootShowable where Self: UIViewController {
    public func showAsRoot() {
        guard let window = window else {
            print("WARNING: no window!")
            return
        }
        
        if window.rootViewController != nil {
            window.replaceRootViewControllerWith(self, animated: true, completion: nil)
            window.makeKeyAndVisible()
        } else {
            window.rootViewController = self
            window.makeKeyAndVisible()
        }
    }
}

extension UIViewController: RootShowable {
    public var window: UIWindow? {
        if let appWindow = UIApplication.shared.delegate?.window {
            return appWindow
        } else if UIApplication.shared.windows.count > 0 {
            return UIApplication.shared.windows[0]
        }
        return nil
    }
    
    public var contentViewController: UIViewController? {
        if let navigationViewController = self as? UINavigationController {
            return navigationViewController.topViewController?.contentViewController
        } else {
            return self
        }
    }
}

extension UIView {
    func snapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result ?? UIImage()
    }
}

extension UIWindow {
    func replaceRootViewControllerWith(_ replacementController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        let snapshotImageView = UIImageView(image: self.snapshot())
        self.addSubview(snapshotImageView)
        
        let dismissCompletion = { () -> Void in
            self.rootViewController = replacementController
            self.bringSubviewToFront(snapshotImageView)
            if animated {
                UIView.animate(withDuration: 0.4, animations: { () -> Void in
                    snapshotImageView.alpha = 0
                }, completion: { _ -> Void in
                    snapshotImageView.removeFromSuperview()
                    completion?()
                })
            } else {
                snapshotImageView.removeFromSuperview()
                completion?()
            }
        }
        if self.rootViewController!.presentedViewController != nil {
            self.rootViewController!.dismiss(animated: false, completion: dismissCompletion)
        } else {
            dismissCompletion()
        }
    }
}

