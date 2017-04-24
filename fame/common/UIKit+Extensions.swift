//
//  UITabBar+Separators.swift
//  fame
//
//  Created by Jeff Cohen on 3/30/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

extension UIImage: Alpha, Resize, Round {}
extension UILabel: DefaultLabel {}
extension UINavigationController: StatusBarBackground {}
extension UITabBar: Separators {}

extension Bundle {
    static func loadView<T: UIView>(fromNib name: String, withType type: T.Type) -> T {
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }
        
        fatalError("Could not load view with type " + String(describing: type))
    }
}

extension UIViewController {
    func add(childViewController: UIViewController) {
        self.edgesForExtendedLayout = []
        self.addChildViewController(childViewController)
        childViewController.view.frame = self.view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(childViewController.view)
        childViewController.didMove(toParentViewController: self)
    }
}

extension UIView: Circular, Colorful, Hideable {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    var uiImage: UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, self.isOpaque, UIScreen.main.scale)
        if let currentContext = UIGraphicsGetCurrentContext() {
            currentContext.setAlpha(self.alpha)
            self.layer.render(in: currentContext)
            
            if let bgColor = self.backgroundColor?.cgColor {
                currentContext.setFillColor(bgColor)
            }
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            if let cgImage = image?.cgImage {
                return UIImage(cgImage: cgImage)
            }
        }
        return nil
    }
}
