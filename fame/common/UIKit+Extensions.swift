//
//  UITabBar+Separators.swift
//  fame
//
//  Created by Jeff Cohen on 3/30/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

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

extension UILabel: DefaultLabel {}
extension UINavigationController: StatusBarBackground {}
extension UITabBar: Separators {}
extension UIView: Circular, Colorful, Hideable {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
}
