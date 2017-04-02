//
//  UITabBar+Separators.swift
//  fame
//
//  Created by Jeff Cohen on 3/30/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

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
extension UINavigationBar: Hideable {}
extension UITabBar: Separators {}
