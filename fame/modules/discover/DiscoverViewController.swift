//
//  DiscoverViewController.swift
//  fame
//
//  Created by Jeff Cohen on 3/30/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController, Tab {
    var defaultTabBarItem: UITabBarItem? {
        get {
            return UITabBarItem(title: nil, image: #imageLiteral(resourceName: "resume"), tag: 1)
        }
    }
}

// MARK - NavigationControllerChild
extension DiscoverViewController {
    override func navigationTitle() -> String? { return "DISCOVER" }
    
}
