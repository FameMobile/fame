//
//  StatusBarProtocols.swift
//  fame
//
//  Created by Jeff Cohen on 3/31/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

protocol StatusBarBackground {
    var statusBarBackground: UIView? { get }
}

extension StatusBarBackground where Self: UINavigationController {
    init(navigationBarClass: AnyClass? = nil, toolbarClass: AnyClass? = nil, hideStatusBarBackground: Bool) {
        self.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        self.addStatusBarBackground(hidden: hideStatusBarBackground)
    }
    
    fileprivate func addStatusBarBackground(hidden: Bool) {
        let backgroundView = UIView.color(Color.purple,
                                          x: 0,
                                          y: 0,
                                          width: UIScreen.main.bounds.size.width,
                                          height: UIApplication.shared.statusBarFrame.size.height)        
        backgroundView.tag = Tag.statusBarBackground.rawValue
        backgroundView.isHidden = hidden
        
        view.addSubview(backgroundView)
    }
    
    var statusBarBackground: UIView? {
        return self.view.viewWithTag(Tag.statusBarBackground.rawValue)
    }
}
