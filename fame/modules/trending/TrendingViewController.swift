//
//  TrendingViewController.swift
//  fame
//
//  Created by Jeff Cohen on 3/30/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class TrendingViewController: BaseViewController, Tab {
    
    var defaultTabBarItem: UITabBarItem? {
        get {
            return UITabBarItem(title: nil, image: #imageLiteral(resourceName: "trending"), tag: 2)
        }
    }
}

// MARK - NavigationControllerChild
extension TrendingViewController {
    override func navigationTitle() -> String? { return "#TRENDING" }
}
