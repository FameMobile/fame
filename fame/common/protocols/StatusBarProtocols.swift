//
//  StatusBarProtocols.swift
//  fame
//
//  Created by Jeff Cohen on 3/31/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

protocol StatusBarBackground {
    func showStatusBarBackground()
    func hideStatusBarBackground()
}

extension StatusBarBackground where Self: UINavigationController {
    init(navigationBarClass: AnyClass? = nil, toolbarClass: AnyClass? = nil, hideStatusBarBackground: Bool) {
        self.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        self.addStatusBarBackground(hidden: hideStatusBarBackground)
    }
    
    fileprivate func addStatusBarBackground(hidden: Bool) {
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIApplication.shared.statusBarFrame.size.height))
        backgroundView.backgroundColor = Color.purple.uiColor
        backgroundView.tag = Tag.statusBarBackground.rawValue
        backgroundView.isHidden = hidden
        
        view.addSubview(backgroundView)
    }
    
    // A status bar background view is used to set the background color
    // If a view controller has content (i.e. image) that is expected to go behind the
    // status bar, then the background view should be hidden
    fileprivate func toggleVisibility(hidden: Bool) {
        if let statusBarBackground = self.view.viewWithTag(Tag.statusBarBackground.rawValue) {
            statusBarBackground.isHidden = hidden
        }
    }
    
    func hideStatusBarBackground() {
        self.toggleVisibility(hidden: true)
    }
    
    func showStatusBarBackground() {
        self.toggleVisibility(hidden: false)
    }
}
