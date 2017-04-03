//
//  TabBarProtocols.swift
//  fame
//
//  Created by Jeff Cohen on 3/31/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

protocol Tab {
    var defaultTabBarItem: UITabBarItem? { get }
}

extension Tab where Self: UIViewController {
    func withDefaultItem() -> UIViewController {
        if let tabBarItem = self.defaultTabBarItem {
            tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
            self.tabBarItem = tabBarItem
            
        }
        
        return self
    }
}

protocol Separators {
    func addSeparators(color: UIColor, width: CGFloat)
}

extension Separators where Self: UITabBar {
    func addDefaultSeparators() {
        addSeparators(color: Color.grayDark.uiColor, width: 1)
    }
    
    func addSeparators(color: UIColor, width: CGFloat) {
        if let items = self.items {
            let pixelScale = UIScreen.main.scale
            let itemWidth = floor(self.frame.size.width / CGFloat(items.count))
            // this is the separator width.  0.5px matches the line at the top of the tab bar
            let separatorWidth: CGFloat = width
            
            // iterate through the items in the Tab Bar, except the last one
            for i in 0...(items.count - 1) {
                // make a new separator at the end of each tab bar item
                let separator = UIView(frame: CGRect(x: itemWidth * CGFloat(i + 1) - CGFloat(separatorWidth / pixelScale), y: 7.5, width: CGFloat(separatorWidth), height: self.frame.size.height - 15))
                
                separator.backgroundColor = color
                separator.alpha = 1
                self.addSubview(separator)
            }
        }
    }
}
