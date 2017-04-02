//
//  RTFViewController.swift
//  fame
//
//  Created by Jeff Cohen on 3/30/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class RTFViewController: BaseViewController, Tab {
    var defaultTabBarItem: UITabBarItem? {
        get {
            return UITabBarItem(title: nil, image: #imageLiteral(resourceName: "road_to_fame"), tag: 0)
        }
    }
}

// MARK - NavigationControllerChild
extension RTFViewController {
    override func navigationTitle() -> String? {
        return "MY ROAD TO FAME"
    }
}
