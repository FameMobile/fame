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
    func addSeparators(color: Color, width: CGFloat)
}

extension Separators where Self: UITabBar {    
    func addSeparators(color: Color = Color.gray, width separatorWidth: CGFloat = StandardBorderThickness) {
        if let items = self.items {
            let itemWidth = floor(self.frame.size.width / CGFloat(items.count))
            let verticalInset = CGFloat(7.5)
            
            // iterate through the items in the Tab Bar, except the last one
            for i in 1...(items.count - 1) {
                // make a new separator at the end of each tab bar item
                let separator = UIView.color(color,
                                             x: itemWidth * CGFloat(i) - separatorWidth,
                                             y: verticalInset,
                                             width: separatorWidth,
                                             height: self.frame.size.height - (verticalInset * 2))
                self.addSubview(separator)
            }
        }
    }
}
