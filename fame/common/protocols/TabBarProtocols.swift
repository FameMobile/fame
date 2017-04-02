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
            self.tabBarItem = tabBarItem
        }
        
        return self
    }
}

protocol Separators {
    func addDefaultSeparators()
    func addSeparators(color: UIColor, width: CGFloat)
}

extension Separators where Self: UITabBar {
    func addDefaultSeparators() {
        addSeparators(color: Color.gray.uiColor, width: 0.5)
    }
    
    func addSeparators(color: UIColor, width: CGFloat) {
        if let items = self.items {
            let itemWidth = floor(self.frame.size.width / CGFloat(items.count))
            // this is the separator width.  0.5px matches the line at the top of the tab bar
            let separatorWidth: CGFloat = width
            
            // iterate through the items in the Tab Bar, except the last one
            for i in 0...(items.count - 1) {
                // make a new separator at the end of each tab bar item
                let separator = UIView(frame: CGRect(x: itemWidth * CGFloat(i + 1) - CGFloat(separatorWidth / 2), y: 0, width: CGFloat(separatorWidth), height: self.frame.size.height))
                
                separator.backgroundColor = color
                
                self.addSubview(separator)
            }
        }
    }
}
